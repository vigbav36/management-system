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
        String email = request.getParameter("email");
        String name = String.valueOf(request.getAttribute("name"));
        
        Warden warden = new Warden(name,email);

        List<Outpass> normalOutpasses = warden.getNormalOutpasses();
        List<Outpass> emergencyOutpasses = warden.getEmergencyOutpasses();

        request.setAttribute("email", email);
        request.setAttribute("name", name);

        if(normalOutpasses!=null){
            request.setAttribute("normalOutpasses", normalOutpasses);
        }
        else{
            request.setAttribute("normalOutpasses", "exception");
        }
        request.setAttribute("emergencyOutpasses", emergencyOutpasses);
        request.setAttribute("warden", warden); 

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\warden.jsp");
        view.forward(request, response);   
    }
}


