<%-- 
    Document   : forget
    Created on : Sep 24, 2020, 9:32:07 PM
    Author     : Tarun Sharma
--%>

<%@page import="com.login.send"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%
    if(request.getParameter("subchn")!=null){
       String  insertotp = request.getParameter("otp");
       String sysotp= session.getAttribute("forgetpass").toString();
       if(!insertotp.equals(sysotp)){
           %>
           <script>
               alert("Wrong OTP");
               </script>
               <%
       }else{
    String newpassword= request.getParameter("npass");
String confirmpassword = request.getParameter("cpass");
    if(!newpassword.equals(confirmpassword)){
  %>
           <script>
               alert("Password Mismatch");
               </script>
               
               <%

}else{
     String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
     String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = "tarun8299";
    String PASS = "hello";
    String mail= session.getAttribute("changemail").toString();


    Class.forName(JDBC_DRIVER);
    Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
    String quer = "UPDATE users SET Password = ? WHERE Email_id = ?";
    PreparedStatement stmt= con.prepareStatement(quer);
    stmt.setString(1, newpassword);
   stmt.setString(2, mail);

     stmt.executeUpdate();

  String mess = "Your password is sucessfully Changed your new password is " + newpassword;

  send.send(mail, "Suceesfully Changed", mess);
  response.sendRedirect("login.jsp");
}
    }
        
    
    }
    %>
<!DOCTYPE html>
<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
          <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
        <title>Change Password</title>
    </head>
     <style>
        body{
           background : url("flower.jpeg");
           background-size: cover;
          text-align : center;
        }
    </style>
        <h1>Enter Your New Password </h1>
        <form  actio="#">
            <fieldset id="fieldcss">
                 <div class="form-inline">
           <i class="fa fa-user-secret"></i>
                <input type ="otp"  name="otp"  placeholder="Enter OTP"><br><br>
           </div>
            <div class="form-inline">
               <i class="fa fa-key"></i>
                <input type ="password"  name="npass"  placeholder="Enter New Password"><br><br>
           </div>
                <div class="form-inline">
               <i class="fa fa-key"></i>
                <input type ="password"  name="cpass" placeholder="Confirm Password" ><br><br>
            </div>
            <div>
                <input type="submit" name="subchn" class="btn-info" value="Change Password">
            </div>
            </fieldset>
        </form>
    </body>
</html>
