<%@ page import="model.User" %>
<%@ page import="model.Article" %>
<%@ page import="java.util.List" %><%--
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
                <h2 class="card-face__name"><%=user.getFirstName() + " " + user.getLastName()%></h2>
                <!-- Title -->
                <span class="card-face__title"><%=user.getUsername()%></span>
                <!-- Cart Footer -->
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
            <br><br>
            <c:if test="${userType != 'Referee'}">
            <div class="table-responsive">
                <table id="example" class="table table-striped table-bordered">
                    <thead class="thead-light">
                    <tr>
                        <th>Başlık</th>
                        <th>Konu</th>
                        <th>Dil</th>
                        <th>Dosya</th>
                        <th>Dergi Adı</th>
                        <th>Durumu</th>
                        <c:if test="${userType != 'Author'}">
                            <th>Yazar Adı </th>
                        </c:if>
                        <c:if test="${userType != 'Editor'}">
                        <th>Editör Adı </th>
                        </c:if>
                        <th>İşlem</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${articles}" var="article">
                     <tr>
                        <td><c:out value="${article.title}" /></td>
                        <td>
                            <c:out value="${article.subject}" />
                        </td>
                        <td><c:out value="${article.languange}" /></td>
                        <td>
                           <div align="center"><a href="downloadServlet?fileName=${article.filePath}"> <img src="media/file.png"> </a></div>
                        </td>
                        <td><c:out value="${article.journalName}" /></td>

                        <td>
                            <%-- Hakem tarafından reddedildiyse --%>
                            <c:if test="${article.articleStatus == '-1'}">
                                <c:out value="Hakem tarafından reddedildi" />
                            </c:if>
                             <%-- Editor tarafından reddedildiyse --%>
                                <c:if test="${article.articleStatus == '0'}">
                                <c:if test="${userType != 'Editor'}">
                                    <c:out value="Editor tarafından reddedildi" />
                                </c:if>
                                <c:if test="${userType == 'Editor'}">
                                    <c:out value="Sizin tarafınızdan reddedildi" />
                                </c:if>
                                </c:if>
                            <%-- Editor onayı bekleniyorsa --%>
                            <c:if test="${article.articleStatus == '1'}">
                                <c:if test="${userType != 'Editor'}">
                                    <c:out value="Editör onayı bekleniyor" />
                                </c:if>
                                <c:if test="${userType == 'Editor'}">
                                    <c:out value="Onayınız bekleniyor" />
                                </c:if>
                            </c:if>
                            <%-- Hekem onayı bekleniyorsa --%>
                            <c:if test="${article.articleStatus == '2'}">
                                <c:out value="Hakem onayı bekleniyor" />
                            </c:if>
                            <c:if test="${article.articleStatus == '3'}">
                                <c:out value="Başarıyla onaylandı" />
                            </c:if>
                        </td>

                         <c:if test="${userType != 'Author'}">
                         <td>
                             <c:out value="${article.authorName}" />
                         </td>
                         </c:if>

                         <c:if test="${userType != 'Editor'}">
                             <td>
                                 <c:out value="${article.editorName}" />
                             </td>
                         </c:if>

                        <td><div align="center"><a href="getArticleController?articleId=${article.id}" class="btn btn-info btn-sm btn-examine">İncele</a></div> </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            </c:if>

            <!---- Hakem tablosu -->

            <c:if test="${userType == 'Referee'}">
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered">
                        <thead class="thead-light">
                        <tr>
                            <th>Başlık</th>
                            <th>Konu</th>
                            <th>Dil</th>
                            <th>Dosya</th>
                            <th>Dergi Adı</th>
                            <th>Yazar Adı </th>
                            <th>Editör Adı </th>
                            <th>Durumu </th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${refereeArticles}" var="article">
                            <c:if test="${article.articleStatus != '1' and article.articleStatus != '0'}">
                            <tr>
                                <td><c:out value="${article.title}" /></td>
                                <td>
                                    <c:out value="${article.subject}" />
                                </td>
                                <td><c:out value="${article.languange}" /></td>
                                <td>
                                    <div align="center"><a href="downloadServlet?fileName=${article.filePath}"> <img src="media/file.png"> </a></div>
                                </td>
                                <td><c:out value="${article.journalName}" /></td>
                                <td><c:out value="${article.authorName}" /></td>
                                <td><c:out value="${article.editorName}" /></td>

                                <td>
                                    <c:if test="${article.articleStatus == '-1'}">
                                        <c:out value="Sizin tarafınızdan reddedildi"></c:out>
                                    </c:if>
                                    <c:if test="${article.articleStatus == '2'}">
                                        <c:out value="Onayınız bekleniyor"></c:out>
                                    </c:if>
                                    <c:if test="${article.articleStatus == '3'}">
                                        <c:out value="Başarıyla onaylandı"></c:out>
                                    </c:if>
                                </td>

                                <td><div align="center"><a href="getArticleController?articleId=${article.id}" class="btn btn-info btn-sm btn-examine">İncele</a></div> </td>
                            </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>


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