package model;

import db.databaseLog;
import dto.EditAccount;
import dto.ProjectDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TaskRetrieveDB 
{
    ArrayList al = new ArrayList();
    int c=0;
    ProjectDTO pdto=new ProjectDTO();
    public ArrayList trdb(EditAccount ea)
    {
        try
        {
            String empid= ea.getEmpid();
            Statement st=databaseLog.getStatement();
            Connection con=databaseLog.getCon();
            String sql="select * from tasktable where EmpID='"+empid+"'";
            ResultSet rs= st.executeQuery(sql);
            while(rs.next())
            {
                c=c+1;
                al.add(rs.getString(1));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                
            }
             System.out.println("no of rows is c="+c);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return al;
        
    }
    public int bus()
    {
        return c;
    }
}
