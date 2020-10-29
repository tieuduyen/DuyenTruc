<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">The room types of the hotel <c:catch var="roomType">${hotel.name}</c:catch></h3>
                                        <div class="right">
                                            <button type="button" class="" style="padding-right: 2em;">
                                                <a href="${pageContext.request.contextPath}/addNewRoomType/${hotel.id}">
                                                <i class="lnr lnr-plus-circle"></i> Add Room Type
                                            </a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
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
                                <c:forEach var="roomType" items="${roomTypeList}">
                                    <tr>
                                        <td><img src="<c:url value="/resources/images/${roomType.images}" />" alt="${roomType.images}" style="width:250px;height:150px;"></td>
                                        <td style="text-align: center; padding-top: 3em;"><h4>${roomType.name}</h4></td>
                                        <td style="text-align: center; padding-top: 4em;">
                                            <a href="${pageContext.request.contextPath}/edit-room-type/${roomType.id}" style="color: #0059fd;"><i class="lnr lnr-pencil"></i> Edit</a><br><br>
                                             <div class="button book_button" data-toggle="modal" data-target="#myModal"><a style="color: red;"><i class="lnr lnr-trash"></i> Delete</a></div>
                                            <div class="modal" id="myModal">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <h3 style="text-align: center;">
                                                                Do you want to delete Room Type: 
                                                                <p style="color: tomato;">${roomType.name}</p>
                                                            </h3>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger">
                                                                <a href="${pageContext.request.contextPath}/delete-room-type/${roomType.id}" style="color: white;">
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
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
