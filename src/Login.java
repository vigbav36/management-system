package src;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

//import User.*;

public class Login extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        User user = new User(email);
        
        if(user.login(password) == 0){
            request.setAttribute("name",user.name);
            RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\warden.jsp");
            view.forward(request, response);   
        }
    }
}


///javac -cp "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\mysql-connector-j-8.0.32.jar;C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\servlet-api.jar" -d "WEb-INF\classes" --release 8 Login.java