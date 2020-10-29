<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <style>
            * {
                box-sizing: border-box;
            }

            #myInput {
                background-repeat: no-repeat;
            }

            #myTable {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #myTable th, #myTable td {
                text-align: left;
                padding: 12px;
            }

            #myTable tr {
                border-bottom: 1px solid #ddd;
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #f1f1f1;
            }
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
        </style>
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
                                    <h3 class="panel-title">City List</h3>
                                    <div class="right">
                                        <div class="dropdown" style="padding-right: 2em;">
                                            <button class="dropbtn" style="border: 1px solid black; width: 100%;">
                                                <strong>Sort City Name A-Z </strong>
                                            </button>
                                            <div class="dropdown-content">
                                                <ul class="pagination">
                                                    <li class="active">
                                                        <a href="${pageContext.request.contextPath}/sort-by-city-name-asc/1" class="active">Sort City Name A-Z 
                                                            <i class="fa fa-arrow-down"></i> 
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/sort-by-city-name-desc/1">Sort City Name Z-A 
                                                            <i class="fa fa-arrow-up"></i> 
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <button type="button" class="" style="padding-right: 2em;">
                                            <form class="example" action="${pageContext.request.contextPath}/search-city" method="get" style="margin:auto;">
                                                <input type="text" name="searchCity" id="searchCity" value="${model.cityList}" placeholder="Search..."> 
                                                <button type="submit" style="padding-right: 4em;"><i class="fa fa-search"></i></button>
                                            </form>
                                        </button>
                                        <button type="button" class="" style="padding-right: 2em;">
                                            <a href="${pageContext.request.contextPath}/addNewCity">
                                                <i class="lnr lnr-plus-circle"></i> Add City
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
                                                <th style="width: 250px; text-align: center;"></th>
                                                <th style="text-align: center;"></th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach var="city" items="${cityAscList}">
                                                <tr>
                                                    <td><img src="<c:url value="/resources/images/${city.cityImages}" />" alt="${city.cityImages}" style="width:250px;height:150px;"></td>
                                                    <td style="text-align: center; padding-top: 3em;"><h3>${city.name}</h3></td>
                                                    <td style="text-align: center; padding-top: 4em;"><a href="${pageContext.request.contextPath}/city-manager/${city.id}" style="color: #0059fd;"><i class="lnr lnr-eye"></i> View</a></td>
                                                    <td style="text-align: center; padding-top: 4em;"><a href="${pageContext.request.contextPath}/edit-city/${city.id}" style="color: #0059fd;"><i class="lnr lnr-pencil"></i> Edit</a></td>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/sort-by-city-name-asc/1">1</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/sort-by-city-name-asc/2">2</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/sort-by-city-name-asc/3">3</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
