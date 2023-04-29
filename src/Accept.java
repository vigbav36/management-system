package src;

import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;


import java.net.URL;
import java.net.HttpURLConnection;
import java.io.OutputStreamWriter;

/*
 * Servlet to display the warden view 
*/

public class Accept extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        String warden_id = request.getParameter("wid");
        String outpass_id = request.getParameter("oid");

        Outpass outpass = new Outpass(outpass_id);
        
        outpass.updateStatus("approved");
        response.sendRedirect("warden");
       
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */