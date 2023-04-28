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

    public List<Outpass> getNormalOutpasses(){

        List<Outpass> normalOutpasses = new ArrayList<Outpass>();

        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String query = "SELECT * FROM outpass WHERE type = ? and hostel_no = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1,"normal");
            ps.setString(2,this.hostel_no);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Outpass outpass = new Outpass(
                    rs.getString(0),
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6)
                );

                normalOutpasses.add(outpass);
            }

            return normalOutpasses;

        }
        catch (Exception e){
            return null;
        }
    }

    public List<Outpass> getEmergencyOutpasses(){

        List<Outpass> normalOutpasses = new ArrayList<Outpass>();

        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/management", "root", "1234");
            
            String query = "SELECT * FROM outpass WHERE type = ? and hostel_no = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1,"emergency");
            ps.setString(2,this.hostel_no);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Outpass outpass = new Outpass(
                    rs.getString(0),
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6)
                );

                normalOutpasses.add(outpass);
            }

            return normalOutpasses;

        }
        catch (Exception e){
            return null;
        }
    }
}
