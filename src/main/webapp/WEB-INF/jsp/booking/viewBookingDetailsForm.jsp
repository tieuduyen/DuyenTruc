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
                    <!-- END OVERVIEW -->
                    <div class="panel panel-headline">
                        <div class="panel-body" style="padding-left: 36%;">
                            <div class="metric" style="width: 40%;">
                                <span class="icon"><i class="fas fa-calendar-alt"></i></span>
                                <p>
                                    <span class="number">${countBookingDetails}</span>
                                    <span class="title">Booking Details</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <c:catch var="booking">
                                        <h2 class="panel-title" style="text-align: center;">Booking No.${id}</h2>
                                    </c:catch>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i
                                                class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead style="text-align: right;">
                                            <tr>
                                                <th style="width: 17%;">Booking Details No.</th>
                                                <th>Hotel</th>
                                                <th>Room Type</th>
                                                <th>Number Of People</th>
                                                <th>Check In Date</th>
                                                <th>Check Out Date</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="bookingDetails" items="${bookingDetailsList}">
                                                <tr>
                                                    <td>${bookingDetails.id}</td>
                                                    <td>${bookingDetails.room.roomType.hotel.name}</td>
                                                    <td>${bookingDetails.room.roomType.name}</td>
                                                    <td>${bookingDetails.numberOfPeople}</td>
                                                    <td>${bookingDetails.checkInDateFormatted}</td>
                                                    <td>${bookingDetails.checkOutDateFormatted}</td>
                                                    <td>${bookingDetails.priceFormatted} đ</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="panel-footer">
                                    <h4 style="text-align: center;"><strong>Total Booking:</strong> ${totalBookingDetailsFormatted} đ</h4>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
