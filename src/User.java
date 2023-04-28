package src;

import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class User {
    public String name;
    public String email;
    public String type;

    User(String name, String email){
        this.name = name;
        this.email = email;
    }

    User(String email){
        this.email = email;
    }

    public String getName() {
        return name;
    }
    public String getEmail() {
        return email;
    }
    
    public String login(String password) throws IOException, ServletException{
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
                    this.type = rs.getString("type");
                    return this.type;
                }
                else{
                    return null;
                }
            }
            return null;
        }
        catch (Exception e){
            return null;
        }
    }

}