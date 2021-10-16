package com.example.calendar.interfaces;

import com.example.calendar.interfaces.Post;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface JSONPlaceHolderApi {
    @GET("/login/{email}/{password}")
    public Call<Post> getPostWithID(@Path("email,password") String password);
}
