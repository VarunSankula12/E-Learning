package com.codebook.Connections;
import java.sql.*;
public class connectionFactory {
    private static Connection connection=null;
    static
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root", "");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    public static Connection getconnection()
    {
        return connection;
    }
    public static void closeConnection()
    {
        try{
        connection.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
