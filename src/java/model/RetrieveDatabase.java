package model;

import db.UpdateAccountDatabase;
import db.databaseLog;
import dto.EditAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RetrieveDatabase 
{
    public void retrieve(EditAccount ea ,String username)
    {
        try
        {
            Connection con=databaseLog.getCon();
            Statement st=databaseLog.getStatement();
            String sql = "select * from regrecord where Email='"+username+"'";
            ResultSet rs= st.executeQuery(sql);
            if(rs.next())
            {
                ea.setFname(rs.getString(1));
                ea.setLname(rs.getString(2));
                ea.setAddress(rs.getString(3));
                ea.setPincode(rs.getString(4));
                ea.setContactno(rs.getString(5));
                ea.setEmail(rs.getString(6));
                ea.setDesignation(rs.getString(7));
                ea.setEmpid(rs.getString(8));
               ea.setPassword(rs.getString(9));
                
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
    }
}
