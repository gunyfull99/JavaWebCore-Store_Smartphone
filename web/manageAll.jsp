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
                                <li class="breadcrumb-item"><a href="#">Manage</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!--left-->
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3" >
                            <div style="background-color: yellow;color: black" class="card-header   text-uppercase"><i  class="fa fa-th-list"></i> Categories</div>   
                            <ul      accesskey="" class="list-group category_block">
                                <li class="list-group-item text-black" ><a href="manageCustomer" style="cursor: pointer" >Customer Manager</a></li>
                                <li class="list-group-item text-black" ><a href="ManagerProduct" style="cursor: pointer" >Product manager</a></li>
                                <li class="list-group-item text-black" ><a   onclick="show()" style="cursor: pointer" >Bill Manager</a></li>
                            </ul>
                        </div>
                        <div id="table1" style="display: none">
                            Search Bill   <select id="table2">
                                <option   value="0">Wait</option>
                                <option   value="2">Process</option>
                                <option  value="1">Done</option>
                                <option  value="4">All</option>
                            </select>
                            <a style="cursor: pointer"   onclick="searchBill()"  style="background-color: white">Search</a>
                        </div>
                    </div>
                    <!--end left-->
                    <div style="display: block" id="content1" class="row">
                    </div>
                    <div id="table3" style="display: none" class="col-sm-9">

                        <table id="table3"  style="border-color:yellow" class="table table-bordered ">
                            <thead>

                                <tr>
                                    <th scope="col">Bill ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">View</th>
                                </tr>
                            <c:forEach items="${p.bills}" var="x">

                                <tr>
                                    <td>${x.bid}</td>
                                    <td>${x.recName}</td>
                                    <td>${x.dateCreate}</td>
                                    <td>${x.total}</td>
                                    <c:if test="${x.status==0}">
                                        <td style="color:green;font-weight: bold">Wait</td>
                                    </c:if>
                                    <c:if test="${x.status==1}">
                                        <td style="color:red;font-weight: bold">Done</td>
                                    </c:if>
                                    <c:if test="${x.status==2}">
                                        <td style="color:blue;font-weight: bold">Process</td>
                                    </c:if>
                                    <td><a href="billDetail?bid=${x.bid}" >Detail</a></td>
                                </tr>
                            </c:forEach>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <c:if test="${listBillD!=null}">

                    <div  class="col-sm-9">
                        <form action="done"method="post">
                            <table  style="border-color:yellow" class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;color:red" colspan="2">Name Customer: ${sessionScope.nameCus}</th>
                                        <th style="text-align: center;color:red" colspan="2">Address:  ${sessionScope.addressCus}</th>
                                        <th style="text-align: center;color:red" colspan="2">Phone:  ${sessionScope.phoneCus}</th>
                                    </tr>
                                    <tr>
                                        <th scope="col">Bill ID</th>
                                        <th scope="col">Name Product</th>
                                        <th scope="col">Product ID </th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                    <c:forEach items="${listBillD}" var="x">
                                        <c:set var="total2" value="${total2 +x.price*x.quantity }"></c:set>
                                        <c:set var="bid" value="${x.bid}"></c:set>
                                            <tr>
                                                <td>${x.bid}</td>

                                            <td>${x.nameProduct}</td>
                                            <td>${x.pid}</td>
                                            <td>${x.quantity}</td>
                                            <td>${x.price}</td>
                                            <td>${x.price*x.quantity}</td>
                                        </tr>
                                    <input type="hidden" name="bid"value="${x.bid}">
                                </c:forEach>
                                </thead>
                                <tbody>
                                </tbody>
                                <tr>
                                    <th style="text-align: right" colspan="5">TOTAL</th>
                                    <th>${total2}</th>
                                </tr>
                            </table>
                            <c:if test="${status!=1 && status!=2}">
                                <a  href="done?action=process&bid=${bid}"  onclick="return confirm('Are you sure to Process build  ?')" type="submit" style="background-color: blue;color: white;border:none;margin-left: 10px;padding: 4px;width:90px;border-radius: 20px;text-align: center"> PROCESS</a> 
                                <a  href="done?action=done&bid=${bid}"  onclick="return confirm('Are you sure to DONE build  ?')" type="submit" style="background-color: red;color: white;border: none;padding:4px;width:90px;margin-left: 10px;border-radius: 20px;text-align: center""> DONE </a>
                                <a  href="done?action=cancel&bid=${bid}"  onclick="return confirm('Are you sure to CANCEL build  ?')" type="submit" style="background-color: black;color: white;border: none;padding:4px;width:90px;margin-left: 10px;border-radius: 20px;text-align: center""> Cancel </a>
                            </c:if>

                            <c:if test="${status!=1 && status!=0 }">
                                <a href="done?action=done&bid=${bid}"  onclick="return confirm('Are you sure to DONE build  ?')" type="submit" style="background-color: red;color: white;border: none;padding:4px;width:90px;margin-left: 10px;border-radius: 20px;text-align: center""> DONE </a>
                                <a href="done?action=wait&bid=${bid}" onclick="return confirm('Are you sure to Wait build  ?')" type="submit" style="background-color: green;color: white;border:none;margin-left: 10px;padding:4px;width:90px;border-radius: 20px;text-align: center""> WAIT </a>
                                <a  href="done?action=cancel&bid=${bid}"  onclick="return confirm('Are you sure to CANCEL build  ?')" type="submit" style="background-color: black;color: white;border: none;padding:4px;width:90px;margin-left: 10px;border-radius: 20px;text-align: center""> Cancel </a>
                            </c:if>


                            <a style="margin-left: 10px;background-color: #6c757d;color:white;padding: 6px;border-radius: 20px;text-align: center"" href="manageAll.jsp">BACK</a>
                        </form>
                    </div>
                </c:if>


            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- End Footer -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                     function show() {
                                         if (document.getElementById('table3').style.display == "none") {
                                             document.getElementById('table3').style.display = "block";
                                             document.getElementById('table1').style.display = "block";

                                         } else {
                                             document.getElementById('table3').style.display = "none";
                                             document.getElementById('table1').style.display = "none";
                                         }
                                     }




                                     function searchBill() {
                                         var txtSearch = document.getElementById('table2').value;
                                         document.getElementById('table3').style.display = "none";
                                         $.ajax({
                                             url: "/project_web/searchBill1",
                                             type: "get",
                                             data: {
                                                 searchBill: txtSearch
                                             },
                                             success: function (data) {
                                                 var row = document.getElementById("content1");
                                                 row.innerHTML = data;
                                             },

                                         });
                                     }



        </script>

    </body>
</html>

