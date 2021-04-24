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
                            <form id="login-form" class="form" action="updateProduct?pid=${detail.id}" method="post">
                                <h3 class="text-center text-info">Edit Product</h3>
                                <div class="form-group">
                                    <label class="text-info">Name</label><br>
                                    <input name="name" value="${detail.name}" type="text"   class="form-control">
                            </div>
                            <div class="form-group">
                                <label  class="text-info">Image</label><br>
                                <input  name="image" value="${detail.image}" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label  class="text-info">Price</label><br>
                                <input name="price"  value="${detail.price}" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="text-info">Title</label><br>
                                <textarea name="title"   class="form-control" required>${detail.title}</textarea>
                            </div>
                            <div class="form-group">
                                <label  class="text-info">Description</label><br>
                                <textarea name="description"   class="form-control" required>${detail.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-control" aria-label="Default select example">
                                    <c:forEach items="${p.ALLCate}" var="o">
                                        <option  ${o.id == detail.cateID ? "selected" : ""} value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <a href="ManagerProduct" class="cancel" >Cancel</a>
                                    
                                <input type="submit"  class="btn btn-info btn-md" value="Save">
                            </div>
                           
                         


                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
