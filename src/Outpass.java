package src;
import java.sql.*;
import java.math.*;
public class Outpass {

    Student student;
    String outpass_id;
    String in_time;
    String out_time;
    String type;
    String reason;
    String status;
    String student_id;
    String comment;
    String route;
    
    Outpass(String student_id,String outpass_id,String in_time,String out_time,String type,String reason,String status,String comment){
        this.student = new Student(student_id);
        this.outpass_id = outpass_id;
        this.in_time = in_time;
        this.out_time = out_time;
        this.type = type;
        this.reason = reason;
        this.status = status;
        this.comment =  comment;
    }
    Outpass(String student_id,String in_time,String out_time,String type,String reason,String status,String route){
        this.student = new Student(student_id);
        this.in_time = in_time;
        this.out_time = out_time;
        this.type = type;
        this.reason = reason;
        this.status = status;
        this.outpass_id = String.valueOf((int)Math.floor(Math.random()*9999));
        this.comment="";
        this.route=route;
    }
    Outpass(String outpass_id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "SELECT * FROM outpass WHERE outpass_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,outpass_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                this.student = new Student(rs.getString(1));
                this.outpass_id = rs.getString(2);
                this.in_time = rs.getString(3);
                this.out_time = rs.getString(4);
                this.type = rs.getString(5);
                this.reason = rs.getString(6);
                this.status = rs.getString(7);
                this.comment = rs.getString(8);
            }
            con.close();
            ps.close();
        }
        catch(Exception e){
            this.reason = "EXCEPTION "+ e.toString() ;
        }
    }
 
    @Override
    public String toString() {
      
        return "Outpass comment is "+this.comment;
    }

    public String getIn_time() {
        return in_time;
    }
    public String getOut_time() {
        return out_time;
    }
    public String getOutpass_id() {
        return outpass_id;
    }
    public String getReason() {
        return reason;
    }
    public String getStatus() {
        return status;
    }
    public Student getStudent() {
        return student;
    }
    public String getType() {
        return type;
    }
    public String getComment() {
        return comment;
    }
    public void updateStatus(String status){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "UPDATE outpass SET status = ? WHERE outpass_id = ?";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2,this.outpass_id);
            ps.executeUpdate();
            this.status = status;
                
            con.close();
            ps.close();
            
        }
        catch(Exception e){
            this.reason = "EXCEPTION "+ e.toString() ;
        }
    }
    public void makeOutpassID()
    {
        this.outpass_id="3";
    }

    public void updateComment(String comment){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "UPDATE outpass SET comment = ? WHERE outpass_id = ?";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, comment);
            ps.setString(2,this.outpass_id);
            ps.executeUpdate();
            
            this.comment = comment;
            con.close();
            ps.close();
            
        }
        catch(Exception e){
            this.reason = "EXCEPTION "+ e.toString() ;
        }
    }
    public void addOutpass(){

        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "INSERT INTO outpass VALUES (?,?,?,?,?,?,?,?)";
        
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, this.student.id);
            ps.setString(2,this.outpass_id);
            ps.setString(3, this.in_time);
            ps.setString(4, this.out_time);
            ps.setString(5, this.type);
            ps.setString(6, this.reason);
            ps.setString(7,"requested");
            ps.setString(8,null);
            ps.setString(9,this.route);
            ps.executeUpdate();
        
    
            con.close();
            ps.close();
            
        }
        catch(Exception e){
            this.reason = "EXCEPTION "+ e.toString() ;
        }
    }
}


