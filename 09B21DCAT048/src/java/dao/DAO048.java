/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
/**
 *
 * @author ADMIN
 */
public class DAO048 {
    public static Connection con;
    
    public DAO048(){
        if(con == null){
            String dbUrl = "jdbc:mysql://localhost:3306/qlst?autoReconnect=true&useSSL=false";
            String dbClass = "com.mysql.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection (dbUrl, "root","");
            }catch(ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
