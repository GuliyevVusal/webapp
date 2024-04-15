package com.influencer.educationsystemwebapp.teacher.entity;


import com.influencer.educationsystemwebapp.common.Person;

public class Teacher extends Person {

    private String password;
    private String university;

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
