<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:useBean id="p" class="dao.DAO"></jsp:useBean>
            <title>Manage Customer</title>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <link href="css/manager.css" rel="stylesheet" type="text/css"/>
            <style>
                img{
                    width: 200px;
                    height: 120px;
                }
            </style>
        <body>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage Customer</h2>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered table-hover table-dark  ">
                        <thead>
                            <tr>
                                <th>cid</th>
                                <th>fullName</th>
                                <th>address</th>
                                <th>phone</th>
                                <th>status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listCus}" var="o">
                            <tr>

                                <td>${o.cid}</td>
                                <td>${o.fullName}</td>
                                <td>${o.address} </td>
                                <td>${o.phone}</td>
                                <td>${o.status}</td>
                                <td style="text-align: center">
                                    <a style="font-size: 25px"  href="loadCus?cid=${o.cid}"  class="edit" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                    <a style="font-size: 25px" href="deleteCus?cid=${o.cid}"onclick="return confirm('Are you sure delete ${o.fullName}  ?')" class="delete" data-toggle="modal"><i class="fa fa-trash " aria-hidden="true"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="home"><button type="button" class="btn btn-primary">Back to home</button>

            </div>
            <!-- Edit Modal HTML -->

            <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>