package controller;

import dto.SubTaskDescDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SubTaskRetrieveDescDB;
public class SubTaskDescHttpServlet extends HttpServlet 
{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       
    }

  
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session= req.getSession(true);
        String taskid=(String) session.getAttribute("taskid");
        String SUBTASKID= req.getParameter("broid").toString();
        System.out.println("TaskID:"+taskid+" SubTaskID:"+SUBTASKID);
         SubTaskDescDTO stddto=new SubTaskDescDTO();
         stddto.setSubtaskid(SUBTASKID);
         stddto.setTaskid(taskid);
         SubTaskRetrieveDescDB strddb= new SubTaskRetrieveDescDB();
         ArrayList<String>subtaskdesc= new ArrayList<String>();
         subtaskdesc=strddb.get(stddto);
         String subtaskNAME= subtaskdesc.get(0).toString();
         String subtaskdescrip= subtaskdesc.get(1).toString();
         String subtaskstartdate= subtaskdesc.get(2).toString();
         String subtaskdeadli= subtaskdesc.get(3).toString();
         String subtaskstat= subtaskdesc.get(4).toString();
         String subtaskcomment= subtaskdesc.get(5).toString();
         session.setAttribute("subtaskNAME",subtaskNAME );
         session.setAttribute("subtaskdescrip", subtaskdescrip);
         session.setAttribute("subtaskstartdate", subtaskstartdate );
         session.setAttribute("subtaskdeadli",subtaskdeadli );
         session.setAttribute("subtaskstat",subtaskstat );
         session.setAttribute("SUBTASKID", SUBTASKID);
         session.setAttribute("subtaskcomment",subtaskcomment );
        resp.sendRedirect("task2.jsp");
    }
    
}
