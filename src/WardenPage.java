package src;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Servlet to display the warden view 
*/

public class WardenPage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");

        String email = user.email;
        String name =  user.name;

        Warden warden = new Warden(name,email);

        List<Outpass> normalOutpasses = warden.getOutpasses("all",null);
        List<Outpass> emergencyOutpasses = warden.getOutpasses("emergency",null);
        List<Outpass> reviewOutpasses = warden.getOutpasses(null, "review");
        
        
        request.setAttribute("email", email);
        request.setAttribute("name", name);

        if(normalOutpasses!=null){
            request.setAttribute("normalOutpasses", normalOutpasses);
        }
        else{
            request.setAttribute("normalOutpasses", "exception");
        }
        request.setAttribute("emergencyOutpasses", emergencyOutpasses);
        request.setAttribute("reviewOutpasses", reviewOutpasses);

        request.setAttribute("warden", warden);     
        
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\warden.jsp");
        view.forward(request, response);   
        
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
        doPost(request,response);
    }
}


