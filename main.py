import json

from flask import Flask, request, abort, jsonify, make_response
from flask_restful import Api, Resource, reqparse, fields, marshal_with
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm.exc import NoResultFound
import hashlib
from sqlalchemy.inspection import inspect


class Serializer(object):
    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]


app = Flask(__name__)
api = Api(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///hackathon.db'
db = SQLAlchemy(app)
engine = create_engine('sqlite:///hackathon.db', echo=True)
Session = sessionmaker(bind=engine)

user_put_args = reqparse.RequestParser()
user_put_args.add_argument("first_name", type=str)
user_put_args.add_argument("second_name", type=str)
user_put_args.add_argument("patronymic", type=str)
user_put_args.add_argument("email", type=str)
user_put_args.add_argument("password", type=str)


class UserModel(db.Model, Serializer):
    id = db.Column(db.Integer, primary_key=True, unique=True, autoincrement=True)
    first_name = db.Column(db.String(20))
    second_name = db.Column(db.String(20))
    patronymic = db.Column(db.String(20))
    email = db.Column(db.String(20), nullable=False, unique=True)
    password = db.Column(db.String(20), nullable=False)

    def serialize(self):
        d = Serializer.serialize(self)
        del d['password']
        return d

    def __init__(self, first_name, second_name, patronymic, email, password):
        self.first_name = first_name
        self.second_name = second_name
        self.patronymic = patronymic
        self.email = email
        self.password = password

    def __repr__(self):
        return "<User('%s','%s', '%s', '%s', '%s')>" % (self.second_name, self.first_name, self.patronymic,
                                                        self.email, self.password)


res_fields = {
    "id": fields.Integer,
    "email": fields.String,
    "first_name": fields.String,
    "second_name": fields.String,
}
session = Session()


@app.route("/login/<string:user_email>/<string:user_pass>", methods=['GET'])
def login(user_email, user_pass):
    try:
        hash_pass = hashlib.sha256(user_pass.encode('utf-8')).hexdigest()
        response = UserModel.query.filter(UserModel.email == user_email, UserModel.password == hash_pass).one()
        data = json.dumps(response.serialize())
        return make_response(data, 200)
    except NoResultFound:
        data = {'message': 'No such user in db', 'code': 'ERROR'}
        return make_response(jsonify(data), 404)


@app.route("/register/<string:user_email>/<string:user_pass>", methods=['POST'])
def register(user_email, user_pass):
    try:
        args = user_put_args.parse_args()
        hash_pass = hashlib.sha256(user_pass.encode('utf-8')).hexdigest()
        user = UserModel(first_name=args['first_name'], second_name=args['second_name'], patronymic=args['patronymic'],
                         email=user_email, password=hash_pass)
        db.session.add(user)
        db.session.commit()
        data = {'message': 'User created', 'code': 'SUCCESS'}
        return make_response(jsonify(data), 201)
    except TimeoutError as e:
        print(e)
        abort(400)


if __name__ == "__main__":
    app.run(debug=True)
