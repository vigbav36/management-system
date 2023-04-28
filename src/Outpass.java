package src;
import java.util.*;

public class Outpass {

    Student student;
    String outpass_id;
    String in_time;
    String out_time;
    String type;
    String reason;
    String status;

    
    Outpass(String student_id,String outpass_id,String in_time,String out_time,String type,String reason,String status){
        this.student = new Student(student_id);
        this.outpass_id = outpass_id;
        this.in_time = in_time;
        this.out_time = out_time;
        this.type = type;
        this.reason = reason;
        this.status = status;
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

}


