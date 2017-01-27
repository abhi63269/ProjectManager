package model;

import db.databaseLog;
import dto.SubTaskDescDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SubTaskRetrieveDescDB 
{
 public ArrayList get(SubTaskDescDTO stddto)
 {
     ArrayList<String> subtaskdesc=new ArrayList<String>();
     String taskid= stddto.getTaskid();
     String subtaskid= stddto.getSubtaskid();
    try
    {
    Statement st=databaseLog.getStatement();
    Connection con=databaseLog.getCon();
    String sql="select * from subtasktable where TaskID='"+taskid+"' and SubTaskID='"+subtaskid+"'";
    ResultSet rs= st.executeQuery(sql);
    if(rs.next())
    {
      subtaskdesc.add(rs.getString(3));
     subtaskdesc.add(rs.getString(8));
     subtaskdesc.add(rs.getString(4));
     subtaskdesc.add(rs.getString(5));
     subtaskdesc.add(rs.getString(6));
     subtaskdesc.add(rs.getString(9));
    } 
 }
    catch(SQLException e)
            {
            System.out.println(e);
            }
    return subtaskdesc;
}
}

