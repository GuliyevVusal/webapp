
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<form action="alma" method="POST">
    Are you sure to delete?
    <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
    <input type="hidden" name="command" value="delete"/>
    <button class="btn btn-primary" type="submit">YES</button>
    <a href="armud.jsp" class="btn btn-danger">NO</a>
</form>
</body>
</html>
