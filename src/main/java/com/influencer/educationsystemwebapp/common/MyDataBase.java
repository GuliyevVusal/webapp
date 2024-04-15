package com.influencer.educationsystemwebapp.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDataBase {
    public static Connection connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/education?user=root&password" +
                "=root&characterEncoding=UTF-8");

    }
}
