<%--
  Created by IntelliJ IDEA.
  User: 37246
  Date: 2018/5/4
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%!
    private String timeIntervalToString(long timeInterval) {
        if (timeInterval < 1000) {
            return "less than one second";
        } else if (timeInterval < 60_000) {
            return timeInterval / 1000 + " seconds";
        } else {
            return "about " + timeInterval / 60_000 + " minutes";
        }
    }
%>
<%
    int numberOfSessions = (Integer) request.getAttribute("numberOfSessions");
    List<HttpSession> sessions = ((List<HttpSession>) request.getAttribute("sessions"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<a href="<c:url value="login?logout"/>">Logout</a>
<h2>Sessions</h2>
There are a total of <%= numberOfSessions %> active sessions in this application.<br/><br/>
<%
    for (HttpSession aSession : sessions) {
        out.print(aSession.getId() + " - " + aSession.getAttribute("username"));
        if (session.getId().equals(aSession.getId())) {
            out.print("(you)");
        }
        out.print(" last active "
                + timeIntervalToString(System.currentTimeMillis() - aSession.getLastAccessedTime())
                + " ago<br/>");
    }
%>
</body>
</html>
