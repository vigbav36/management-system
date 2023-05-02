package src;

import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;



/*
 * Servlet to display the warden view 
*/

public class Review extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        //String warden_id = request.getParameter("wid");
        String outpass_id = request.getParameter("oid");
        String comment = request.getParameter("reason");

        Outpass outpass = new Outpass(outpass_id);
        
        outpass.updateStatus("under review");

        if(!comment.equals("")){
            outpass.updateComment(comment);
        }

        response.sendRedirect("warden");
    
    }
}