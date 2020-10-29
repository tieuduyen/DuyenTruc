<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
    <body>  
        <h1>Users List</h1>    
        <table border="2" width="70%" cellpadding="2">    
            <tr>
                <th>Id</th>
                <th>Email</th>
                <th>Name</th>
                <th>Phone</th>
            </tr>    
            <c:forEach var="users" items="${usersList}">     
                <tr>    
                    <td>${users.id}</td>       
                    <td>${users.email}</td>   
                    <td>${users.name}</td> 
                    <td>${users.phone}</td> 
                </tr>    
            </c:forEach>    
        </table>    
        <br/>    
        <a href="${pageContext.request.contextPath}/test/1">1</a>     
        <a href="${pageContext.request.contextPath}/test/2">2</a>     
        <a href="${pageContext.request.contextPath}/test/3">3</a>    
    </body>  
</html>  