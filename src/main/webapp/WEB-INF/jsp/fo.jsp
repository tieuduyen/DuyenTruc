<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row offers_items">

            <!-- Offers Item -->
            <c:forEach var="roomType" items="${roomType}">
                <div class="col-lg-6 offers_col">
                    <div class="offers_item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="offers_image_container">
                                    <!-- Image by https://unsplash.com/@kensuarez -->
                                    <div class="offers_image_background" style="background-image:url(<c:url value="/resources/images/${roomType.images}"/>)"></div>
                                    <div class="offer_name"><a href="#"></a></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="offers_content">
                                    <div class="offers_price">$70<span>1 đêm</span></div>
                                    <div class="rating_r rating_r_4 offers_rating">
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                    </div>
                                    <p class="offers_text">${roomType.descriptions}</p>

                                    <div class="offers_link"><a href="offers.html">read more</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
<div class="row intro_items">

                    <!-- Intro Item -->
                    <c:forEach var="bestCity" items="${bestCity}">
                        <div class="col-lg-4 intro_col">
                            <div class="intro_item">
                                <div class="intro_item_overlay"></div>
                                <!-- Image by https://unsplash.com/@dnevozhai -->
                                <div class="intro_item_background" style="background-image:url(<c:url value="/resources/images/${bestCity.cityImages}"/>)"></div>
                                <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">                             
                                    <div class="button intro_button"><div class="button_bcg"></div><a href="#">see more<span></span><span></span><span></span></a></div>
                                    <div class="intro_center text-center">                             
                                        <h1>${bestCity.name}</h1>
                                        <div class="rating rating_4">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>