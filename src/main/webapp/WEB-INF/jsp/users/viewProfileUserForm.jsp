<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="panel panel-profile">
                        <div class="clearfix">
                            <!-- LEFT COLUMN -->
                            <c:catch var="users">
                                <div class="profile-left">
                                    <!-- PROFILE HEADER -->
                                    <div class="profile-header">
                                        <div style="height: 200px; background-image:url(<c:url value="/resources/images/profile.png" />)">
                                            <h1 class="name" style="padding-top: 100px; color: red; font-size: 2.5em;">
                                                <strong>${users.name}</strong>
                                            </h1>
                                        </div>
                                        <div class="profile-stat">
                                            <div class="row">
                                                <div class="col-md-6 stat-item">
                                                    ${countBookingByUser} <span>Booking</span>
                                                </div>
                                                <div class="col-md-6 stat-item">
                                                    ${countCommentByUser} <span>Comment</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END PROFILE HEADER -->
                                    <!-- PROFILE DETAIL -->
                                    <div class="profile-detail">
                                        <div class="profile-info">
                                            <h4 class="heading">Basic Info</h4>
                                            <ul class="list-unstyled list-justify">
                                                <li>User name<span>${users.username}</span></li>
                                                <li>Birth Date <span>${users.birthDateFormatted}</span></li>
                                                <li>Phone <span>${users.phone}</span></li>
                                                <li>Email <span>${users.email}</span></li>
                                                <li>Sex <span>${users.sex}</span></li>
                                            </ul>
                                        </div>
                                        <div class="profile-info">
                                            <h4 class="heading">Social</h4>
                                            <ul class="list-inline social-icons">
                                                <li><a href="#" class="facebook-bg" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#" class="twitter-bg" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#" class="google-plus-bg" data-toggle="tooltip" title="Google"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a href="#" class="github-bg" data-toggle="tooltip" title="Github"><i class="fa fa-github"></i></a></li>
                                                <li><a href="#" class="reddit-bg" data-toggle="tooltip" title="Reddit"><i class="fa fa-reddit"></i></a></li>
                                                <li><a href="#" class="pinterest-bg" data-toggle="tooltip" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- END PROFILE DETAIL -->
                                </div>
                            </c:catch>
                            <!-- END LEFT COLUMN -->
                            <!-- RIGHT COLUMN -->
                            <div class="profile-right">
                                <h4 class="heading">Samuel's Awards</h4>
                                <!-- AWARDS -->
                                <div class="awards">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-star award-icon"></span>
                                                </div>
                                                <span>Long-Time Users</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-user award-icon"></span>
                                                </div>
                                                <span>New Users</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-diamond award-icon"></span>
                                                </div>
                                                <span>Users Premium</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="award-item">
                                                <div class="hexagon">
                                                    <span class="lnr lnr-smile award-icon"></span>
                                                </div>
                                                <span>Users Friendly</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center"><a href="#" class="btn btn-default">See all awards</a></div>
                                </div>
                                <!-- END AWARDS -->
                                <!-- TABBED CONTENT -->
                                <div class="custom-tabs-line tabs-line-bottom left-aligned">
                                    <ul class="nav" role="tablist">
                                        <li class="active">
                                            <a href="#tab-bottom-left1" role="tab" data-toggle="tab">
                                                Comment <span class="badge"> ${countCommentByUser} </span>
                                            </a>
                                        </li> 
                                        <li>
                                            <a href="#tab-bottom-left2" role="tab" data-toggle="tab">
                                                Booking <span class="badge"> ${countBookingByUser} </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab-bottom-left1">
                                        <c:forEach var="comment" items="${commentList}">
                                            <ul class="list-unstyled activity-timeline">
                                                <li>
                                                    <i class="fa fa-comment activity-icon"></i>
                                                    <p>Commented on hotel: 
                                                        <a href="${pageContext.request.contextPath}/hotel-manager/${comment.hotel.id}" style="color: tomato;">${comment.hotel.name}</a>
                                                        <span class="timestamp">${comment.commentDateFormatted}</span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                        </div>
                                    <div class="tab-pane fade" id="tab-bottom-left2">
                                        <div class="table-responsive">
                                            <table class="table project-table">
                                                <thead>
                                                    <tr>
                                                        <th>Booking No.</th>
                                                        <th>Booking Date</th>
                                                        <th>Status</th>
                                                        <th>Booking Details</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="booking" items="${bookingList}">
                                                        <tr>
                                                            <td>${booking.id}</td>
                                                            <td>${booking.bookingDateFormatted}</td>
                                                            <c:if test="${booking.status == 'Processed'}">   
                                                                <td><span class="label label-success">${booking.status}</span></td>
                                                                </c:if>
                                                                <c:if test="${booking.status == 'Pending'}">   
                                                                <td><span class="label label-warning">${booking.status}</span></td>
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
                                    </div>
                                </div>
                                <!-- END TABBED CONTENT -->
                            </div>
                            <!-- END RIGHT COLUMN -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
        <!-- END MAIN -->
        <div class="clearfix"></div>
    </div>
</body>
</html>
