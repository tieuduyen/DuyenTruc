<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

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
                                    <span class="number">${countUsers}</span>
                                    <span class="title">Users</span>
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
                                    <h3 class="panel-title">Users List</h3>
                                    <div class="right">
                                        <div class="dropdown" style="padding-right: 5em;">
                                            <button class="dropbtn" style="border: 1px solid black;">
                                                <strong>Sort</strong>
                                            </button>
                                            <div class="dropdown-content">
                                                <a href="${pageContext.request.contextPath}/sort-by-username-asc">Sort Username By A-Z <i class="fa fa-arrow-down"></i> </a>
                                                <a href="${pageContext.request.contextPath}/sort-by-username-desc">Sort Username By Z-A <i class="fa fa-arrow-up"></i> </a>
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
                                        <button type="button" class="btn-remove">
                                            <i class="lnr lnr-cross"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>User Name</th>
                                                <th>Email</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Sex</th>
                                                <th>User Information</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="users" items="${usersList}">
                                                <tr>
                                                    <td>${users.username}</td>
                                                    <td>${users.email}</td>
                                                    <td><a href="#">${users.name}</a></td>
                                                    <td>${users.phone}</td>
                                                    <td>${users.sex}</td>
                                                    <td><a href="${pageContext.request.contextPath}/view-profile-user/${users.id}" style="color: #0059fd;">View</a></td>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/view-users-list/1">1</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/view-users-list/2">2</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/view-users-list/3">3</a></li>
                    </ul> 
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
