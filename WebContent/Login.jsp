<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login with JSP</title>
    </head>
    <body>
        <form method="post" action="Validate.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Welcome to PharmaPickup</th>
                    </tr>
                </thead>
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
                        	<input type="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input type="button" value="Register" onclick="window.location='Register.jsp'" >
                            &nbsp;&nbsp;
                            <input type="button" value="Staff" onclick="window.location='StaffLogin.jsp'" >
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>