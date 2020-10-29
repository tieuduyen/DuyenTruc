<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <!-- OVERVIEW -->
                    <div class="panel panel-headline">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fas fa-city"></i></span>
                                        <p>
                                            <span class="number">${countCity}</span>
                                            <span class="title">City</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fas fa-building"></i></span>
                                        <p>
                                            <span class="number">${countHotel}</span>
                                            <span class="title">Hotel</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fas fa-calendar-alt"></i></span>
                                        <p>
                                            <span class="number">${countBooking}</span>
                                            <span class="title">Booking</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-user"></i></span>
                                        <p>
                                            <span class="number">${countUsers}</span>
                                            <span class="title">Users</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-money"></i></span>
                                        <p>
                                            <span class="number">Incomes</span>
                                            <span class="title">${incomesBookingDetailsFormatted}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-headline">
                        <div class="panel-heading">
                            <h3 class="panel-title">Month Overview</h3>
                            <p class="panel-subtitle">Period: Oct 01, 2020 - Oct 31, 2020</p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-bar-chart"></i></span>
                                        <p>
                                            <span class="number">Booking</span>
                                            <span class="title">${countBookingInOctobor}</span>

                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-money"></i></span>
                                        <p>
                                            <span class="number">Incomes in Octobor</span>
                                            <span class="title">${incomesBookingDetailsOctoborFormatted}</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-comments"></i></span>
                                        <p>
                                            <span class="number">Comment</span>
                                            <span class="title">2</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-body no-padding">
                                <h3 class="panel-title" style="text-align: center;">Booking In Octobor</h3>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Booking No.</th>
                                            <th>Booking Date</th>
                                            <th>User</th>
                                            <th>Status</th>
                                            <th>Booking Details</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="booking" items="${bookingInOctobor}">
                                            <tr>
                                                <td>${booking.id}</td>
                                                <td>${booking.bookingDateFormatted}</td>
                                                <td><a href="${pageContext.request.contextPath}/view-profile-user/${booking.users.id}">${booking.users.email}</a></td>
                                                    <c:if test="${booking.status == 'Pending'}">
                                                    <td><span class="label label-warning">${booking.status}</span></td>
                                                    </c:if>
                                                    <c:if test="${booking.status == 'Processed'}">
                                                    <td><span class="label label-success">${booking.status}</span></td>
                                                    </c:if>
                                                    <c:if test="${booking.status == 'Cancelled'}">
                                                    <td><span class="label label-danger">${booking.status}</span></td>
                                                    </c:if>
                                                <td><a href="${pageContext.request.contextPath}/view-booking-details/${booking.id}" style="color: #0099e5;">See Details</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-6"><span class="panel-note"><i class="fa fa-calendar-alt"></i>In Octobor</span></div>
                                    <div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All Purchases</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
