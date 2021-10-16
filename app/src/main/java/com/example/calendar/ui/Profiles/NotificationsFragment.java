package com.example.calendar.ui.Profiles;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;

import com.example.calendar.AddUserProfileActivity;
import com.example.calendar.MainActivity;
import com.example.calendar.R;
import com.example.calendar.databinding.FragmentNotificationsBinding;




public class NotificationsFragment extends Fragment implements View.OnClickListener {

    private NotificationsViewModel notificationsViewModel;
    private FragmentNotificationsBinding binding;




    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
       // return super.onCreateView(inflater, container, savedInstanceState);
        View rootView =
                inflater.inflate(R.layout.fragment_notifications,container,false);

        Button addUser = (Button) rootView.findViewById(R.id.addUser);
        addUser.setOnClickListener(this);
        return rootView;
    }


    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.addUser:
                    Intent AddUseProfileActivity = new Intent(getContext(),AddUserProfileActivity.class);
                    startActivity(AddUseProfileActivity);
                    break;
        }

    }
}