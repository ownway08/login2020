<%-- 
    Document   : getmail
    Created on : Sep 29, 2020, 8:50:51 PM
    Author     : Tarun Sharma
--%>

<%@page import="com.login.send"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("submail")!=null){
        String mail= request.getParameter("getmail");
                 String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = "tarun8299";
    String PASS = "hello";
    
    Class.forName(JDBC_DRIVER);
    Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
    String quer = "Select * from users WHERE Email_id=? ";
    PreparedStatement stmt= con.prepareStatement(quer);
    stmt.setString(1, mail);
    ResultSet rs= stmt.executeQuery();
    if(rs.next()){
        Random rand = new Random();
        int val = rand.nextInt(999999)+100000;
        session.setAttribute("forgetpass", String.valueOf(val));
           session.setAttribute("changemail", mail);
        String mess = " Your OTP for changing Password is :  " +val;
     
       send.send(mail, "OTP", mess);
        response.sendRedirect("forget.jsp");
    }else{
        %>
        <script>
            alert("Email_id is not Registerd With us");
            </script>
            <%
    }
    
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Getting Mail</title>
        <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
          <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <style>
        body{
            background: url("taj.jpeg");
       background-size: cover;
      
                text-align : center;
        }
    </style>
        <h1>Enter Your registered Email_id</h1>
        <form  action="#">
            <fieldset id="fieldcss">
                <div class="form-inline">
                  <i class="fa fa-envelope" ></i>
                  <input type ="email"  name="getmail"  placeholder="Email_id"><br><br>
            </div>
            <div>
            <input type="submit" name="submail" class="btn-info">
            </div>
            </fieldset>
        </form>
    </body>
</html>
