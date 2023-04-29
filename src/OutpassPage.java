package src;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Servlet to display the warden view 
*/

public class OutpassPage extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        String warden_id = request.getParameter("wid");
        String outpass_id = request.getParameter("oid");
        String student_id = request.getParameter("sid");

        if(warden_id.equals("") || outpass_id.equals("")){
            RequestDispatcher view = request.getRequestDispatcher("/");
            view.forward(request, response);  
            return; 
        }
        HttpSession session = request.getSession(false);
        request.setAttribute("user", session.getAttribute("user"));
        
        Outpass outpass = new Outpass(outpass_id);
        request.setAttribute("outpass", outpass);
        request.setAttribute("warden_id", warden_id);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\outpass.jsp");
        view.forward(request, response);  
    }
}


