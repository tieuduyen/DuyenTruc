<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/admin/assets/vendor/font-awesome/css/font-awesome.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/admin/assets/vendor/linearicons/style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/admin/assets/css/main.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/admin/assets/css/demo.css" />">
    </head>
    <body>
        <div id="wrapper">
            <!-- NAVBAR -->
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="brand">
                    <a href="#">Hotel Booking</a>
                </div>
                <div class="container-fluid">
                    <div class="navbar-btn">
                        <button type="button" class="btn-toggle-fullwidth"><i
                                class="lnr lnr-arrow-left-circle"></i></button>
                    </div>
                    <div id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-user"></i><span> ${users.email} </span><i class="icon-submenu lnr lnr-chevron-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="lnr lnr-user"></i><span>My Profile</span></a></li>
                                    <li><a href="<c:url value="/logout" />"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END NAVBAR -->
            <!-- LEFT SIDEBAR -->
            <div id="sidebar-nav" class="sidebar">
                <div class="sidebar-scroll">
                    <nav>
                        <ul class="nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/homepage" class="active">
                                    <i class="lnr lnr-home"></i><span>Dashboard</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/view-booking-list/1" class="">
                                    <i class="lnr lnr-bookmark"></i> <span>Booking Management</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/view-city-list/1" class="">
                                    <i class="lnr lnr-apartment"></i> <span>City</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/view-all-hotel/1" class="">
                                    <i class="lnr lnr-construction"></i> <span>Hotel</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/view-comment-list" class="">
                                    <i class="lnr lnr-pencil"></i> <span>Comment</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/view-users-list/1" class="">
                                    <i class="lnr lnr-users"></i> <span>User Management</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- END NAVBAR -->
            <script src="<c:url value="/resources/admin/assets/vendor/jquery/jquery.min.js" />"></script>
            <script src="<c:url value="/resources/admin/assets/vendor/bootstrap/js/bootstrap.min.js" />"></script>
            <script src="<c:url value="/resources/admin/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>
            <script src="<c:url value="/resources/admin/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js" />"></script>
            <script src="<c:url value="/resources/admin/assets/vendor/chartist/js/chartist.min.js" />"></script>
            <script src="<c:url value="/resources/admin/assets/scripts/klorofil-common.js" />"></script>
    </body>
</html>
