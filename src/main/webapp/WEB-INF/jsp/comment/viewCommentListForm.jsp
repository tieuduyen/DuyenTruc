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
                    <div class="panel panel-headline">
                        <div class="panel-body" style="padding-left: 36%;">
                                <div class="metric" style="width: 40%;">
                                    <span class="icon"><i class="fas fa-pencil-square-o"></i></span>
                                    <p>
                                        <span class="number">${countComment}</span>
                                        <span class="title">Comment</span>
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
                                    <h3 class="panel-title">Comment List</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i
                                                class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Hotel</th>
                                                <th>Email</th>
                                                <th>Comment Date</th>
                                                <th>Rate</th>
                                                <th>Content</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="comment" items="${commentList}">
                                                <tr>
                                                    <td><a href="${pageContext.request.contextPath}/hotel-manager/${comment.hotel.id}" style="color: #0059fd;">${comment.hotel.name}</a></td>
                                                    <td><a href="${pageContext.request.contextPath}/view-profile-user/${comment.users.id}" style="color: #0059fd;">${comment.users.email}</a></td>
                                                    <td>${comment.commentDateFormatted}</td>
                                                    <td>${comment.rate}</td>
                                                    <td>${comment.content}</td>
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
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
