<%-- 
    Document   : otpverify
    Created on : Sep 28, 2020, 1:10:09 PM
    Author     : Tarun Sharma
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("sub")!=null){
        
    String otp = session.getAttribute("regotp").toString();
     String eotp= request.getParameter("sotp");
     System.out.println(otp+"  "+eotp);
     if(otp.equals(eotp)){
         response.sendRedirect("newuser.jsp");
     }else{
         %>
         <script>
             alert("OTP is Wrong Please Enter Correct OTP");
             </script>
             <%
     }
}
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
         <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <title>OTP Verification</title>
    </head>
    <style>
        body{
         background:  url("flower.jpeg");
         background-size: cover;
         text-align: center;
        }
    </style>
        <h1>Verify first its are you<h1>
                
                <form  action="#"  name="form" id="forms">
        
        
           
                    <fieldset id="fieldcss" >
                       
                        <legend id="legendcss" >Enter an OTP send To your given Email</legend>
                         <div class="form-inline" >
                           <i class="fa fa-user-secret"></i>
                           <input type="text" name="sotp" class="form-control" placeholder="Enter OTP">
                        </div>
                       <br>
                      
                       <button type="submit"  name="sub" class="btn-info">Verify</button>
                             
                        
                   </fieldset>
        </form>
    
</html>

