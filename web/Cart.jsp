<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
    </head>
    <div class="container">

        <div class="card" style="margin-top: 100px;">
            <article style="height: 100px;" class="bg-secondary mb-3">  
                <div class="card-body text-center">
                    <h2 style="color:white">YOUR CART</h2>
                </div>
            </article>

            <table class="table table-hover shopping-cart-wrap"style="margin-top: 100px;">
                <thead class="text-muted">
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col" width="120">Quantity</th>
                        <th scope="col" width="120">Price</th>
                        <th scope="col" width="120">Total</th>
                        <th scope="col" width="200" class="text-right">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.listCart}" var="l">
                    <form action="updateCart?pid=${l.id}" method="post">
                        <c:set var="total" value="${total +l.price*l.quantity }"></c:set>
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap"><img height="100px" width="100px" src="image/${l.image}" class="img-thumbnail img-sm"></div>
                                    <figcaption class="media-body">,
                                        <h6 class="title text-truncate">${l.name} </h6>
                                    </figcaption>
                                </figure> 
                            </td>
                            <td> 
                                <input name="updateQuantity" style="text-align: center" type="number" min="1"  value="${l.quantity}">
                            </td>
                            <td> 
                                <div class="price-wrap"> 
                                    <var style="font-weight: bold"  class="price"> ${l.price}</var> 
                                </div> 
                            </td>
                            <td style="font-weight: bold"> 
                                ${l.price*l.quantity}
                            </td>
                            <td class="text-right"> 
                                <button type="submit"  class="btn btn-outline-success" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-refresh" aria-hidden="true"></i></button> 
                                <a href="removeCart?pid=${l.id}" class="btn btn-outline-danger"> x Remove</a>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
                <form action="checkOut"method="post">
                    <tfoot>
                        <tr>
                            <td><a href="home" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                            <td colspan="1" class="hidden-xs"></td>
                            <td><a style="background-color:red;color:white" href="removeAllCart" class="btn btn-block">Remove All</a></td>
                            <td class="hidden-xs text-center"><strong>TOTAL ${total}</strong></td>
                            <td><a onclick="return confirm('Are you sure check out ?')" href="checkOut?total1=${total}" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
                        </tr>
                    </tfoot>
                </form>

            </table>
        </div> <!-- card.// -->
        <article style="height: 100px;" class="bg-secondary mb-3">  
            <div class="card-body text-center">

            </div>
        </article>
    </div> 

</html>