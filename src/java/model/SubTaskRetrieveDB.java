package model;

import db.databaseLog;
import dto.ProjectDTO;
import dto.SubTaskDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SubTaskRetrieveDB 
{
    int c=0;
    String pname="",pdescription="",pid="";

    public String getPname() {
        return pname;
    }

    public String getPdescription() {
        return pdescription;
    }

    public String getPid() {
        return pid;
    }
 public ArrayList strdb(SubTaskDTO stdto)
 {
     
    ArrayList<String>subtaskdata=new ArrayList<String>();
    String empid=stdto.getEmpid();
    String taskid=stdto.getTaskid();
    try
    {
    Statement st=databaseLog.getStatement();
    Connection con=databaseLog.getCon();
    String sql="select * from subtasktable where TaskID='"+taskid+"' and Empid='"+empid+"'";
    ResultSet rs= st.executeQuery(sql);
    while(rs.next())
    {
        c=c+1;
        subtaskdata.add(rs.getString(2));
        subtaskdata.add(rs.getString(3));
        subtaskdata.add(rs.getString(4));
        subtaskdata.add(rs.getString(5));
        subtaskdata.add(rs.getString(6));
        
    }
    }
    catch(SQLException e)
    {
            System.out.println(e);
    }
    return subtaskdata;
}
 public String retrieve(SubTaskDTO stdto)
 {
     
     String empid=stdto.getEmpid();
    String taskid=stdto.getTaskid();
     try
     {
      Statement st=databaseLog.getStatement();
      Connection con=databaseLog.getCon();
      String sql="select * from projecttable where Empid='"+empid+"' and TaskID='"+taskid+"'";
      ResultSet rs= st.executeQuery(sql);
      if(rs.next())
      {
       pid=(rs.getString(1));
       pname=(rs.getString(2));
       pdescription=(rs.getString(5));
      }
      
     }
     catch(SQLException e)
    {
            System.out.println(e);
    }
     return pname;
 }
 public int bhejo()
 {
     return c;
 }
}
