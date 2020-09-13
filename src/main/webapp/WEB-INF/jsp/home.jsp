<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Hotel Page</title>
    </head>
    <body>
        <table id="table">
            <thead>
                <tr>
                    <th>City Name</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="city" items="${city}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/view/${city.name}">${city.name}</a></td>
                </tr>
            
        </c:forEach>
                </tbody>
    </table>
</body>
</html>
