<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="css/css2.css" rel="stylesheet" type="text/css"/>
<jsp:useBean id="p" class="dao.DAO"></jsp:useBean>
    <body>
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="updateCus?cid=${dCus.cid}" method="post">
                            <h3 class="text-center text-info">Edit Product</h3>
                            <div class="form-group">
                                <label class="text-info">Full Name</label><br>
                                <input name="fullName" value="${dCus.fullName}" type="text"   class="form-control">
                            </div>
                            <div class="form-group">
                                <label  class="text-info">address</label><br>
                                <input  name="address" value="${dCus.address}" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label  class="text-info">phone</label><br>
                                <input name="phone"  value="${dCus.phone}" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="text-info">Status</label><br>
                                <textarea name="status"   class="form-control" required>${dCus.status}</textarea>
                            </div>

                            <div class="form-group">

                            </div>
                            <div class="form-group">
                                <a href="manageCustomer" class="cancel" >Cancel</a>

                                <input type="submit"  class="btn btn-info btn-md" value="Save">
                            </div>




                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
