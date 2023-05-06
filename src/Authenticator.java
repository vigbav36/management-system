package src;
import java.util.*;
import java.sql.*;

public class Authenticator extends User{

    String position;
    String designation;

    Authenticator(String email){
        super(email);
    }

    public void authenticate(String outpass_id){
        Outpass outpass = new Outpass(outpass_id);
        outpass.updateStatus("authenticated");
    }
}