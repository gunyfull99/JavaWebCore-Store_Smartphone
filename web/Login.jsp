<%@page import="dao.Account"%>
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
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <title>Login Form</title>
    </head>
    <body>
        <!--        <div id="logreg-forms">
                    <div class="signup">
                        <form action="login1" class="form_signup form-signin" method="post">
                            <div class="form_head">
                                <h1>LOGIN</h1>
                            </div>
                            <h1 class="alert">${mess}</h1>
                            <div class="form_group">
                                <input style="border-color: ${border}" type="text" class="form_input" placeholder="Account" name="username" >
                            </div>
                            <div class="form_group  ">
                                <input style="border-color: ${border}" id="a" type="password" class="form_input" placeholder="Password" name="password" >
                            </div>
                            <img  class="openPass"  src="css/Hide-128.jpg" onclick="myfun()" >
                            <div class="forgot_pass">
                                <a href="#">FORGOT PASS</a>
                            </div>
                            <div class="form_group">
                                <input type="submit" class="form_submit" value="LOGIN"  />
                            </div>
                        </form>
                        <form action="toSignup" method="post">
                            <div class="form_group">
                                <input type="submit"  class="form_submit" id="btn-signup"  value="sign up"/>
                            </div>
                        </form>
                    </div>
                </div>-->

        <div class="container">
            <div class="d-flex justify-content-center h-100">

                <div class="card">
                    <form action="login1" method="post">
                        <div class="card-header">
                            <h3>Sign In</h3>

                            <div class="d-flex justify-content-end social_icon">
                                <span><i class="fab fa-facebook-square"></i></span>
                                <span><i class="fab fa-google-plus-square"></i></span>
                                <span><i class="fab fa-twitter-square"></i></span>
                            </div>
                            <h8 style="color:red" class="alert">${mess}</h8>
                        </div>
                        <div class="card-body">

                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input  name="username" value="${requestScope.usernameC}"  style="border: 3px solid ${border}"  type="text" class="form-control" placeholder="username">

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input name="password" value="${requestScope.passwordC}"   style="border: 3px solid ${border}"  type="password" class="form-control" placeholder="password">
                            </div>

                            <div class="row align-items-center remember">
                                <input name="remember" value="1" type="checkbox">Remember Me
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn float-right login_btn btn-right">
                            </div>

                        </div>
                    </form>

                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                Don't have an account?<a href="signup.jsp">Sign Up</a>
                            </div>
                            <div class="d-flex justify-content-center">
                                <a href="#">Forgot your password?</a>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>