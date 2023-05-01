package src;

import java.io.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mysql.cj.Session;



/*
 * Servlet to display the warden view 
*/

public class Request extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        String name = request.getParameter("wid");
        String id = request.getParameter("oid");
        String hostel = request.getParameter("wid");
        String room = request.getParameter("oid");
        String out_date = request.getParameter("wid");
        String in_date = request.getParameter("oid");
        String out_time = request.getParameter("wid");
        String in_time = request.getParameter("oid");
        String priority = request.getParameter("wid");
        String reason = request.getParameter("oid");
        

        Outpass outpass = new Outpass(id,in_time,out_time,priority,reason,"requested");
        HttpSession session = request.getSession(false);
        Student dummy_student = (Student)session.getAttribute("student");
        dummy_student.updateOutpassCount();
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */