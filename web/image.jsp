<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%
    System.out.println("image.jsp is here");
    OutputStream pout=null;
  String id = (request.getParameter("imgid"));
  System.out.println("is retrieved is:"+id);
  try{      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagerdb","root","root");      
    Statement st=con.createStatement();
    String strQuery = "select * from projecttable where ProjectID="+id;
    ResultSet rs = st.executeQuery(strQuery);
    System.out.println(strQuery);
    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString(6);
       }  
    rs = st.executeQuery(strQuery);
    while(rs.next())
    {
      int len = imgLen.length();
      byte [] rb = new byte[len];
      InputStream readImg = rs.getBinaryStream(6);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
     
      response.getOutputStream().write(rb,0,len); 
      //response.getOutputStream().flush();  
      System.out.println("byyyyyyyyyyyyyyeeeeeeeeeeee");
    }
  }
  catch (Exception e)
  {
    e.printStackTrace();
  }
%>