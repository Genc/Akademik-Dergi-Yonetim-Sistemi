<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Faruk
  Date: 23.12.2018
  Time: 01:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
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

    <title>Akademik Dergi Yönetim Sistemi</title>
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
                    <!-- Bullet notification --><!-- User avatar -->
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
            <br>
            <div align="center" class="articleTitle"><h2>Makale Bilgileri</h2></div>
            <hr>
            <div align="center">
                <div class="card w-75">
                    <div class="card-header text-left">
                        <h4 class="d-inline">${article.title}</h4>
                        <a class="float-right btn btn-info btn-sm" href="downloadServlet?fileName=${article.filePath}">Makaleyi İndir </a>
                    </div>
                    <div class="card-body text-left">
                        <p class="card-text"><b>Konusu : </b> ${article.subject}</p>
                        <p class="card-text"><b>Anahtar Kelimeler : </b> ${article.keywords}</p>
                        <p class="card-text"><b>Makale Dili : </b>${article.languange}</p>
                        <p class="card-text"><b>Telif Hakkı : </b> ${article.copyright}</p>
                        <p class="card-text"><b>Dergi Adı : </b> ${article.journalName}</p>
                        <p class="card-text"><b>Yazar Adı : </b> ${article.authorName}</p>
                        <p class="card-text"><b>Durumu : </b>
                        <c:if test="${userType == 'Author'}">
                            <c:if test="${article.articleStatus == '-1'}">
                                <c:out value="Hakem tarafından reddedildi..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '0'}">
                                <c:out value="Editör tarafından reddedildi..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '1'}">
                                <c:out value="Editör onayı bekleniyor..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '2'}">
                                <c:out value="Editör tarafından başarıyla onaylandı. Hakem onayı bekleniyor..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '3'}">
                                <c:out value="Hakem tarafından başarıyla onaylandı..."></c:out>
                            </c:if>
                        </c:if>
                        <c:if test="${userType == 'Editor'}">
                            <c:if test="${article.articleStatus == '-1'}">
                                <c:out value="Hakem tarafından reddedildi..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '0'}">
                                <c:out value="Sizin tarafınızdan reddedildi..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '1'}">
                                <c:out value="Onayınız Bekleniyor..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '2'}">
                                <c:out value="Başarıyla Onayladınız... Hakem onayı bekleniyor..."></c:out>
                            </c:if>
                            <c:if test="${article.articleStatus == '3'}">
                                <c:out value="Hakem tarafından başarıyla onaylandı..."></c:out>
                            </c:if>
                        </c:if>
                            <c:if test="${userType == 'Referee'}">
                                <c:if test="${article.articleStatus == '-1'}">
                                    <c:out value="Sizin tarafınızdan reddedildi..."></c:out>
                                </c:if>
                                <c:if test="${article.articleStatus == '2'}">
                                    <c:out value="Onayınız bekleniyor..."></c:out>
                                </c:if>
                                <c:if test="${article.articleStatus == '3'}">
                                    <c:out value="Başarıyla onaylandı..."></c:out>
                                </c:if>
                            </c:if>
                        </p>
                        <p class="card-text"><b>Editör Adı : </b>${article.editorName}</p>
                        <c:if test="${not empty article.refereeName and article.refereeName != ''}">
                        <p class="card-text"><b>Hakem Adı : </b>${article.refereeName}</p>
                        </c:if>
                        <hr>
                        <c:if test="${userType == 'Editor'}">
                            <c:if test="${article.articleStatus == '1'}">
                            <div align="center"> <p>
                                <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Hakeme Ata</a>
                                &nbsp;  &nbsp;  &nbsp;  &nbsp;
                                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Reddet</button>
                            </p>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="collapse multi-collapse" id="multiCollapseExample1">
                                        <div class="card card-body">
                                            <form method="post" action="assignmentReferee">
                                                <div class="form-group row">
                                                    <label class="col-md-4 col-form-label text-md-right">Hakem Seçiniz : </label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="selectReferee">
                                                            <c:forEach items="${refereeList}" var="referee">
                                                            <option value="${referee.firstName} ${referee.lastName}"> ${referee.firstName} ${referee.lastName} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div align="center" class="col-md-6 offset-md-4">
                                                    <button type="submit" class="btn btn-primary"> Atamayı gerçekleştir </button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                    <br/>
                                </div>

                                <div class="col-sm-12">
                                    <div class="collapse multi-collapse" id="multiCollapseExample2">
                                        <div class="card card-body">
                                            <form method="post" action="rejectionController">
                                                <div class="form-group row">
                                                    <label class="col-md-4 col-form-label text-md-right">Reddedilme Sebebi: </label>
                                                    <div class="col-md-6">
                                                        <textarea class="form-control" placeholder="Lütfen reddedilme sebebini giriniz..." name="rejectText"></textarea>
                                                    </div>
                                                </div>

                                                <div align="center" class="col-md-6 offset-md-4">
                                                    <button type="submit" class="btn btn-danger"> Geri Çevir </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <hr>
                            </c:if>
                        </c:if>

<c:if test="${userType == 'Referee'}">
    <c:if test="${article.articleStatus == '2'}">
        <div align="center"> <p>
            <a class="btn btn-primary" href="successfulConfirmedArticle" role="button">Makaleyi Kabul Et</a>
            &nbsp;  &nbsp;  &nbsp;  &nbsp;
            <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample2">Makaleyi Reddet</button>
        </p>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="collapse multi-collapse" id="multiCollapseExample1">
                    <div class="card card-body">
                        <form method="post" action="rejectionController">
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">Reddedilme Sebebi: </label>
                                <div class="col-md-6">
                                    <textarea class="form-control" placeholder="Lütfen reddedilme sebebini giriniz..." name="rejectText"></textarea>
                                </div>
                            </div>

                            <div align="center" class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-danger"> Geri Çevir </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </c:if>
    </c:if>

                        <c:if test="${article.articleStatus == '0' or article.articleStatus == '-1'}">
                            <p class="card-text"><b>Reddedilme Nedeni : </b> ${article.rejectText}</p>
                        </c:if>

                    </div>
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