
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md navbar-dark bg-dark1">
    <div class="container">
        <a class="navbar-brand" href="home"><img src="css/1.jpg"></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div  class="collapse navbar-collapse justify-content-end " id="navbarsExampleDefault">


            <ul class="menu" >
                <li class="menu_item zzz"><a href="#" class="menu_link ">${sessionScope.idCus} ${sessionScope.nameCus}</a></li>
                    <c:if test="${sessionScope.account1 == null}">
                    <li class="menu_item">
                        <a href="home" class="menu_link"><i class="fa fa-home" aria-hidden="true"></i>   HOME </a>
                        <div class="menu_child">
                        </div>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account1.isAdmin ==1}">
                    <li class="menu_item"><a href="manageAll.jsp" class="menu_link"> Manage All</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account1.isSell ==1}">
                    <li class="menu_item"><a href="ManagerProduct" class="menu_link"></i> Manage Product</a>
                    </c:if>
                </li>
                <c:if test="${sessionScope.account1 == null}">

                    <li class="menu_item"><a href="login1" class="menu_link"><i class="fa fa-sign-in" aria-hidden="true"></i> SIGN IN</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account1 != null}">

                    <li class="menu_item"><a href="removeAccount" class="menu_link"><i class="fa fa-sign-out" aria-hidden="true"></i> SIGN OUT</a></li>
                    </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0 ">
                <div class="input-group input-group-sm">
                    <input oninput="searchByAjax(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a style="background-color: yellow;color: black;border-color: white" class="btn btn-success btn-sm ml-3 " href="Cart.jsp">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">${sessionScope.listCart.size()}</span>
                </a>
            </form>
            <c:if test="${sessionScope.account1 != null}">
                <li class="menu_item zzz"><a href="#" class="menu_link "><i class="fa fa-user-o" aria-hidden="true"></i>HELLO ${sessionScope.account1.user}</a></li>
                </c:if>
        </div>
    </div>
</nav>
<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
    </ul>

    <!-- The slideshow -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://cdn.tgdd.vn/2021/03/banner/reno5-800-300-800x300-1.png" alt="" width="800" height="200">
        </div>
        <div class="carousel-item">
            <img src="https://cdn.tgdd.vn/2021/03/banner/800-300-800x300-8.png" alt="" width="800" height="200">
        </div>
        <div class="carousel-item">
            <img src="https://cdn.tgdd.vn/2021/03/banner/S21-800-300-800x300-2.png" alt="" width="800" height="200">
        </div>
        <div class="carousel-item">
            <img src="https://cdn.tgdd.vn/2021/03/banner/800-300-800x300-4.png" alt="" width="800" height="200">
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
