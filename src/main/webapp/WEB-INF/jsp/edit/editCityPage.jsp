<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit City Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css_addNewForm/form.css" />">
    </head>
    <body>
        <h1>Edit City</h1>
        <div class="container">
            <mvc:form modelAttribute="city" action="${pageContext.request.contextPath}/update-city" method="post" enctype="multipart/form-data">
                <label>City ID</label>
                <mvc:input path="id" readonly="true" />

                <label>City Name</label>
                <mvc:input path="name" required="true" />

                <label>City Images</label><br>
                <img src="<c:url value="/resources/images/${city.cityImages}"/>" alt="${city.cityImages}" style="width: 75%; height:400px;"><br>
                <mvc:input path="cityImages" type="text" required="true"/>
                <input type="file" name="file" required="true"><br>

                <input type="submit" value="Update">
            </mvc:form>
        </div>

    </body>
</html>
