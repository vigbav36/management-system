package src;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.IOException;

/*
 * Servlet to display the warden view 
*/

public class OutpassPage extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        String outpass_id = request.getParameter("oid");
        
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
       

        if(!user.type.equals("authenticator") && !user.type.equals("warden")){
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        Outpass outpass = new Outpass(outpass_id);
        request.setAttribute("outpass", outpass);
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF\\jsp\\outpass.jsp");
        view.forward(request, response);          
    }
}


