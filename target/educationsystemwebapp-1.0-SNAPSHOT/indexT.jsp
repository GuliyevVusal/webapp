<%@ page import="com.influencer.educationsystemwebapp.teacher.repo.TeacherRepo" %>
<%@ page import="com.influencer.educationsystemwebapp.teacher.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="com.influencer.educationsystemwebapp.util.ParamUtil" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link href="css/index.css" rel="stylesheet">

</head>
<body>
<h1 style="text-align: center">Teachers Registration</h1>


<%
    TeacherRepo repo = new TeacherRepo();

    final String name = ParamUtil.get(request.getParameter("name"));
    final String surname = ParamUtil.get(request.getParameter("surname"));
    final String email = ParamUtil.get(request.getParameter("email"));
    final String university = ParamUtil.get(request.getParameter("university"));
    Integer age = ParamUtil.parseInt(request.getParameter("age"));


    final String command = ParamUtil.get(request.getParameter("command"));
    final Integer id = ParamUtil.parseInt(request.getParameter("id"));
    if (command.equals("delete")) {
        repo.delete(id);
        response.sendRedirect("indexT.jsp");
    } else if (command.equalsIgnoreCase("insert")) {
        Teacher teacher = new Teacher();
        teacher.setName(name);
        teacher.setSurname(surname);
        teacher.setEmail(email);
        teacher.setUniversity(university);
        teacher.setAge(age);

        repo.insert(teacher);
        response.sendRedirect("indexT.jsp");
    } else if (command.equalsIgnoreCase("update")) {
        Teacher teacher = new Teacher();
        teacher.setId(id);
        teacher.setName(name);
        teacher.setSurname(surname);
        teacher.setEmail(email);
        teacher.setUniversity(university);
        teacher.setAge(age);

        repo.update(teacher);
        response.sendRedirect("indexT.jsp");
    }
    List<Teacher> list = repo.getList(name, surname, email, university, age);


%>

<form class="container">
    <div class="row">
        <div class="col-auto">
            <label for="name" class="form-label">name</label>
            <input type="text" class="form-control" name="name"
                   id="name" placeholder="name" value="<%=name%>">
        </div>
        <div class="col-auto">
            <label for="surname" class="form-label">surname</label>
            <input type="text" class="form-control" name="surname"
                   id="surname" placeholder="surname" value="<%=surname%>">
        </div>
        <div class="col-auto">
            <label for="age" class="form-label">age</label>
            <input type="text" class="form-control" name="age" id="age" placeholder="age"
                   value="<%=age!=null?age:""%>">
        </div>
        <div class="col-auto">
            <label for="email" class="form-label">email</label>
            <input type="text" class="form-control" name="email" id="email"
                   placeholder="email" value="<%=email%>">
        </div>
        <div class="col-auto">
            <label for="surname" class="form-label">university</label>
            <select class="form-select" name="university">
                <option value="BDU" <%= (
                        university != null && university.equals("BDU")) ? "selected" : ""%>>BDU
                </option>
                <option value="AzTu" <%= (university != null && university.equals("AzTu")) ? "selected" : ""%>>AzTu
                </option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-1">
            <button type="submit" class="btn btn-primary mb-3">Search</button>
        </div>
        <div class="col-1">
            <a type="submit" class="btn btn-primary mb-3" href="insertT.jsp">Insert</a>
        </div>
    </div>
</form>

<table class="table" style="width: 100%">
    <thead style="text-align: left">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Age</th>
        <th>Email</th>
        <th>University</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%

        for (int i = 0; i < list.size(); i++) {
            Teacher teacher = list.get(i);
    %>
    <tr <%= (i % 2 == 0 ? "class=\"table-primary\"" : "") %>>
        <td><%= teacher.getId() %>
        </td>
        <td><%= teacher.getName() %>
        </td>
        <td><%= teacher.getSurname() %>
        </td>
        <td><%= teacher.getAge() %>
        </td>
        <td><%= teacher.getEmail() %>
        </td>
        <td><%= teacher.getUniversity() %>
        </td>
        <td>
            <a href="deleteT.jsp?id=<%=teacher.getId()%>" class=" btn btn-danger">Delete</a>
            <a href="updateT.jsp?id=<%=teacher.getId()%>" class=" btn btn-info">Update</a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
