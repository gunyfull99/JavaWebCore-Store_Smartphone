<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!--        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">-->
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/styles1.css">
        <title>Login Form</title>
    </head>
    <body>
        <!--        <div class="signup">
                    <form action="signup" class="form_signup form-signup" method="post">
                        <div class="form_head">
                            <h1>SIGN UP</h1>
                        </div>
                        <h1 class="alert">${mess}</h1>
                        <div class="form_group">
        
                            <input type="text" class="form_input" placeholder="Account" name="username" >
                        </div>
                        <div class="form_group ">
        
                            <input type="password" class="form_input" placeholder="Password" name="password" >
                        </div>
                        <div class="form_group">
        
                            <input type="password" class="form_input" placeholder="Re-Password" name="password1" >
        
                            <input type="email" class="form_input" placeholder="email" >
                        </div>
                        <div class="form_group ">
                            <input type="submit"    class="form_submit "   value="SIGN UP"/>
                        </div>
                    </form>
                    <form action="toLogin" method="post">
                        <div class="form_group">
                            <input type="submit" class="form_submit" id="btn-signup"  value="login"/>
                        </div>
                    </form>
        </div>-->
        <div class="container">
            <header class="heading"> Registration-Form</header><hr></hr>
            <form action="signup" method="post">
                <div class="row ">
                    <h7  class="alert">${mess}</h7>

                    <div class="col-sm-12 ">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="firstname">Full Name:</label> </div>
                            <div class="col-xs-8">
                                <input type="text" name="fullName" id="fname" placeholder="Enter your fullName:" class="form-control ">
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 10px;"  class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="firstname">Address:</label> </div>
                            <div class="col-xs-8">
                                <input type="text" name="address" id="fname" placeholder="Enter your address:" class="form-control ">
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 10px;" class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="firstname">Phone:</label> </div>
                            <div class="col-xs-8">
                                <input type="text" name="phone" id="fname" placeholder="Enter your Phone" class="form-control ">
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 10px;" class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="firstname">Account:</label> </div>
                            <div class="col-xs-8">
                                <input type="text" name="username" id="fname" placeholder="Enter your Account:" class="form-control ">
                            </div>
                        </div>
                    </div>




                    <div style="margin-top: 10px;" class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="firstname">Status</label> </div>
                            <div class="col-xs-8">
                                <input type="text" name="status" id="fname" placeholder="Enter your Status" class="form-control ">
                            </div>
                        </div>
                    </div>


                    <!-----For Password and confirm password---->
                    <div style="margin-top: 7px;" class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="pass">Password :</label></div>
                            <div class="col-xs-8">
                                <input type="password" name="password" id="password" placeholder="Enter your Password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 7px;" class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="pass">Re-Password :</label></div>
                            <div class="col-xs-8">
                                <input type="password" name="password1" id="password" placeholder="Enter your Re-Password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-----------For Phone number-------->
                    <div class="col-sm-12">
                        <div class ="row">
                            <div class="col-xs-4 ">
                                <label class="gender"></label>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <input style="margin-right:    50px;"  class="btn btn-warning" type="submit"   value="SIGN UP"/>
                            <a  href="Login.jsp" class=" btn btn-warning" >LOGIN </a>
                        </div>

                    </div>
                </div>	 
            </form>

        </div>	


    </body>
</html>