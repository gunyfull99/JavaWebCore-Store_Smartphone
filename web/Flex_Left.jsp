
<jsp:useBean id="p" class="dao.DAO"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3" >
        <div style="background-color: yellow;color: black" class="card-header   text-uppercase"><i  class="fa fa-th-list"></i> Categories</div>   
        <ul      accesskey="" class="list-group category_block">
            <c:forEach  items="${p.ALLCate}" var="o">
                <li class="list-group-item text-black ${cateID == o.id ? "active" : ""} "><a style="cursor: pointer" onclick="category(${o.id})">${o.name}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div style="background-color: yellow;color: black"class="card-header   text-uppercase"><i  class="fa fa-star"></i>New Product</div>
        <div class="card-body">
            <img class="img-fluid" src="image/${p.last.image}" />
            <h5 class="card-title">${p.last.name}</h5>
            <p class="card-text">${p.last.description}</p>
            <p class="bloc_left_price">${p.last.price} $</p>
        </div>
    </div>
</div>