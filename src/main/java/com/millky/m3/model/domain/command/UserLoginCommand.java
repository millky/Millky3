package com.millky.m3.model.domain.command;


import lombok.Data;

@Data
public class UserLoginCommand
{
    private String userId;
    private String password;
    private String url;

}
