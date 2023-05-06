package src;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mysql.cj.conf.ConnectionUrlParser.Pair;

import java.util.*;
/*
 * Servlet to display the warden view 
*/

public class TransportPage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
        
        Transport transport_guy = new Transport(user.id);
     
        List<String[]> outpass_list = transport_guy.getCurrentOutpasses();

        request.setAttribute("outpass_list",outpass_list);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\transport.jsp");
        view.forward(request, response);   
        
        
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
        doPost(request,response);
    }
}


