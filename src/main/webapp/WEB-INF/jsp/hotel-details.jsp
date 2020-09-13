<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Htel Page</title>
    </head>
    <body>
        <table id="table">
            <thead>
                <tr>
                    <th>Hotel Id</th>
                    <th>Hotel Name</th>
                    <th>Hotel Phone</th>
                    <th>Hotel Email</th>
                    <th>Hotel Images</th>
                    <th>Rate</th>
                    <th>Hotel Address</th>
                    <th>Promotion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hotel" items="${hotelList}">
                    <tr>
                        <td>${hotel.id}</td>
                        <td><a href="${pageContext.request.contextPath}/view-room/${hotel.name}">${hotel.name}</a></td>
                        <td>${hotel.phone}</td>
                        <td>${hotel.email}</td>
                        <td>${hotel.images}</td>
                        <td>${hotel.rate}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.promotion}</td>
                    </tr>
                </c:forEach>
        </table>
    </body>
</html>
