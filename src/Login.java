package src;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Login extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String query = "SELECT * FROM user WHERE email = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                String password_retieved = rs.getString("password");
                //String type = rs.getString("type");
                
                if(password.equals(password_retieved)){
                    request.setAttribute("name","varsha");
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\warden.jsp");
                    view.forward(request, response);   
                }
            }
        }
        catch(Exception e){
            out.println(e);
        }
            
    }
}


///javac -cp "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\mysql-connector-j-8.0.32.jar;C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\servlet-api.jar" -d "WEb-INF\classes" --release 8 Login.java