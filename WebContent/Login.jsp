<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login with JSP</title>
        <link rel="stylesheet" type="text/css" href="./resources/css/PharmaTheme.css"/>
    </head>
    <body>
      <div class="content-body-container form-container">
      	<h1>Welcome to PharmaPickup</h1>
      	<p>Patient Login</p>
      	<br/>
        <form method="post" action="Validate.jsp">
            <table class>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        	<br/>
                        	<input type="submit" value="Login" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
        </form>
        
        <br/>
        <br/>
        <div class="row">
	        <p>No account?</p>
	        <a href="Register.jsp">Register</a>
        </div>
        <br/>
        <div class="row">
        	<p>Not a patient?</p>
        	<a href="StaffLogin.jsp">Go to Staff Login</a>
		</div>
      </div>
    </body>
</html>