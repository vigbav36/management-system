package src;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Authenticate extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");

        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
        
        if(!user.type.equals("authenticator")){
            response.sendRedirect(request.getContextPath() + "/");
        }
        String outpass_id = request.getParameter("oid");
        
        Authenticator authenticator = new Authenticator(user.email);
        authenticator.authenticate(outpass_id);
        response.sendRedirect("authenticator");
        return;
    }
}


/*
 
RequestDispatcher dispatcher = request.getRequestDispatcher("/view");
dispatcher.forward(request, response);

 */