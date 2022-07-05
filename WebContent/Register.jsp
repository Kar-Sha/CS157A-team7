<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register with JSP</title>
    </head>
    <body>
        <form method="post" action="AddUser.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Welcome to PharmaPickup</th>
                    </tr>
                </thead>
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
                        <td colspan="2" align="center">
                        	<input type="submit" value="Register" />
                            &nbsp;&nbsp;
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>