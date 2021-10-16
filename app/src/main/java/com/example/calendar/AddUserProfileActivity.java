package com.example.calendar;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.Calendar;

public class AddUserProfileActivity extends AppCompatActivity implements View.OnClickListener {

    // Views
    DatePickerDialog.OnDateSetListener setListener;
    TextView showBirthData;
    Button createUser;
    String[] chooseSexDict = {"Мужской","Женский"};
    String[] notesDict = {"Болезнь 1", "Болезнь 2"};
    EditText userName;
    TextView birthDate;



    //Vars
    public String varUserName = "";
    public String varUserBirthDay = "";
    public String varUserSex = "";
    public String varUserNotes = "";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_user_profile);

        birthDate = findViewById(R.id.birthDate);
        createUser = findViewById(R.id.createUser);
        userName = findViewById(R.id.userName);


        Spinner spinnerSex = (Spinner) findViewById(R.id.spinnerSex);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, chooseSexDict);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerSex.setAdapter(adapter);



        Spinner notes = (Spinner) findViewById(R.id.spinnerNotes);
        ArrayAdapter<String> adapterSecond = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, notesDict);
        adapterSecond.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        notes.setAdapter(adapterSecond);


        showBirthData = findViewById(R.id.birthDate);
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        showBirthData.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    DatePickerDialog datePickerDialog = new DatePickerDialog
                            (AddUserProfileActivity.this,
                                    R.style.Base_Theme_AppCompat_Dialog_MinWidth,
                                    setListener,year,month,day);
                    datePickerDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    datePickerDialog.show();
            }

        });

        setListener = new DatePickerDialog.OnDateSetListener(){
            @Override
            public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                month = month + 1;
                String data = dayOfMonth + "/" + month + "/" + year;
                showBirthData.setText(data);
            }

        };
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.createUser:
                varUserName = userName.getText().toString();
                varUserBirthDay = birthDate.getText().toString();
                break;

        }
    }
}