import hashlib
import json
from flask import Flask, abort, make_response
from flask_restful import Api
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy.inspection import inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm.exc import NoResultFound
from marshmallow import Schema, fields


class Serializer(object):
    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]


app = Flask(__name__)
api = Api(app)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///hackathon.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = "True"
db = SQLAlchemy(app)
engine = create_engine("sqlite:///hackathon.db", echo=True)
Session = sessionmaker(bind=engine)


class UserModel(db.Model, Serializer):
    id = db.Column(db.Integer, primary_key=True, unique=True, autoincrement=True)
    first_name = db.Column(db.String(20))
    second_name = db.Column(db.String(20))
    patronymic = db.Column(db.String(20))
    email = db.Column(db.String(20), nullable=False, unique=True)
    password = db.Column(db.String(20), nullable=False)

    def serialize(self):
        d = Serializer.serialize(self)
        del d["password"]
        return d

    def __init__(self, first_name, second_name, patronymic, email, password):
        self.first_name = first_name
        self.second_name = second_name
        self.patronymic = patronymic
        self.email = email
        self.password = password

    def __repr__(self):
        return "<User(first_name={self.first_name!r})>".format(self=self)


UserSchema = Schema.from_dict(
    {"first_name": fields.Str(), "second_name": fields.Str(), "patronymic": fields.Str(), "email": fields.Str(),
     "password": fields.Str()}
)
session = Session()
schema = UserSchema()


@app.route("/login/<string:user_email>/<string:user_pass>", methods=["GET"])
def login(user_email, user_pass):
    try:
        hash_pass = hashlib.sha256(user_pass.encode("utf-8")).hexdigest()
        response = UserModel.query.filter(UserModel.email == user_email, UserModel.password == hash_pass).one()
        data = schema.dump(response)
        return make_response(data, 200)
    except NoResultFound:
        data = {"message": "No such user in db", "code": "ERROR"}
        return make_response(json.dumps(data), 404)


@app.route("/register/<string:user_email>/<string:user_pass>", methods=["POST"])
def register(user_email, user_pass):
    try:
        # TODO: add parsing args
        hash_pass = hashlib.sha256(user_pass.encode("utf-8")).hexdigest()
        user = UserModel(email=user_email, password=hash_pass, first_name=None, second_name=None, patronymic=None)
        db.session.add(user)
        db.session.commit()
        data = {"message": "User created", "code": "SUCCESS"}
        return make_response(json.dumps(data), 201)
    except TimeoutError as e:
        print(e)
        abort(400)


if __name__ == "__main__":
    app.run(debug=True)
