<%@ page import="com.influencer.educationsystemwebapp.util.ParamUtil" %>
<%@ page import="com.influencer.educationsystemwebapp.teacher.repo.TeacherRepo" %>
<%@ page import="com.influencer.educationsystemwebapp.teacher.entity.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<%
    final Integer id = ParamUtil.parseInt(request.getParameter("id"));
    TeacherRepo repo = new TeacherRepo();
    final Teacher foundTeacher = repo.findById(id);

%>
<form class="container" action="alma" method="POST">
    <div class="row col-5">
        <label for="name" class="form-label">name</label>
        <input type="text" class="form-control" name="name" id="name" placeholder="name"
               value="<%=foundTeacher.getName()%>">
    </div>
    <div class="row col-5">
        <label for="surname" class="form-label">surname</label>
        <input type="text" class="form-control" name="surname" id="surname" placeholder="surname"
               value="<%=foundTeacher.getSurname()%>">
    </div>
    <div class="row col-5">
        <label for="age" class="form-label">age</label>
        <input type="text" class="form-control" name="age" id="age" placeholder="age" value="<%=foundTeacher.getAge()%>">
    </div>
    <div class="row col-5">
        <label for="email" class="form-label">email</label>
        <input type="text" class="form-control" name="email" id="email" placeholder="email" value="<%=foundTeacher.getEmail()%>">
    </div>
    <div class="row col-5">
        <label for="surname" class="form-label">university</label>
        <select class="form-select" name="university">
            <option value="BDU" <%=foundTeacher.getUniversity().equalsIgnoreCase("BDU") ? "selected" : ""%>>BDU</option>
            <option value="AzTu"<%=foundTeacher.getUniversity().equalsIgnoreCase("AzTu") ? "selected" : ""%>>AzTu</option>
        </select>
    </div>
    <input type="hidden" name="id" value="<%=foundTeacher.getId()%>"/>
    <input type="hidden" name="command" value="update"/>
    <div class="row">
        <div class="col-3">
            <button type="submit" class="btn btn-primary mb-3">SAVE</button>
        </div>
    </div>
</form>
</body>
</html>
