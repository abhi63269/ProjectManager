package controller;

import static com.oracle.jrockit.jfr.ContentType.Bytes;
import dto.EditAccount;
import dto.ProjectDTO;
import dto.UserLogDTO;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ProjectRetrieveDB;
import model.RetrieveDatabase;
import model.TaskRetrieveDB;
import model.userCheckLog;
import org.json.JSONArray;

public class LoginPMHttpServlet extends HttpServlet 
{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.sendRedirect("login.html");
    }
public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
{
        int i=0,j=1,k=2,l=3,m=4,p=0,q=1,r=2,s=3,h=0,g=1,v=2,count=0;
        //Blob photo=null;
        ArrayList<String> projectid=new ArrayList();
        ArrayList<String> projectname=new ArrayList();
        ArrayList<String> taskid=new ArrayList();
        ArrayList<String> projectdescription= new ArrayList<String>();
        ArrayList<Byte> projectpicture= new ArrayList<Byte>();
        ArrayList<String>ProjectID=new ArrayList();
        ArrayList<String>TaskID=new ArrayList();
        ArrayList<String> CompleteTask=new ArrayList();
        ArrayList<String>TotalTask=new ArrayList();
        ArrayList<String>RemainingTask=new ArrayList();
        String username = req.getParameter("uname");
        String password = req.getParameter("password");
        UserLogDTO uld = new UserLogDTO();
        uld.setUsername(username);
        uld.setPasssword(password); 
        EditAccount ea= new EditAccount();
        RetrieveDatabase rd=new RetrieveDatabase();
        rd.retrieve(ea,username);
        String fname= ea.getFname();
        String lname= ea.getLname();
        String address = ea.getAddress();
        String contactno= ea.getContactno();
        String designation= ea.getDesignation();
        String email= ea.getEmail();
        String upassword= ea.getPassword();
        String pincode= ea.getPincode();
        String empid= ea.getEmpid();
        System.out.println("empid is "+empid);
        userCheckLog ucl = new userCheckLog();
        boolean check = ucl.isCheck(uld);
        System.out.println(check);
        ProjectRetrieveDB prdb=new ProjectRetrieveDB(); 
        ArrayList al=prdb.prdb(ea);
        int c=prdb.car();
        String noOfRows=String.valueOf(c);
        //ArrayList abhi=new ArrayList();
        //abhi=prdb.icare(ea);
        //int da=prdb.truck();
        /*ArrayList<InputStream>inputStream=new ArrayList<InputStream>();
        byte[]bytear=new byte[da];
        ArrayList<byte[]>bytearray=new ArrayList<byte[]>();
        ArrayList<Integer>len=new ArrayList<Integer>();
        int []lenarray=new int[da];
        //OutputStream out= resp.getOutputStream();
        //InputStream inputStream=test.getBinaryStream();
        System.out.println("al size:"+al.size());
        while(h<abhi.size())
        {
          bytearray.add((byte[]) abhi.get(h));
          h=h+3;
        }
        while(g<abhi.size())
        {
          len.add((Integer) abhi.get(g));
          g=g+3;
        }
        while(v<abhi.size())
        {
          inputStream.add((InputStream) abhi.get(v));
          v=v+3;
        }
        while(count<len.size())
        {
            String ss=len.get(count).toString();
            lenarray[count]=Integer.parseInt(ss);
            count=count+1;
        }
        count=0;
        /*while(count<bytearray.size())
        {
            bytear[count]=(byte[])bytearray.get(count);
        }*/
        while(i<al.size())
        {
            
            projectid.add((String) al.get(i));
            System.out.println("array list of project id:"+projectid);
            i=i+4;
        }
        while(j<al.size())
        {
            
            projectname.add((String) al.get(j));
            System.out.println("array list of projectname:"+al.get(j));
            j=j+4;
        }
        while(k<al.size())
        {
            
            taskid.add((String) al.get(k));
            System.out.println("array list of taskid:"+al.get(k));
            k=k+4;
        }
        while(l<al.size())
        {
            
            projectdescription.add((String) al.get(l));
            System.out.println("array list of taskid:"+al.get(l));
            l=l+4;
        }
        /*while(m<al.size())
        {
            
            photo= (Blob) al.get(m);
            System.out.println("photo:"+photo);
            m=m+5;
        }*/
        
            String Projectname;
            Projectname = String.valueOf(projectname.toString());
            System.out.println("Projectname"+Projectname);
        System.out.println("araay list al "+al);
      
       
        
        System.out.println("Servlet page projectname:"+projectname.get(0));
        TaskRetrieveDB trdb= new TaskRetrieveDB();
        ArrayList tasklist= trdb.trdb(ea);
        int d= trdb.bus();
        String TnoOfRows=String.valueOf(d);
        int TNoOfRows= Integer.parseInt(TnoOfRows);
        System.out.println("task size:"+tasklist.size());
       while(p<tasklist.size())
        {
            ProjectID.add((String) tasklist.get(p));
            //System.out.println("array list of project id:"+ProjectID);
            p=p+4;
        }
        while(q<tasklist.size())
        {
            
            TaskID.add((String) tasklist.get(q));
            //System.out.println("array list of TaskID:"+tasklist.get(q));
            q=q+4;
        }
        while(r<tasklist.size())
        {
            
            CompleteTask.add((String) tasklist.get(r));
            r=r+4;
        }
        while(s<tasklist.size())
        {
            
            TotalTask.add((String) tasklist.get(s));
            //System.out.println("array list of TotalTask:"+tasklist.get(s));
            s=s+4;
        }
        int u=0;
        while(u<TNoOfRows)
        {
            String str1= String.valueOf(CompleteTask.get(u));
            String str2= String.valueOf(TotalTask.get(u));
            int ghar=Integer.parseInt(str1);
            int hotel=Integer.parseInt(str2);
            int khel= hotel-ghar;
            RemainingTask.add(String.valueOf(khel));
            u=u+1;
        }
        
        System.out.println("ProjectID:"+ProjectID);
        System.out.println("TaskID:"+TaskID);
        System.out.println("CompleteTask:"+CompleteTask);
        System.out.println("TotalTask:"+TotalTask);
        System.out.println("RemainingTask:"+RemainingTask);
        resp.setContentType("image/gif");
         if(check)
        {
            System.out.println("in the if block");
            HttpSession session=req.getSession(true);
            session.setAttribute("fname", fname);
            session.setAttribute("lname", lname);
            session.setAttribute("address", address);
            session.setAttribute("contactno", contactno);
            session.setAttribute("designation", designation);
            session.setAttribute("email", email);
            session.setAttribute("upassword", upassword);
            session.setAttribute("pincode",pincode);
            session.setAttribute("empid", empid);
            session.setAttribute("projectid", projectid);
            session.setAttribute("projectname",projectname);
            session.setAttribute("taskid",taskid);
            session.setAttribute("noOfRows",noOfRows);
            session.setAttribute("Projectname",Projectname);
            session.setAttribute("ProjectID",ProjectID );
            session.setAttribute("TaskID",TaskID );
            session.setAttribute("CompleteTask",CompleteTask );
            session.setAttribute("TotalTask",TotalTask );
            session.setAttribute("RemainingTask", RemainingTask);
            session.setAttribute("projectdescription",projectdescription );
            //session.setAttribute("bytearray",bytearray);
            //session.setAttribute("lenarray",lenarray);
            //session.setAttribute("bytear",bytear);
            //session.setAttribute("out",out);
            resp.sendRedirect("dashboard2.jsp");
            
        }
        else
        {
            resp.sendRedirect("index.jsp");
        }}
}
