package com.example.calendar;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class AuthActivity extends AppCompatActivity implements View.OnClickListener {

    Button regButton, authButton;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_auth);

        regButton = findViewById(R.id.RegButton);
        authButton = findViewById(R.id.AuthButton);

        regButton.setOnClickListener(this);
        authButton.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.AuthButton:
                Intent Authorisation = new Intent(this, MainActivity.class);
                startActivity(Authorisation);
                break;
            case R.id.RegButton:
                Intent Registration = new Intent(this, RegActivity.class);
                startActivity(Registration);
                break;
        }
    }
}