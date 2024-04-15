<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<form class="container" action="login" method="POST">
    <div class="row col-5">
        <label for="email" class="form-label">email</label>
        <input type="text" class="form-control" name="email" id="email" placeholder="email">
    </div>
    <div class="row col-5">
        <label for="password" class="form-label">password</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="password">
    </div>

    <div class="row">
        <div class="col-3">
            <button type="submit" class="btn btn-primary mb-3">LOGIN</button>
        </div>
    </div>
</form>
</body>
</html>
