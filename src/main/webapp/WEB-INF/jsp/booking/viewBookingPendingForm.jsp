<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                background-color: whitesmoke;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <!-- OVERVIEW -->
                    <div class="panel panel-headline">
                        <div class="panel-body" style="padding-left: 36%;">
                            <div class="metric" style="width: 40%;">
                                <span class="icon"><i class="fas fa-calendar-alt"></i></span>
                                <p>
                                    <span class="number">${countBookingPending}</span>
                                    <span class="title">Booking Pending</span>
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
                                    <h2 class="panel-title">Booking Pending</h2>
                                    <div class="right">
                                        <div class="dropdown" style="padding-right: 6em;">
                                            <button class="dropbtn" style="border: 1px solid black;">
                                                <strong>Pending</strong>
                                            </button>
                                            <div class="dropdown-content">
                                                <a href="${pageContext.request.contextPath}/booking-pending/1">Pending</a>
                                                <a href="${pageContext.request.contextPath}/booking-processed/1">Processed</a>
                                                <a href="${pageContext.request.contextPath}/booking-cancelled/1">Cancelled</a>
                                            </div>
                                        </div>
                                        <button type="button" class="" style="padding-right: 2em;">
                                            <form class="example" action="${pageContext.request.contextPath}/search-user" method="get" style="margin:auto;">
                                                <input type="text" name="searchUser" id="searchUser" value="${model.usersList}" placeholder="Search...">
                                                <button type="submit" style="display: none;"><i class="fa fa-search"></i></button>
                                            </form>
                                        </button>
                                        <button type="button" class="btn-toggle-collapse">
                                            <i class="lnr lnr-chevron-up"></i>
                                        </button>
                                    </div>
                                </div>
                                <c:if test="${bookingPending.size() == 0}">
                                    <h4 style="text-align: center; padding-top: 1em;">There are no Booking Pending!</h4>
                                </c:if>
                                <c:if test="${bookingPending.size() > 0}">
                                    <div class="panel-body no-padding">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Booking No.</th>
                                                    <th>User</th>
                                                    <th>Booking Date</th>
                                                    <th>Status</th>
                                                    <th>Booking Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="booking" items="${bookingPending}">
                                                    <tr>
                                                        <td>${booking.id}</td>
                                                        <td><a href="${pageContext.request.contextPath}/view-profile-user/${booking.users.id}">${booking.users.email}</a></td>
                                                        <td>${booking.bookingDateFormatted}</td>
                                                        <td><span class="label label-warning">${booking.status}</span></td>
                                                        <td><a href="${pageContext.request.contextPath}/view-booking-details/${booking.id}">See Details</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                </div>
                <div style="text-align: center;">
                    <ul class="pagination">
                        <li class="active"><a href="${pageContext.request.contextPath}/booking-pending/1">1</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/booking-pending/2">2</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/booking-pending/3">3</a></li>
                    </ul> 
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
