package src;
import java.sql.*;
import java.util.*;

public class Student extends User{

    String id;
    String hostel_no;
    String room_no;
    int outpasses;
    String branch;
    int year;

    Student(String id){
        this.id = id;
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String query = "SELECT * FROM student, user where user.id=student.id and student.id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                this.hostel_no = rs.getString("hostel_no");
                this.outpasses = rs.getInt("no_outpasses");
                this.room_no = rs.getString("room_no");
                this.name = rs.getString("name");
                this.email = rs.getString("email");
                this.branch = rs.getString("branch");
                this.year=rs.getInt("year");
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
    public String getHostel_no() {
        return hostel_no;
    }
    public String getRoom_no() {
        return room_no;
    }
    public int getOutpasses() {
        return outpasses;
    }
    public int getYear() {
        return year;
    }
    public String getBranch() {
        return branch;
    }

    public void updateOutpassCount(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "UPDATE student SET no_outpasses = ? WHERE id = ?";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.outpasses-1);
            ps.setString(2,this.id);
            ps.executeUpdate();
            
            con.close();
            ps.close();
            
        }
        catch(Exception e){
            e.toString() ;
        }
    }
    public Outpass getExistingOutpass(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "SELECT * from OUTPASS where student_id = ? and status NOT IN (\"authenticated\", \"rejected\")";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.id);
            ResultSet rs = ps.executeQuery();
            
            Outpass outpass  = null;

            while(rs.next()){
                outpass = new Outpass(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8)
                );
                break;
            }
            con.close();
            ps.close();
            return outpass;
        }
        catch(Exception e){
            e.toString() ;
            return null;
        }
        
    }
    public List<Outpass> getOutpassDets(){
        List<Outpass> result = new ArrayList<Outpass>();
        return result;
    }

    public static void main(String[] args) {
        Student student = new Student("1");
        System.out.println(student.getExistingOutpass().comment);
    }
}


//SELECT * FROM student, user where user.id=student.id and student.id = 1
//SELECT * from OUTPASS where student_id = 1 and status NOT IN ("authenticated", "rejected");