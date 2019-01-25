<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: Faruk
  Date: 9.12.2018
  Time: 09:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String userType = (String) session.getAttribute("userType");

    if(userType == null){

%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Akademik Dergi Yönetim Sistemi">
    <meta name="author" content="Ömer Faruk Genç">

    <title>Akademik Dergi Yönetim Sistemi</title>
    <link rel="icon" href="https://i.hizliresim.com/ZXJBB0.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <!-- Bootstrap core CSS-->
    <link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/loginPage/main.css" rel="stylesheet">
</head>
<body class="bg-dark">

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<div class="container">
    <div class="card card-login mx-auto mt-5 rounded">
        <div class="card-header"><h3>Journality.</h3></div>
        <div align="center" style="margin-bottom: 15px; margin-top: 25px;">
            <h4>YENİ BİR HESAP OLUŞTUR</h4>
        </div>
        <div class="card-body">
            <form method="post" action="signup">
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="firstName" type="text" class="form-control" name="textFirstName" placeholder="Adınız" required="required" autofocus="autofocus">
                        <label for="firstName">Adınız</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <input id="textLastName" type="text" class="form-control" name="textLastName" placeholder="Soyadınız" required="required">
                        <label for="textLastName">Soyadınız</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <input id="textUsername" type="text" class="form-control" name="textUsername" placeholder="Kullanıcı Adınız" required="required">
                        <label for="textUsername">Kullanıcı Adınız</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <input id="textPassword" type="password" class="form-control" name="textPassword" placeholder="Şifreniz" required="required">
                        <label for="textPassword">Şifreniz</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <select class="form-control" id="gender" name="gender">
                            <option value="Erkek"> Erkek </option>
                            <option value="Kadın"> Kadın </option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <select class="form-control" id="location" name="location">

                            <%
                                request.setCharacterEncoding("UTF-8");
                                String fileName = "/WEB-INF/city.txt";
                                InputStream ins = application.getResourceAsStream(fileName);
                                try {
                                    if (ins == null) {
                                        response.setStatus(response.SC_NOT_FOUND);
                                    } else {
                                        BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                                        String data;
                                        while ((data = br.readLine()) != null) {
                            %>
                            <option value="<%=data%>">
                                <%=data%>
                            </option>
                            <%
                                        }
                                    }
                                } catch (IOException e) {
                                    out.println(e.getMessage());
                                }
                            %>

                        </select>
                    </div>
                </div>

                <div>
                    <button type="submit" class="btn btn-primary btn-block"> HESABIMI OLUŞTUR </button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>