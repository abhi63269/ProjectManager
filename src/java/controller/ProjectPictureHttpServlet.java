package controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
public class ProjectPictureHttpServlet extends HttpServlet 
{
   public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
       String pROid=req.getParameter("pROid");
       System.out.println("pROid:"+pROid);
       HttpSession session= req.getSession(true);
        int i=0;
        InputStream inputStream =null;
        //String filename=req.getParameter("photo");
        Part filepart;
        Blob x = null;
        //System.out.println("filename:"+filename);
        Connection con= null;
        Statement st = null;
        
        try
        {
            //String imgLen="";
            i=1;
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagerdb","root","root");
            System.out.println("Connected");
             st=con.createStatement();
            System.out.println("above string sql");
          String sql = "select ProjectPicture from projecttable where ProjectID='"+pROid+"'";
           System.out.println("below string sql"+sql); 
           ResultSet rs=st.executeQuery(sql);
            System.out.println("below rs");
            String imglen="";
           if(rs.next())
           {
               Blob test=rs.getBlob(1);
               inputStream=test.getBinaryStream();
               int size=inputStream.available();
               //OutputStream out=new 
               byte b[]= new byte[size];
               inputStream.read(b);
              // out.write(b);
              // session.setAttribute("out", out);
            imglen=rs.getString(1);
            int len = imglen.length();
            byte[] rb = new byte [len];
            InputStream readImg = rs.getBinaryStream(1);
            int index=readImg.read(rb,0,len);
            System.out.println("index" + index);
            st.close();
            resp.reset();
            resp.setContentType("image/jpg");
            resp.getOutputStream().write(rb,0,len);
            resp.getOutputStream().flush();
            }
            
                      
        }
        catch(SQLException e)
        {
            System.out.println("Error" +e);
        } 
        catch (ClassNotFoundException ex) {
            System.out.println("hello");
        }
        
        
        //System.out.println("inputstrream is"+inputStream);
        //filepart=(Part) inputStream;
        //session.setAttribute("x", x);
       
   }
    
}
