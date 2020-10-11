<%-- 
    Document   : registermail
    Created on : Sep 29, 2020, 10:28:23 PM
    Author     : Tarun Sharma
--%>



<%@page import="com.login.send"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("regmail")!=null){
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
    if(!rs.next()){
        Random rand = new Random();
        int val = rand.nextInt(999999);
        session.setAttribute("regotp", String.valueOf(val));
           session.setAttribute("regmail", mail);
           if(!mail.equals("")){
               System.out.println(val);
        String mess = " Your OTP for registration  is :  " +val  +"  ignore if not requestedby you";
        send.send(mail, "OTP", mess);
        response.sendRedirect("otpverify.jsp");
           }else{
               %>
               <script>
                   alert("Enter Correct Email_id");
                   </script>
                   <%
           }
    }else{
        %>
        <script>
            alert("Email_id is already Registerd With us");
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
           background: url("its.jpg");
           background-size: cover;
            text-align : center;
        }
    </style>
        <h1>Enter Your  Email_id</h1>
        <form  actio="#">
            <fieldset id="fieldcss">
            <div class="form-inline">
             <i class="fa fa-envelope" ></i>
             <input type ="email"  name="getmail" placeholder="Email_id" ><br>
            </div>
            <div class="form-inline">
            <input type="submit" name="regmail" class="btn-info">
            </div>
            </fieldset>
        </form>
    </body>
</html>
