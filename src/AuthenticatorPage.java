package src;

import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Servlet to display the warden view 
*/

public class AuthenticatorPage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
        

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\authenticator.jsp");
        view.forward(request, response);   
        
        
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
        doPost(request,response);
    }
}


