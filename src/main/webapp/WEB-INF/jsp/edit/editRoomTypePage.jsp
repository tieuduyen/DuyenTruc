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
            <mvc:form modelAttribute="roomType" action="${pageContext.request.contextPath}/update-room-type" method="post" enctype="multipart/form-data">
                <label>Room Type ID</label>
                <mvc:input path="id" readonly="true" />

                <label>Hotel</label>
                <input type="text" value="${roomType.hotel.name}" readonly="true">
                <mvc:input path="hotel.id" readonly="true" type="hidden"/>

                <label>Room Type Name</label>
                <mvc:input path="name" required="true" />

                <label>Room Type Images</label><br>
                <img src="<c:url value="/resources/images/${roomType.images}"/>" alt="${roomType.images}" style="width: 75%; height:400px;"><br>
                <mvc:input path="images" type="text" required="true"/>
                <input type="file" name="file" required="true"><br><br>

                <label>Size</label><br>
                <mvc:input path="size" required="true" />
                
                <label>Price</label><br>
                <mvc:input path="price" required="true" />
                
                <label>Descriptions</label><br>
                <mvc:textarea path="descriptions" required="true" rows="15" cols="104" style="resize: none;"/>

                <input type="submit" value="Save">
            </mvc:form>
        </div>

    </body>
</html>
