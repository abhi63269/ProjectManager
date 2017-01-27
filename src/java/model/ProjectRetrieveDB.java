package model;

import db.databaseLog;
import dto.EditAccount;
import dto.ProjectDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

public class ProjectRetrieveDB 
{
    ArrayList al = new ArrayList();
    int c=0,d=0;
    ProjectDTO pdto=new ProjectDTO();
    public ArrayList prdb(EditAccount ea)
    {
        try
        {
            String empid= ea.getEmpid();
            Statement st=databaseLog.getStatement();
            Connection con=databaseLog.getCon();
            String sql="select * from projecttable where EmpID='"+empid+"'";
            ResultSet rs= st.executeQuery(sql);
            while(rs.next())
            {
                c=c+1;
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                //al.add(rs.getBinaryStream(6));
                /*InputStream input=rs.getBinaryStream(6);
                byte[] buffer = new byte[1024];*/
                
               
            }
            System.out.println("no of rows is c="+c);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return al;
    }
    public int car()
    {
        return c;
    }
    /*public ArrayList icare(EditAccount ea)
    {
        ArrayList abhi=new ArrayList();
        InputStream readImg=null;
        String imglen="";
       try
        {
            String empid= ea.getEmpid();
            Statement st=databaseLog.getStatement();
            Connection con=databaseLog.getCon();
            String sql1="select * from projecttable where EmpID='"+empid+"'";
            ResultSet rs= st.executeQuery(sql1);
            while(rs.next())
            {
                d=d+1;
                imglen=rs.getString(2);
                int len = imglen.length();
                byte[] rb = new byte [len];
                readImg = rs.getBinaryStream(2);
                readImg.read(rb,0,len);
                abhi.add(rb);
                abhi.add(len);
                abhi.add(readImg);
            }
        }
       catch(SQLException e)
        {
            System.out.println(e);
        }
       catch(IOException e)
        {
            System.out.println(e);
        }
    return abhi;     
    }
    public int truck()
    {
        return d;
    }*/
}
