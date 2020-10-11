<%-- 
    Document   : login
    Created on : Sep 20, 2020, 4:25:40 PM
    Author     : Tarun Sharma
--%>



<%@page import="com.login.send"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("action")!=null){
         String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = "tarun8299";
    String PASS = "hello";
   
  String username= request.getParameter("user");
    String pass= request.getParameter("pass");
  
 

     Class.forName(JDBC_DRIVER);
              Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
              String query = "Select  Email_id from users WHERE UserName =? and Password =?";
              PreparedStatement stmt = con.prepareStatement(query);
              System.out.println("Connected");
              stmt.setString(1, username);
              stmt.setString(2, pass);
              ResultSet  rs= stmt.executeQuery();
              
              if(rs.next()){
           //   Random rand = new Random();
            //      int val= rand.nextInt(999999);
             //     String quer = "Select *  from users WHERE UserName=? ;";
             //     PreparedStatement st= con.prepareStatement(quer);
              //    st.setString(1, username);
              //    ResultSet rp = st.executeQuery();
              //    System.out.println(val);
               //   String mail="";
               //   while(rp.next()){
               //       mail= rp.getString("Email_id");
              //    }
               //   String mess = "Your OTP for Verification is : " +val;
                //  send.send(mail, "OTP", mess);
              //   session.setAttribute("otp", String.valueOf(val));
      //  response.sendRedirect("otpverify.jsp");
       response.sendRedirect("main.jsp");
          
       }else{
            %>
            <script>
                alert("Wrong username or password");
                </script>
                <%
      }
 }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
       <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   
     
    </head>
  <style>
body {
background-image: url("l1.jpeg");
background-size: cover;
}

 

</style>
  <form action="#" class="fieldcss" >
                    <fieldset id="fieldcss" >
                        <legend id="legendcss" >Login Here</legend>
                          <div class="form-inline" >
                           
                            <i class="fa fa-user"></i>
                            <input type="text" name="user" class="form-control" placeholder="Username" >
                        </div>
                       
                        <br>
                          <div class="form-inline">
                           
                            <i class="fa fa-key"></i>
                            <input type="password" name="pass" class="form-control" placeholder="Password">
                        </div>
                       
                        <br>
                        
                      <button type="action" name="action" id="submit" class="btn-info"   >Login</button>
                      <div class="link">
                          <br>  <a href="getmail.jsp" class="btn-info">Forget Password?  </a>
                    
                          <a href="registermail.jsp" class="btn-info"> New User?  </a></div>
                           
                    </fieldset>
   
                        
        </form>
    </body>
</html>
