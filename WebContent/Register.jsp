<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register with JSP</title>
        <link rel="stylesheet" type="text/css" href="./resources/css/PharmaTheme.css"/>
    </head>
    <body>
   	  <div class="content-body-container form-container">
   	  	<h1>Welcome to PharmaPickup</h1>
   	  	<p>Patient Register</p>
   	  	<br/>
        <form method="post" action="AddUser.jsp">
            <table>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName" required/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName" required/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" required/></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td colspan="2" align="center">
                        	<input type="submit" value="Register" />
                        </td>                       
                    </tr>                    
                </tbody>
            </table>
            <br/>
            <div class="row">
		        <p>Already have an account?</p>
                <a href="Login.jsp">Back to Login</a>
	        </div>
                        	
        </form>
      </div>
    </body>
</html>