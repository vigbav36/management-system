package src;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;


public class Login extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        User user = new User(email);
        String type = user.login(password);

        if(type!=null){

            request.setAttribute("name", user.name);

            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            if(type.equals("warden")){
                RequestDispatcher view = request.getRequestDispatcher("/warden");
                view.forward(request, response);   
            }   
            else if(type.equals("student")){
                RequestDispatcher view = request.getRequestDispatcher("/student");
                view.forward(request, response);   
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
        doPost(request,response);
    }
}


//javac -cp "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\mysql-connector-j-8.0.32.jar;C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\outpass\WEB-INF\lib\servlet-api.jar" -d "WEb-INF\classes" --release 8 Login.java