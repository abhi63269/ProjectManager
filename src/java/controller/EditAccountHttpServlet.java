package controller;
import dto.EditAccount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RetrieveDatabase;
import model.userUpdateAccount;
public class EditAccountHttpServlet extends HttpServlet 
{
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
  {
      resp.sendRedirect("login.html");
  }
    

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        userUpdateAccount uua= new userUpdateAccount();
        EditAccount ea= new EditAccount();
        String email=req.getParameter("email");
        String npassword= req.getParameter("npassword");
        System.out.println("newpassword is"+npassword);
        String ccpassword=req.getParameter("ccpassword");
        System.out.println("confirmnewpasssword is"+ccpassword);
        String empid=req.getParameter("empid");
        //System.out.println("empid isss"+empid);
        String address = req.getParameter("address");
        //System.out.println("adresss iss "+address);
        String pincode= req.getParameter("pincode");
        //System.out.println("pincode is "+pincode);
        String password= req.getParameter("cpassword");
        //System.out.println("password "+password);
        ea.setAddress(address);
        ea.setEmpid(empid);
        ea.setPassword(password);
        ea.setPincode(pincode);
        uua.setCcpassword(ccpassword);
        uua.setNpassword(npassword);
       
        
        if(uua.edit(ea))
        {
            RetrieveDatabase rd= new RetrieveDatabase();
            rd.retrieve(ea, email);
            HttpSession session=req.getSession(true);
            session.setAttribute("address", ea.getAddress());
            session.setAttribute("upassword", ea.getPassword());
            session.setAttribute("pincode",ea.getPincode());
            resp.sendRedirect("dashboard2.jsp#accounts");
        }
        else
        {
            resp.sendRedirect("index.jsp");
        }
        
    }

 
  
}
