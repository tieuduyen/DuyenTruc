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
        <h1>Add New Hotel</h1>
        <div class="container">
             <mvc:form modelAttribute="hotel" action="${pageContext.request.contextPath}/addNewHotel" method="post" enctype="multipart/form-data">   
                <label>City</label>
                <mvc:select path="city.id" items="${cityList}" />
                
                <label>Hotel Name</label>
                <mvc:input type="text"  path="name" required="true"/>
                
                <label>Hotel Images</label><br>
                <input name="file" type="file" />
                
                <label>Hotel Phone</label>
                <mvc:input name="phone" path="phone" type="text" required="true"/>
                
                <label>Hotel Email</label>
                <mvc:input name="email" path="email" type="text" required="true"/>
                
                <label>Hotel Address</label>
                <mvc:input name="address" path="address" type="text" required="true"/>
                
                <label>Hotel Introduction</label>
                <mvc:input name="introduction" path="introduction" type="text" required="true"/>
                
                <label>Promotion</label>
                <mvc:input name="promotion" path="promotion" type="text" required="true"/>

                <input type="submit" value="Save">
             </mvc:form>
        </div>
    </body>
</html>

