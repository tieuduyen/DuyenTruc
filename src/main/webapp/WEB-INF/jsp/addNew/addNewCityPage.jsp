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
        <h1>Add New City</h1>
        <div class="container">     
            <mvc:form action="${pageContext.request.contextPath}/addNewCity" method="POST" enctype="multipart/form-data" modelAttribute="city" >
                <label>City Name: </label>
                <mvc:input path="name" type="text" />

                <label>City Images: </label>
                <input name="file" type="file" />

                <input type="submit" value="Upload">
            </mvc:form>
            <h2 style="color:red">${errorMessage}</h2>
            <%-- 
            <form  action="${pageContext.request.contextPath}/addNewCity" method="post" enctype="multipart/form-data">
                <label>City Name</label>
                <input type="text" name="name" required="true">

                <label>City Images</label>
                <input type="file" name="cityImages" required="true">

                <input type="submit" value="Save">
            </form>    
                        <mvc:form modelAttribute="city" action="${pageContext.request.contextPath}/addNewCity" method="post" enctype="multipart/form-data">
                            <label>City Name</label>
                            <mvc:input type="text" path="name" required="true" />

                <label>City Images</label>
                <input name="cityImages" type="file" >

                <input type="submit" value="Save">
            </mvc:form>
            --%>

        </div>


    </body>
</html>

