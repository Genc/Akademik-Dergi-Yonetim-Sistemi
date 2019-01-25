<%@ page import="model.User" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: Faruk
  Date: 23.12.2018
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userType = (String) session.getAttribute("userType");
    User user = (User) session.getAttribute("userInformation");

    if(userType == null){
        response.sendRedirect("login.jsp");
    }
    else {

%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Akademik Dergi Yönetim Sistemi">
    <meta name="author" content="">
    <link rel="icon" href="https://i.hizliresim.com/ZXJBB0.png" type="image/x-icon">
    <title>Yeni Makale Ekle</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/sidebar/simple-sidebar.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/dashPage/profile-card.css" type="text/css" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">

    <button style="margin-left: 10px;" class="btn btn-link btn-sm text-white order-1 order-sm-0 btn-toggle" id="menu-toggle" href="#menu-toggle">
        <i class="fas fa-bars"></i>
    </button>

    <a class="navbar-brand" href="dashboard.jsp"><b>Journality.</b></a>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

        </ul>
        <div class="form-inline my-2 my-lg-0">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="dashboard.jsp">Anasayfa <span class="sr-only">(current)</span></a>
                </li>
                <c:if test="${userType == 'Author'}">
                    <li class="nav-item">
                        <a class="nav-link" href="newArticle.jsp">Yeni Makale Ekle</a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profilini Düzenle</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Çıkış Yap</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <div class="profile-card"><!-- Face 2 -->
            <div class="card-face face-2"><!-- Back trigger -->

            </div><!-- Face 1 -->
            <div class="card-face face-1"><!-- Menu trigger -->
                <!-- Avatar -->
                <div class="card-face__avatar">
                    <c:if test="${userType == 'Author'}">
                    <img src="media/admin.png" width="110" height="110" draggable="false"/></div>
                </c:if>
                <c:if test="${userType == 'Editor'}">
                <img src="media/user.png" width="110" height="110" draggable="false"/></div>
            </c:if>
            <c:if test="${userType == 'Referee'}">
            <img src="media/receptionist.png" width="110" height="110" draggable="false"/></div>
        </c:if>
        <!-- Name -->
        <h2 class="card-face__name"><%=user.getFirstName() + " " + user.getLastName()%></h2><!-- Title -->
        <span class="card-face__title"><%=user.getUsername()%></span><!-- Cart Footer -->
        <div class="card-face-footer">
            <img src="media/gender.png" class="detailsImage">
            <span class="details"><%=user.getGender()%></span><br>
            <img src="media/degree.png" class="detailsImage">
            <span class="details">
                        <c:if test="${userType == 'Author'}">
                            <c:out value="Yazar"></c:out>
                        </c:if>
                        <c:if test="${userType == 'Editor'}">
                            <c:out value="Editör"></c:out>
                        </c:if>
                        <c:if test="${userType == 'Referee'}">
                            <c:out value="Hakem"></c:out>
                        </c:if>
                    </span><br>
            <img src="media/Location.png" class="detailsImage">
            <span class="details"><%=user.getLocation()%></span>
        </div>
    </div>
</div>

</div>
<!-- /#sidebar-wrapper -->

<!-- Page Content -->
<div id="page-content-wrapper">
    <div class="container-fluid">

        <div class="card card-login mx-auto mt-5 rounded w-100">
            <div align="center" style="margin-bottom: 15px; margin-top: 25px;">
                <h3>HESAP BİLGİLERİNİ GÜNCELLE</h3>
            </div>
            <div class="card-body">
                <form method="post" action="editProfileController">
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
                        <button type="submit" class="btn btn-primary btn-block"> HESABIMI GÜNCELLE </button>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>
<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="resources/js/jquery/jquery.min.js"></script>
<script src="resources/js/bootstrap/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>
</html>
<%
    }
%>