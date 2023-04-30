package src;

import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;



/*
 * Servlet to display the warden view 
*/

public class Reject extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        String warden_id = request.getParameter("wid");
        String outpass_id = request.getParameter("oid");

        Outpass outpass = new Outpass(outpass_id);
        
        outpass.updateStatus("rejected");
        response.sendRedirect("warden");
       
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */