<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Upload File</h1>
        <form action="uploadFile" method="post" enctype="multipart/form-data">
            <input name="cityImages" type="file" >
            <input type="submit" name="upload" value="Upload">
        </form>    
    </body>
</html>
