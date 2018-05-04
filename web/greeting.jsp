<%--
  Created by IntelliJ IDEA.
  User: 37246
  Date: 2018/4/30
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%!
    private static final String DEFAULT_USER = "Guest";
%>
<%
    String user = request.getParameter("user");
    if (user == null) {
        user = DEFAULT_USER;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Hello World Application</title>
</head>
<body>
Hello, <%= user %>!<br/><br/>
<form action="greeting.jsp" method="post">
    Enter your name:<br/>
    <input type="text" name="user"/><br/>
    <input type="submit" value="Submit"/>
</form>
settingOne:<%= application.getInitParameter("settingOne")%>
</body>
</html>