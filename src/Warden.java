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

    Warden(String email){
        super(email);
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
           
            con.close();
            ps.close();

            return "";
        }
        catch(Exception e){
            return "";
        }
    }

    
    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public String getId() {
        return super.getId();
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
                    query = "SELECT * FROM outpass where student_id in (select id from student where hostel_no = ?) and status in ('under review', 'requested')";
                    ps = con.prepareStatement(query);
                    ps.setString(1,this.hostel_no);
                }
                else{
                    query = "SELECT * FROM outpass WHERE type = ? and student_id in (select id from student where hostel_no = ?) and status in ('under review', 'requested')";
                    ps = con.prepareStatement(query);
                    ps.setString(1,type);
                    ps.setString(2,this.hostel_no);
                }
                rs = ps.executeQuery();

                
            }
            else{
                query = "SELECT * FROM outpass where status= ? and student_id in (select id from student where hostel_no = ?) and status in ('under review', 'requested') ";
                ps = con.prepareStatement(query);
                ps.setString(1,status);
                ps.setString(2,this.hostel_no);
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
                        rs.getString(7),
                        rs.getString(8)
                    );
                    Outpasses.add(outpass);
                    
                }

                catch (Exception e){
                    System.out.println(e.toString());
                }
            }
            rs.close();
            con.close();
            ps.close();
            return Outpasses;
        }
        catch (Exception e){
            System.out.println(e.toString());

            return null;
        }
    }

    public static void main(String[] args) {
        Warden warden = new Warden("varsha","warden@ssn.edu.in");
        System.out.println(warden.getOutpasses("emergency", null));
    }
}
