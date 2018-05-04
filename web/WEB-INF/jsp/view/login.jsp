<%--
  Created by IntelliJ IDEA.
  User: 37246
  Date: 2018/5/3
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<h2>Login</h2>
You must log in to access the customer support site.<br/><br/>
<%
    if ((boolean) request.getAttribute("loginFailed")) {
%><b>The username or password you entered is not corrected. Please try again.</b><br/><br/>
<%
    }
%>
<form action="/login" method="post">
    UserName<br/>
    <input type="text" name="username"><br/><br/>
    Password<br/>
    <input type="password" name="password"><br/><br/>
    <input type="submit" value="Login In">
</form>
</body>
</html>
