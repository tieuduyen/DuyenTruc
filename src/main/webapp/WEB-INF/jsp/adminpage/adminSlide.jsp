<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <!-- OVERVIEW -->
                    <div class="panel panel-headline">
                        <div class="panel-heading">
                            <h3 class="panel-title">Weekly Overview</h3>
                            <p class="panel-subtitle">Period: Oct 14, 2016 - Oct 21, 2016</p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="lnr lnr-home"></i></span>
                                        <p>
                                                <span class="number">${countCity}</span>
                                            <span class="title">City</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-shopping-bag"></i></span>
                                        <p>
                                            <span class="number">1,234</span>
                                            <span class="title">Hotel</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-eye"></i></span>
                                        <p>
                                            <span class="number">123,456</span>
                                            <span class="title">Booking</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="metric">
                                        <span class="icon"><i class="fa fa-bar-chart"></i></span>
                                        <p>
                                            <span class="number">1,234,567</span>
                                            <span class="title">Users</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END OVERVIEW -->
                    <!-- USERS LIST -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Users List</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i
                                                class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>User Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Sex</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="#">Nguyen Van A</a></td>
                                                <td>nvanva</td>
                                                <td>nva@gmail.com</td>
                                                <td>0123131313</td>
                                                <td>Nam</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Booking List</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i
                                                class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Booking No.</th>
                                                <th>Booking Date</th>
                                                <th>Check In Date</th>
                                                <th>Chack Out Date</th>
                                                <th>Booking Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>2020-11-11</td>
                                                <td>2020-11-11</td>
                                                <td>2020-11-10</td>
                                                <td><a href="#">5</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i>
                                                Last 24 hours</span></div>
                                        <div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All
                                                Purchases</a></div>
                                    </div>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Comment LIST -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Comment</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i
                                                class="lnr lnr-chevron-up"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-unstyled todo-list">
                                        <li>
                                            <p>
                                                <span class="title">Le Thi B</span>
                                                <span class="short-description">Very Gooddddddddddddddddddddddddddddddddddddddddddd</span>
                                                <span class="date">2020-11-11</span>
                                            </p>
                                            <div class="controls">
                                                <a href="#"><i class="icon-software icon-software-pencil"></i></a> <a
                                                    href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="list-unstyled todo-list">
                                        <li>
                                            <p>
                                                <span class="title">Nguyen Van A</span>
                                                <span class="short-description">Good</span>
                                                <span class="date">2020-11-11</span>
                                            </p>
                                            <div class="controls">
                                                <a href="#"><i class="icon-software icon-software-pencil"></i></a> <a
                                                    href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- END CommentLIST -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->
        </div>
    </div>
</body>
</html>
