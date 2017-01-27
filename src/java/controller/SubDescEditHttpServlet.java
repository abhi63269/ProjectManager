package controller;
import dto.SubDescUpdate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SubDescUpdateDB;
public class SubDescEditHttpServlet extends HttpServlet 
{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        
    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session=req.getSession(true);
        String selectstatus= req.getParameter("selectstatus");
        String SELECTSTATUS=selectstatus;
        String textarea=req.getParameter("textarea");
        String SUBTASKID=(String) session.getAttribute("SUBTASKID");
        System.out.println("SUBTASKID:"+SUBTASKID+"SELECTSTATUS:"+selectstatus+"TEXTAREA:"+textarea);
        SubDescUpdate sdu= new SubDescUpdate();
        sdu.setSelectstatus(selectstatus);
        sdu.setSubtaskID(SUBTASKID);
        sdu.setTextarea(textarea);
        SubDescUpdateDB sdudb= new SubDescUpdateDB();
        boolean checkness=sdudb.mcheck(sdu);
        if(checkness)
        {
            session.setAttribute("SELECTSTATUS", SELECTSTATUS);
            resp.sendRedirect("dashboard2.jsp");
        }
    }
    
}
