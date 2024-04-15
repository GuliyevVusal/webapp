package com.influencer.educationsystemwebapp.common;

import java.util.List;

public interface ComonRepo<T> {

    public  List<T> getList();

    public void update(T obj);

    public void delete(Integer id);

    public void insert(T obj);

    public T findById(int id);

    public List<T> getList(String name, String surname, String email, String university, Integer age, String password);

    }
