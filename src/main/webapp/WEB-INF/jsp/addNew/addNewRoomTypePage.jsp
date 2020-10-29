<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Book Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css_addNewForm/form.css" />">
    </head>
    <body>
        <h1>Add New Room Type</h1>
        <div class="container">
             <mvc:form modelAttribute="roomType" action="${pageContext.request.contextPath}/addNewRoomType/${hotel.id}" method="post" enctype="multipart/form-data">   
                <label>Hotel</label>
                <mvc:select path="hotel.id" items="${hotelList}" readonly="true"/>
                
                <label>Room Type Name</label>
                <mvc:input type="text"  path="name" required="true"/>
                
                <label>Descriptions</label>
                <mvc:input type="text"  path="descriptions" required="true"/>
                
                <label>Size</label>
                <mvc:input type="text"  path="size" required="true"/>
                
                <label>Room Type Images</label><br>
                <input name="file" type="file" /><br><br>
                
                <label>Price</label>
                <mvc:input type="text"  path="price" required="true"/>
                
                <label>Number Of Room</label>
                <mvc:input type="text"  path="quantity" required="true"/>

                <input type="submit" value="Save">
             </mvc:form>
        </div>
    </body>
</html>

