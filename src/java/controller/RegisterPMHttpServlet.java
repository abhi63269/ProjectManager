package controller;
import dto.EditAccount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class RegisterPMHttpServlet extends HttpServlet 
{

   public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
       resp.sendRedirect("Welcome.html");
   }
    
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String fname= req.getParameter("fname");
        String lname= req.getParameter("lname");
        String address = req.getParameter("address");
        String pincode= req.getParameter("pincode");
        String contactno = req.getParameter("contactno");
        String email= req.getParameter("email");
        String designation = req.getParameter("designation");
        String empid= req.getParameter("empid");
        String password= req.getParameter("password");
        EditAccount ea= new EditAccount();
        ea.setAddress(address);
        ea.setContactno(contactno);
        ea.setDesignation(designation);
        ea.setEmail(email);
        ea.setEmpid(empid);
        ea.setFname(fname);
        ea.setLname(lname);
        ea.setPassword(password);
        ea.setPincode(pincode);
        
        
    }


    
}
