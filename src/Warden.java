package src;
import java.util.*;
import java.sql.*;

public class Warden extends User{
    
    public String hostel_no;

    Warden(String name,String email){
        super(name,email);
        this.type="warden";
        this.hostel_no = getHostelNo();
    }

    String getHostelNo(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query = "SELECT * FROM warden WHERE id = (select id from user where email = ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,this.email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getString("hostel_no");
            }
            return "6g";
        }
        catch(Exception e){
            return "66";
        }
    }

    
    @Override
    public String getName() {
        return super.getName();
    }

    public String getEmail(){
        return this.email;
    }

    public String getHostel_no() {
        return hostel_no;
    }

    
    @Override
    public String toString(){
        return "User "+this.name+" and email = "+this.email;
    }

    public List<Outpass> getOutpasses(String type, String status){

        List<Outpass> Outpasses = new ArrayList<Outpass>();

        try{

            //Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            String query;
            PreparedStatement ps;
            ResultSet rs;

            if(type!=null){
                if(type.equals("all")){
                    query = "SELECT * FROM outpass where student_id in (select id from student where hostel_no = ?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1,this.hostel_no);
                }
                else{
                    query = "SELECT * FROM outpass WHERE type = ? and student_id in (select id from student where hostel_no = ?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1,type);
                    ps.setString(2,this.hostel_no);
                }
                rs = ps.executeQuery();
            }
            else{
                query = "SELECT * FROM outpass where status= ? and student_id in (select id from student where hostel_no = ?)";
                ps = con.prepareStatement(query);
                ps.setString(1,status);
                rs = ps.executeQuery();
            }
            while(rs.next()){
                try{
                    Outpass outpass = new Outpass(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                    );
                    Outpasses.add(outpass);
                }

                catch (Exception e){
                    System.out.println(e.toString());
                }
            }
            return Outpasses;
        }
        catch (Exception e){
            return null;
        }
    }
}
