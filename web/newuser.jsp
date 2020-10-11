<%-- 
    Document   : newuser
    Created on : Sep 20, 2020, 9:12:59 PM
    Author     : Tarun Sharma
--%>
<%@page import="com.login.send"%>
<%@page import="java.sql.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
       <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
      <script src="https://kit.fontawesome.com/a076d05399.js"></script>
      
    </head>
   
  <style>
body {
background-image: url("london.jpeg");
background-size: cover;
}
 
</style>
<div>
  
    <form  action=""  name="form" id="forms">
        
        
           
                    <fieldset id="fieldcss" >
                        <b><i><font color="red"> ** All Fields Are Mandatory</font></i></b>
                        <legend id="legendcss" >Register Here</legend>
                       
                              <div class="form-inline" >
                           <i class="fa fa-user"></i>
                            <input type="text" name="sname" class="form-control" placeholder="Name">
                        </div>
                       
                        <br>
                          
                        
                          <div class="form-inline" >
                          <i class="fa fa-user"></i>
                          <input type="text" name="suser" class="form-control" placeholder="Username">
                        </div>
                       
                        <br>
                          <div class="form-inline">
                          <i class="fa fa-key"></i>
                          <input type="password" name="spass" class="form-control" placeholder="Password">
                        </div>
                        <br>
                       <button type="action" name="action" id="submit" class="btn-info"   >Register</button>
                        <button type="submit" name="tologin" id="submit" class="btn-info"   ><a href="login.jsp">Login </a></button>
                   </fieldset>
        </form>
</div>

<%
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = "tarun8299";
    String PASS = "hello";
    String name = request.getParameter("sname");
    String email = session.getAttribute("regmail").toString();
    String username= request.getParameter("suser");
    String pass= request.getParameter("spass");
  
 
     try{

              Class.forName(JDBC_DRIVER);
              Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
              String qry = "Select * from Users WHERE Email_id=?";
              PreparedStatement ps1 = con.prepareStatement(qry);
              ps1.setString(1, email);
              ResultSet rsm= ps1.executeQuery();
              String quer = "Select * from users WHERE USERNAME=?";
              PreparedStatement pst = con.prepareStatement(quer);
              pst.setString(1, username);
              ResultSet rs = pst.executeQuery();
             
    
             if(rs.next()){
                 
          %>
    <script>
            alert("UserName  already Exists");
            </script>
                   <%
             
                             
              }else{
              
              String query = "Insert into users Values (?,?,?,?)";
              PreparedStatement stmt = con.prepareStatement(query);
           stmt.setString(1,name);
            stmt.setString(2, email);
            stmt.setString(3,username);
            stmt.setString(4, pass);
  if(name.equals("")||email.equals("")||username.equals("")||pass.equals("")){
  
        %>
    <script>
            alert("All fields are Mandatory");
            </script>
                    
                     <%
                         

}else{


          stmt.execute();
%>
       <script>
            alert("Sucessfully Registered");
            </script>
                    
                     <%
    String mess= "You are sucessfully registered your username  is : "+username+"  and password is "+pass;
    send.send(email, "Regitration", mess);
           response.sendRedirect("login.jsp");
           }
              }

    
    }catch(Exception e){
         
     }

    
    %>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

   
    </body>
</html>