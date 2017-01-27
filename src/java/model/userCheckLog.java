package model;

import db.databaseLog;
import dto.UserLogDTO;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Statement;

public class userCheckLog 
{ 
    String tablepass="";
    public boolean isCheck(UserLogDTO uld)
    {
        String tableuname,tableupass;
        tableuname= uld.getUsername();
        
        tableupass=uld.getPasssword();
        System.out.println("tableupass"+tableupass);
        Statement st = databaseLog.getStatement();
        try
        {
          String sql= "select password from regrecord where email='"+tableuname+"'";
          System.out.println(sql);
          System.out.println("dhjhfkjhlkdajfhkljh");
          ResultSet rs=st.executeQuery(sql);
          if(rs.next())
            {
                System.out.println("sfdgds1");
                tablepass=rs.getString(1);
                System.out.println("tablepass"+tablepass);
            }
            else
            {
                return false;
            }
        }
        catch(SQLException e)
        {
            System.out.println("Error" +e);
        }
        if(tableuname!=null && tableupass!=null &&  !tableuname.trim().equals("") && !tableupass.trim().equals("")&&tablepass.equals(tableupass))
      {
        
            return true;
        
        }
        return false;
    }
}
