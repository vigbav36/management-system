package src;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
/*
 * Servlet to display the warden view 
*/

public class StudentPage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
        
        Student student = new Student(user.id);
        
        request.setAttribute("student", student);
        session.setAttribute("student", student);
        request.setAttribute("requested", false);

        Outpass outpass = student.getExistingOutpass();
        List<Outpass> outpass_list = student.getAllOutpasses();

        if(outpass != null){
            request.setAttribute("existing", true);
            request.setAttribute("existing_outpass",outpass);
           
            
        }
        request.setAttribute("all_outpasses",outpass_list);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\student.jsp");
        view.forward(request, response);   
        
        
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
        doPost(request,response);
    }
}


