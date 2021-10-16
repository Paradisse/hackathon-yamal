package com.example.calendar;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


public class RegActivity extends AppCompatActivity implements View.OnClickListener {

    // Переменные
    String varFirstName = "";
    String varLastName = "";
    String varPatronymic = "";

    // View
    EditText firstName;
    EditText lastName;
    EditText patronymic;
    Button regButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg);

        firstName = findViewById(R.id.firstName);
        lastName = findViewById(R.id.userName);
        patronymic = findViewById(R.id.patronymic);
        regButton = findViewById(R.id.regButton);

        regButton.setOnClickListener(this);


    }


    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.regButton:
                varFirstName = firstName.getText().toString();
                varLastName = lastName.getText().toString();
                varPatronymic = patronymic.getText().toString();
                /*
                Тут отправляем запрос на сервер
                 */
                Intent Main = new Intent(this, MainActivity.class);
                startActivity(Main);
                break;
        }
    }
}