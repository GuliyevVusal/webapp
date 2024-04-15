package com.influencer.educationsystemwebapp.student.entity;


import com.influencer.educationsystemwebapp.common.Person;

public class Student extends Person {

    private String university;

    private String password;
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
