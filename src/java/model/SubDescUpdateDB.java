package model;

import db.UpdateAccountDatabase;
import dto.SubDescUpdate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SubDescUpdateDB 
{
 public boolean mcheck(SubDescUpdate sdu) 
 {
     String textarea,selectstatus,sUBtaskid;
     textarea=sdu.getTextarea();
     selectstatus=sdu.getSelectstatus();
     sUBtaskid=sdu.getSubtaskID();
     Connection con = UpdateAccountDatabase.getCon();
     PreparedStatement pst= UpdateAccountDatabase.getSt();
     try
     {
         pst= con.prepareStatement("update subtasktable set Status=?,Comment=? where SubTaskID=?");
         pst.setString(1, selectstatus);
         pst.setString(2, textarea);
         pst.setString(3, sUBtaskid);
                 int i = pst.executeUpdate();

            if(i>0)
            {
                System.out.println(i+" Record Updated");
                return true;
            }
            else
            {
                System.out.println("Record Not Updated");
                return false;
            }
     }
     catch (SQLException e) 
        {
            System.out.println(e);
        }
        return false;
 }
}
