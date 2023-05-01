package src;
import java.sql.*;

public class Outpass {

    Student student;
    String outpass_id;
    String in_time;
    String out_time;
    String type;
    String reason;
    String status;
    String student_id;
    
    Outpass(String student_id,String outpass_id,String in_time,String out_time,String type,String reason,String status){
        this.student = new Student(student_id);
        this.outpass_id = outpass_id;
        this.in_time = in_time;
        this.out_time = out_time;
        this.type = type;
        this.reason = reason;
        this.status = status;
    }
    Outpass(String student_id,String in_time,String out_time,String type,String reason,String status){
        this.student = new Student(student_id);
        this.in_time = in_time;
        this.out_time = out_time;
        this.type = type;
        this.reason = reason;
        this.status = status;
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
            }
            con.close();
            ps.close();
        }
        catch(Exception e){
            this.reason = "EXCEPTION "+ e.toString() ;
        }
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

}


