<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Hotel Page</title>
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <jsp:include page="slide.jsp" />
        <div style="padding-top: 400px;">
            <c:forEach var="city" items="${cityList}">
                <a href="${pageContext.request.contextPath}/city/${city.name}"><p>${city.name}</p></a>
            </c:forEach>
        </div>
        <jsp:include page="footer.jsp" />
    </body>

</html>
