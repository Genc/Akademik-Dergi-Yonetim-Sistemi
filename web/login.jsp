<%--
  Created by IntelliJ IDEA.
  User: Faruk
  Date: 9.12.2018
  Time: 09:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    if(!session.isNew() && session.getAttribute("userId") != null){

        String userType = (String) session.getAttribute("userType");

        if(userType != null){
            response.sendRedirect("dashboard.jsp");
        }
    }
    else {
%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Akademik Dergi Yönetim Sistemi">
    <meta name="author" content="Ömer Faruk Genç">

    <title>Akademik Dergi Yönetim Sistemi</title>
    <link rel="icon" href="https://i.hizliresim.com/ZXJBB0.png" type="image/x-icon">

    <!-- Bootstrap core CSS-->
    <link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/loginPage/main.css" rel="stylesheet">
</head>
<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header"><h3>Journality.</h3></div>
        <div class="card-body">
            <form method="post" action="login">
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" name="textUsername" id="inputEmail" class="form-control" placeholder="Kullanıcı Adı" required="required" autofocus="autofocus">
                        <label for="inputEmail">Kullanıcı adı</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" name="textPassword" id="inputPassword" class="form-control" placeholder="Şifre" required="required">
                        <label for="inputPassword">Şifre</label>
                        <br/>
                        <%
                            String message = (String) request.getAttribute("error");
                            if(message!=null){
                        %>
                        <p class="errorMessage" ><%=message%></p>
                        <%
                            }
                        %>

                    </div>
                </div>
                <input type="submit" class="btn btn-primary btn-block loginButton" value="Giriş Yap" />
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>