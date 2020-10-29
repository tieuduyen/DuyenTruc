<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Book Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css_addNewForm/form.css" />">
    </head>
    <body>
        <h1>Edit Hotel</h1>
        <div class="container">
            <mvc:form modelAttribute="hotel" action="${pageContext.request.contextPath}/update-hotel" method="post" enctype="multipart/form-data">
                <label>Hotel ID</label>
                <mvc:input path="id" readonly="true" />

                <label>City</label>
                <mvc:select path="city.id" items="${cityList}" />

                <label>Hotel Name</label>
                <mvc:input path="name" required="true" />

                <label>Hotel Images</label><br>
                <img src="<c:url value="/resources/images/${hotel.images}"/>" alt="${hotel.images}" style="width: 75%; height:400px;"><br>
                <mvc:input path="images" type="text" required="true"/>
                <input type="file" name="file" required="true"><br><br>

                <label>Hotel Phone</label>
                <mvc:input path="phone" type="text" required="true"/>

                <label>Hotel Email</label>
                <mvc:input path="email" type="text" required="true"/>

                <label>Hotel Address</label>
                <mvc:input path="address" type="text" required="true"/>

                <label>Hotel Introduction</label><br>
                <mvc:textarea path="introduction" required="true" rows="15" cols="104" style="resize: none;"/>

                <input type="submit" value="Save">
            </mvc:form>
        </div>

    </body>
</html>
