<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <style>
            .dropbtn {
                background-color: #4CAF50;
                color: #0058c3;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                width: 100px;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                width: 200px;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
                width: 200px;

            }

            .dropdown:hover .dropdown-content {
                display: block;
                width: 200px;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="panel panel-headline">
                        <div class="panel-body" style="padding-left: 36%;">
                            <div class="metric" style="width: 40%;">
                                <span class="icon"><i class="fas fa-users"></i></span>
                                <p>
                                    <span class="number">${countCity}</span>
                                    <span class="title">City</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- END OVERVIEW -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Hotel in <c:catch var="hotel">${city.name}</c:catch></h3>
                                        <div class="right">
                                            <div class="dropdown" style="padding-right: 7em;">
                                                <button class="dropbtn" style="border: 1px solid black;">
                                                    <strong>Sort</strong>
                                                </button>
                                                <div class="dropdown-content">
                                                    <a href="${pageContext.request.contextPath}/sort-by-hotel-name-asc/1">Sort Hotel Name A-Z <i class="fa fa-arrow-down"></i> </a>
                                                <a href="${pageContext.request.contextPath}/sort-by-hotel-name-desc/1">Sort Hotel Name Z-A <i class="fa fa-arrow-up"></i> </a>
                                            </div>
                                        </div>
                                        <button type="button" class="" style="padding-right: 2em;">
                                            <form class="example" action="${pageContext.request.contextPath}/search-hotel" method="get" style="margin:auto;">
                                                <input type="text" name="searchHotel" id="searchHotel" value="${model.hotelList}" placeholder="Search...">
                                                <button type="submit"><i class="fa fa-search"></i></button>
                                            </form>
                                        </button>
                                        <button type="button" class="" style="padding-right: 2em;">
                                            <a href="${pageContext.request.contextPath}/addNewHotel">
                                                <i class="lnr lnr-plus-circle"></i> Add Hotel
                                            </a>
                                        </button>
                                        <button type="button" class="btn-toggle-collapse">
                                            <i class="lnr lnr-chevron-up"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 250px; text-align: center;">Hotel Images</th>
                                                <th style="text-align: center;">Hotel Name</th>
                                                <th style="text-align: center;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="hotel" items="${availableHotel}">
                                                <tr>
                                                    <td><img src="<c:url value="/resources/images/${hotel.images}" />" alt="${hotel.images}" style="width:250px;height:150px;"></td>
                                                    <td style="text-align: center; padding-top: 3em;"><h3>${hotel.name}</h3></td>
                                                    <td style="text-align: center; padding-top: 4em;">
                                                        <a href="${pageContext.request.contextPath}/hotel-manager/${hotel.id}" style="color: #0059fd;"><i class="lnr lnr-eye"></i> View</a><br><br>
                                                        <a href="${pageContext.request.contextPath}/edit-hotel/${hotel.id}" style="color: #0059fd;"><i class="lnr lnr-pencil"></i> Edit</a><br><br>
                                                         <div class="button book_button" data-toggle="modal" data-target="#myModal"><a style="color: red;"><i class="lnr lnr-trash"></i> Delete</a></div>
                                                        <div class="modal" id="myModal">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-body">
                                                                        <h3 style="text-align: center;">
                                                                            Do you want to delete Hotel: 
                                                                            <p style="color: tomato;">${hotel.name}</p>
                                                                        </h3>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-danger">
                                                                            <a href="${pageContext.request.contextPath}/delete-hotel/${hotel.id}" style="color: white;">
                                                                                <i class="lnr lnr-trash"></i> Delete
                                                                            </a>
                                                                        </button>
                                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                                            <i class="lnr lnr-cross"></i> Close
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                </div>
                <div style="text-align: center;">
                    <ul class="pagination">
                        <li class="active"><a href="${pageContext.request.contextPath}/view-hotel-list/1">1</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/view-hotel-list/2">2</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/view-hotel-list/3">3</a></li>
                    </ul>
                </div>
            </div>
            <%--
            <div class="main-content">
                <div class="container-fluid">
                    <!-- END OVERVIEW -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Hotel in <c:catch var="hotel">${city.name}</c:catch></h3>
                                        <div class="right">
                                            <button type="button" class="" style="padding-right: 2em;">
                                                <a href="${pageContext.request.contextPath}/addNewHotel">
                                                <i class="lnr lnr-plus-circle"></i> Add Hotel
                                            </a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                    <c:forEach var="hotel" items="${availableHotel}">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- RECENT PURCHASES -->
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h2 class="panel-title">${hotel.name}</h2>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse">
                                                <i class="lnr lnr-chevron-up"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="profile-header">
                                                    <div style="height: 500px; background-image:url(<c:url value="/resources/images/${hotel.images}" />)">
                                                        <h2 class="name" style="padding-top: 50%;">
                                                            <strong>${hotel.name}</strong>
                                                        </h2>
                                                    </div>
                                                    <div class="profile-stat" style="background-color: #122b40;">
                                                        <div class="row">
                                                            <div class="col-md-4 stat-item">
                                                                <a href="${pageContext.request.contextPath}/hotel-manager/${hotel.id}">
                                                                    <i class="lnr lnr-eye"></i> View
                                                                </a>
                                                            </div>
                                                            <div class="col-md-4 stat-item">
                                                                <a href="${pageContext.request.contextPath}/edit-hotel/${hotel.id}">
                                                                    <i class="lnr lnr-pencil"></i> Edit
                                                                </a>
                                                            </div>
                                                            <div class="col-md-4 stat-item" style="">
                                                                <a href="${pageContext.request.contextPath}/delete-hotel/${hotel.id}">
                                                                    <i class="lnr lnr-trash"></i> Delete
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <h4><strong><i class="fa fa-map-signs"></i> Address: </strong> ${hotel.address}</h4>
                                                <h4><strong> <i class="fa fa-envelope"></i> Email: </strong> ${hotel.email}</h4>
                                                <h4><strong><i class="fa fa-phone"></i> Phone: </strong> ${hotel.phone}</h4><br>
                                                <h4><strong><i class="fa fa-book"></i> Introduction: </strong> ${hotel.introduction}</h4>
                                            </div>
                                        </div><br>
                                    </div>
                                </div>
                                <!-- END RECENT PURCHASES -->
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>
            --%>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
