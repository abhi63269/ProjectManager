package controller;
import dto.SubTaskDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SubTaskRetrieveDB;
public class TaskSectionHttpServlet extends HttpServlet 
{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        
        int i=0,j=1,k=2,l=3,m=4,count=0;
       System.out.println("welcome to task section page@@@@@@@@"); 
       HttpSession session= req.getSession(true);
       String empid= (String) session.getAttribute("empid");
       String taskid= req.getParameter("proid");
       System.out.println("taskid:"+taskid);   
       SubTaskDTO stdto=new SubTaskDTO();
       stdto.setEmpid(empid);
       stdto.setTaskid(taskid);
       SubTaskRetrieveDB str= new SubTaskRetrieveDB();
       ArrayList<String>subtaskdata= new ArrayList<String>();
       subtaskdata=str.strdb(stdto);
       int row=str.bhejo();
        System.out.println("row size:"+row);
       String noOfRows=String.valueOf(row);
       String []subtaskid=new String[row];
       String []subtaskname=new String[row];
       String[]subtaskstartdate=new String[row];
       String []subtaskdeadline=new String[row];
       String []subtaskstatus=new String[row];
       String pname=str.retrieve(stdto);
       String pid=str.getPid();
       String pdescription=str.getPdescription();
       while(i<subtaskdata.size())
       {
           subtaskid[count]=subtaskdata.get(i);
           i=i+5;
           count=count+1;
        }
       count=0;
       while(j<subtaskdata.size())
       {
           
           subtaskname[count]=subtaskdata.get(j);
           j=j+5;
           count++;
       }
       count=0;
       while(k<subtaskdata.size())
       {
           subtaskstartdate[count]=subtaskdata.get(k);
           k=k+5;
           count++;
       }
       count=0;
       while(l<subtaskdata.size())
       {
           subtaskdeadline[count]=subtaskdata.get(l);
           l=l+5;
           count++;
       }
       count=0;
       while(m<subtaskdata.size())
       {
           subtaskstatus[count]=subtaskdata.get(m);
           m=m+5;
           count++;
       }
       for(int lo=0;lo<row;lo++)
       {
        System.out.println("subtaskid"+subtaskid[lo]);
        System.out.println("subtaskname"+subtaskname[lo]);
        System.out.println("subtaskdeadline"+subtaskdeadline[lo]);
        System.out.println("subtaskstartdate:"+subtaskstartdate[lo]);
        System.out.println("subtaskstatus"+subtaskstatus[lo]);   
       }
        session.setAttribute("taskid",taskid);
        session.setAttribute("subtaskid",subtaskid );
        session.setAttribute("subtaskname",subtaskname );
        session.setAttribute("subtaskdeadline",subtaskdeadline );
        session.setAttribute("subtaskstatus",subtaskstatus );
        session.setAttribute("subtaskstartdate",subtaskstartdate );
        session.setAttribute("pname", pname);
        session.setAttribute("pid", pid);
        session.setAttribute("pdescription",pdescription);
        session.setAttribute("row", row);
        resp.sendRedirect("task1.jsp");
        
    }
}
