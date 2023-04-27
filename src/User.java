package src;

import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class User {
    public String name;
    public String email;

    User(String name, String email){
        this.name = name;
        this.email = email;
    }

    User(String email){
        this.email = email;
    }

    public int login(String password) throws IOException, ServletException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "SELECT * FROM user WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1,this.email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String password_retieved = rs.getString("password");
                if(password.equals(password_retieved)){
                  this.name = rs.getString("name");
                  return 0;
                }
                else{
                    return 1;
                }
            }
            return 1;
        }
        catch (Exception e){
            return 1;
        }
        
    }

}