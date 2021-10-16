package com.example.calendar;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;



public class AuthActivity extends AppCompatActivity implements View.OnClickListener {

    // Переменные
    String varLogin ="", varPassword = "";

    // Вьюшки
    Button regButton, authButton;
    EditText login, password;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_auth);

        regButton = findViewById(R.id.RegButton);
        authButton = findViewById(R.id.AuthButton);
        login = findViewById(R.id.login);
        password = findViewById(R.id.password);

        regButton.setOnClickListener(this);
        authButton.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.AuthButton:

                varLogin = login.getText().toString();
                varPassword = password.getText().toString();

                if (varLogin != null && varPassword != null){

                }

                Intent Main= new Intent(this, MainActivity.class);
                startActivity(Main);
                break;
            case R.id.RegButton:
                Intent Registration = new Intent(this, RegActivity.class);
                startActivity(Registration);
                break;
        }
    }
}