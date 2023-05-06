package src;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Reject extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        String warden_id = request.getParameter("wid");
        String outpass_id = request.getParameter("oid");
        String comment = request.getParameter("reason");

        Outpass outpass = new Outpass(outpass_id);
        
        outpass.updateStatus("rejected");

        if(!comment.equals("")){
            outpass.updateComment(comment);
        }

        response.sendRedirect("warden");
       
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */