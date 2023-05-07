package src;
import java.sql.*;
//import java.util.*;

import java.util.*;


public class Transport extends User{

    String id;
    String designation;

    Transport(String id){
        this.id = id;
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String query = "SELECT * FROM transport, user where user.id=transport.id and transport.id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                this.name = rs.getString("name");
                this.email = rs.getString("email");
                this.designation = rs.getString("designation");
            }

            con.close();
            ps.close();
        }
        catch(Exception e){
            System.out.println("error");
        }
    }
    
    public String getId() {
        return id;
    }

    public List<String[]> getCurrentOutpasses(){
        
        List<String[]> passes = new ArrayList<String[]>();
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String query = "Select route, count(route) from outpass where outpass.status in ('approved','authenticated') group by route;";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                String route = rs.getString("route");
                String count = rs.getString("count(route)");
                passes.add(new String[]{route,count});
            }

           

            con.close();
            ps.close();
            return passes;
        }
        catch(Exception e){
            System.out.println("error");
            return null;
        }
    }

    
    public static void main(String[] args) {
        Transport transport = new Transport("9812");
        System.out.println(transport.getCurrentOutpasses().get(0)[0]);
    }
}


//SELECT * FROM student, user where user.id=student.id and student.id = 1
//SELECT * from OUTPASS where student_id = 1 and status NOT IN ("authenticated", "rejected");