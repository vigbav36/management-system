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

        HttpSession session = request.getSession(false);
        Student student = (Student)session.getAttribute("student");
        User user = (User)session.getAttribute("user");
        
        String name = student.name;
        String id = user.id;

        String out_date = request.getParameter("out_date");
        String in_date = request.getParameter("in_date");
    
        String priority = request.getParameter("priority").toLowerCase();
        String reason = request.getParameter("reason");
        

        Outpass outpass = new Outpass(id,in_date,out_date,priority,reason,"requested");
        outpass.addOutpass();
        //student.updateOutpassCount();

        PrintWriter out = response.getWriter();
        out.println(name+" "+id+" "+in_date+" "+out_date+" "+priority+" "+reason);
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */