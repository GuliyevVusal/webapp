package com.influencer.educationsystemwebapp.teacher.repo;

import com.influencer.educationsystemwebapp.common.ComonRepo;
import com.influencer.educationsystemwebapp.common.MyDataBase;
import com.influencer.educationsystemwebapp.teacher.entity.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TeacherRepo implements ComonRepo<Teacher> {
    @Override
    public List<Teacher> getList() {
        List<Teacher> result = new ArrayList<>();
        try (Connection connection = MyDataBase.connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from teacher");
            while (resultSet.next()) {
                result.add(fillTeacher(resultSet));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    @Override
    public void update(Teacher obj) {
        try (Connection connection = MyDataBase.connect()) {
            PreparedStatement statement = connection.prepareStatement(
                    "update teacher set name =?, surname=? , email=? ,age=? , university=?,password=?  where id =?");
            statement.setString(1, obj.getName());
            statement.setString(2, obj.getSurname());
            statement.setString(3, obj.getEmail());
            statement.setInt(4, obj.getAge());
            statement.setString(5, obj.getUniversity());
            statement.setString(6,obj.getPassword());
            statement.setInt(7, obj.getId());

            statement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        try (Connection connection = MyDataBase.connect()) {
            PreparedStatement statement = connection.prepareStatement(
                    "delete from teacher where id =?");
            statement.setInt(1, id);
            statement.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void insert(Teacher obj) {
        try (Connection connection = MyDataBase.connect()) {
            PreparedStatement statement = connection.prepareStatement(
                    "insert into teacher (name , surname ,email,age,university,password) values(?,?,?,?,?,?) ");
            statement.setString(1, obj.getName());
            statement.setString(2, obj.getSurname());
            statement.setString(3, obj.getEmail());
            statement.setInt(4, obj.getAge());
            statement.setString(5, obj.getUniversity());
            statement.setString(6, obj.getPassword());
            statement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Teacher findById(int id) {
        try (Connection connection = MyDataBase.connect()) {
            PreparedStatement statement = connection.prepareStatement("select * from teacher where id =?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return fillTeacher(resultSet);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Teacher> getList(String name, String surname, String email, String university, Integer age, String password) {
        List<Teacher> result = new ArrayList<>();
        int index = 0;
        String query = "select * from teacher where 1=1 ";
        if (name != null && name.trim().length() > 0) {
            query += " and name =? ";
            index++;
        }
        if (surname != null && surname.trim().length() > 0) {
            query += " and surname =? ";
            index++;
        }
        if (email != null && email.trim().length() > 0) {
            query += " and email =? ";
            index++;
        }
        if (university != null && university.trim().length() > 0) {
            query += " and university =? ";
            index++;
        }
        if (age != null && age > 0) {
            query += " and age =? ";
            index++;
        }
        if (password != null && password.trim().length() > 0) {
            query += " and password=? ";
            index++;
        }
        try (Connection connection = MyDataBase.connect()) {
            PreparedStatement statement = connection.prepareStatement(query);

            if (password != null && password.trim().length() > 0) {
                statement.setString(index--, password);
            }

            if (age != null && age > 0) {
                statement.setInt(index--, age);
            }
            if (university != null && university.trim().length() > 0) {
                statement.setString(index--, university);
            }
            if (email != null && email.trim().length() > 0) {
                statement.setString(index--, email);
            }
            if (surname != null && surname.trim().length() > 0) {
                statement.setString(index--, surname);
            }
            if (name != null && name.trim().length() > 0) {
                statement.setString(index, name);
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                result.add(fillTeacher(resultSet));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    private static Teacher fillTeacher(ResultSet resultSet) throws Exception {
        Teacher teacher = new Teacher();
        teacher.setId(resultSet.getInt("id"));
        teacher.setName(resultSet.getString("name"));
        teacher.setSurname(resultSet.getString("surname"));
        teacher.setEmail(resultSet.getString("email"));
        teacher.setAge(resultSet.getInt("age"));
        teacher.setUniversity(resultSet.getString("university"));
        teacher.setPassword(resultSet.getString("password"));

        return teacher;
    }

}
