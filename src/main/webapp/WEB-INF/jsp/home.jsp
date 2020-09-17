<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hotel Booking</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css"/>">
        <link href="<c:url value="plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="<c:url value="plugins/OwlCarousel2-2.2.1/owl.carousel.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="plugins/OwlCarousel2-2.2.1/owl.theme.default.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="plugins/OwlCarousel2-2.2.1/animate.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css"/>">
    </head>
    <jsp:include page="header.jsp" />
    <body>
        <jsp:include page="slide.jsp" />
        <!-- Search -->
        <div class="search">


            <!-- Search Contents -->

            <div class="container fill_height">
                <div class="row fill_height">
                    <div class="col fill_height">
                        <!-- Search Panel -->

                        <div class="search_panel active">
                            <form action="#" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">

                                <div class="search_item">
                                    <div>Chọn điểm đến</div>
                                    <select name="destination" id="destination_1" class="dropdown_item_select search_input">
                                        <c:forEach var="city" items="${city}">
                                            <option>${city.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="search_item">
                                    <div>ngày đến</div>
                                    <input type="date" class="check_in search_input">
                                </div>
                                <div class="search_item">
                                    <div>ngày đi</div>
                                    <input type="date" class="check_out search_input">
                                </div>
                                <div class="search_item">
                                    <div>số người</div>
                                    <select name="rooms" id="rooms" class="dropdown_item_select search_input">
                                        <c:forEach var="number" begin="1" end="20">
                                            <option>${number}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="search_item">
                                    <div>trẻ em</div>
                                    <select name="adults" id="adults" class="dropdown_item_select search_input">
                                        <c:forEach var="number" begin="0" end="9">
                                            <option>${number}</option>
                                        </c:forEach>

                                    </select>
                                </div><br><br>
                                <button class="button search_button">search<span></span><span></span><span></span></button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>		
        </div>

        <!-- Intro -->

        <div class="intro">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h2 class="intro_title text-center">We have the best tours</h2>
                    </div>
                </div>
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
            </div>
        </div>

        <!-- Offers -->

        <div class="offers">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="section_title">the best offers with rooms</h2>
                    </div>
                </div>
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
            </div>
        </div>

        <div class="trending">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="section_title">Why book with booking hotel ?</h2>
                    </div>
                </div>
                <div class="row trending_container">

                    <!-- Trending Item -->
                    <div class="col-lg-6 col-sm-6">
                        <div class="trending_item clearfix">
                            <div class="trending_image"><i class="fa fa-tags"></i></div>
                            <div class="trending_content">
                                <div class="trending_title"><a href="#">Giá rẻ mỗi ngày với ưu đãi đặc biệt</a></div>
                            </div>
                        </div>
                    </div>

                    <!-- Trending Item -->
                    <div class="col-lg-6 col-sm-6">
                        <div class="trending_item clearfix">
                            <div class="trending_image"><i class="fa fa-credit-card"></i></div>
                            <div class="trending_content">
                                <div class="trending_title"><a href="#">Phương thức thanh toán an toàn và linh hoạt</a></div>
                            </div>
                        </div>
                    </div>

                    <!-- Trending Item -->
                    <div class="col-lg-6 col-sm-6">
                        <div class="trending_item clearfix">
                            <div class="trending_image"><i class="fa fa-check-circle"></i></div>
                            <div class="trending_content">
                                <div class="trending_title"><a href="#">Khách thật, đánh giá thật</a></div>
                            </div>
                        </div>
                    </div>

                    <!-- Trending Item -->
                    <div class="col-lg-6 col-sm-6">
                        <div class="trending_item clearfix">
                            <div class="trending_image"><i class="fa fa-comments"></i></div>
                            <div class="trending_content">
                                <div class="trending_title"><a href="#">Hỗ trợ khách hàng 24/7</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <jsp:include page="footer.jsp"/>

</html>