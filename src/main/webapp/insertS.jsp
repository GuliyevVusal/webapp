<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert</title>
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<form class="container" action="alma" method="POST">
    <div class="row col-5">
        <label for="name" class="form-label">name</label>
        <input type="text" class="form-control" name="name"
               id="name" placeholder="name">
    </div>
    <div class="row col-5">
        <label for="surname" class="form-label">surname</label>
        <input type="text" class="form-control" name="surname" id="surname" placeholder="surname">
    </div>
    <div class="row col-5">
        <label for="age" class="form-label">age</label>
        <input type="text" class="form-control" name="age" id="age" placeholder="age">
    </div>
    <div class="row col-5">
        <label for="email" class="form-label">email</label>
        <input type="text" class="form-control" name="email" id="email" placeholder="email">
    </div>
    <div class="row col-5">
        <label for="surname" class="form-label">university</label>
        <select class="form-select" name="university">
            <option value="BDU">BDU</option>
            <option value="AzTu">AzTu</option>
        </select>
    </div>
    <input type="hidden" name="command" value="insert"/>
    <div class="row">
        <div class="col-3">
            <button type="submit" class="btn btn-primary mb-3">SAVE</button>
        </div>
    </div>
</form>
</body>
</html>
