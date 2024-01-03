<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
    /* Custom style to make the table smaller */
    table {
        max-width: 300px; /* Adjust the max-width as needed */
    }
</style>
</head>
<body class="pt-3">
    <div class="container">
        <form method="POST" action="Login">
            <table class="table mx-auto" >
                <tr>
                    <td>User name</td>
                    <td><input type="text" name="login" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Se Connecter" class="btn btn-primary"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>