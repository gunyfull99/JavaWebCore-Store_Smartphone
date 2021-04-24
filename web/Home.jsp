<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/footer.css">
        <jsp:useBean id="p" class="dao.DAO"></jsp:useBean>
            <style>
                /* Make the image fully responsive */
                .carousel-inner img {
                    width: 100%;
                    height: 100%;
                }
            </style>
        </head>
        <body>

            <!--menu-->
        <jsp:include page="Menu.jsp"></jsp:include>
            <!--end Menu-->
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!--left-->
                <jsp:include page="Flex_Left.jsp"></jsp:include>
                    <!--end left-->

                    <div  class="col-sm-9">
                        <div id="content" class="row">
                        <c:forEach items="${list}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="image/${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block boxprice">${o.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="add2cart?pid=${o.id}" class="btn btn-success btn-block boxcart">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <div class="alignPage">
                <ul class="pagination">
                    <li class="page-item ${tag==1 ?"disabled" :""} "><a class="page-link " href="home?page=${tag-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
                            <c:forEach begin="1" end="${numberPage}" var="i">
                        <li class="page-item ${i==tag ? "active": ""} "><a href="home?page=${i}" class="page-link">${i}</a></li>
                        </c:forEach>
                    <li class="page-item ${tag==5 ?"disabled" :""}"><a href="home?page=${tag+1}" class="page-link"><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                </ul>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- End Footer -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function searchByAjax(p) {
                var txtSearch = p.value;
                $.ajax({
                    url: "/project_web/searchAjax",
                    type: "get",
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;

                    },

                });
            }
            function category(id) {

                $.ajax({
                    url: "/project_web/category",
                    type: "get",
                    data: {
                        cid: id
                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;

                    },

                });
            }

        </script>


    </body>
</html>

