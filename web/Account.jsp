<%-- 
    Document   : Account
    Created on : Dec 12, 2020, 5:46:00 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <jsp:useBean id="p" class="dao.DAO"></jsp:useBean>
        </head>
        <body>
            <table class="table table-bordered table-dark ">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">ID</th>
                        <th scope="col">User</th>
                        <th scope="col">Pass</th>
                        <th scope="col">isSell</th>
                        <th scope="col">isAdmin</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${p.ALLAccount}" var="o">
                    <tr>
                        <th scope="col">
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value=""
                                    id="flexCheckDefault"
                                    />
                            </div>
                        </th>
                        <th scope="row">${o.id}</th>
                        <td>${o.user}</td>
                        <td>${o.pass}</td>
                        <td>${o.isSell}</td>
                        <td>${o.isAdmin}</td>
                        <td>  <button type="button" class="btn btn-danger btn-sm px-3">
                                <i class="fa fa-times-circle" aria-hidden="true"></i>
                            </button></td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    </body>
</html>
