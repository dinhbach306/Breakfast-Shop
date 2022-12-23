<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Cart</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
    <!-- Site CSS -->
    <link rel="stylesheet" href="resources/css/style.css"/>
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="resources/css/responsive.css"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/custom.css"/>
    
    <link rel="stylesheet" href="resources/vendor/fontawesome-free/css/all.min.css"/>

</head>

<body>
   <!-- Start Main Top -->
<header class="main-header">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <a class="font-weight-normal h3" href="shopping.jsp" style="color: #010101;">
                Breakfast Shop
                <i class="fa-solid fa-bowl-food"></i>
            </a>
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
                <!--<a class="navbar-brand" href="index.html"><img src="images/logo1.png" class="logo" width="180" height="150" alt=""></a> -->
            </div>
            <!-- End Header Navigation -->


            <!-- Start Atribute Navigation -->
 
            <div class="attr-nav" style="margin-left: 680px;">
                <ul>
                    <li class="side-menu ml-auto">
                        <a href="#">
                            <i class="fa fa-shopping-bag"></i>
                            <c:forEach items="${CART.cart}" var="cart" varStatus="counter">
                            <span class="badge">${counter.count}</span>
                            </c:forEach>
                            <p>My Cart</p>
                        </a>
                    </li>
                </ul>
            </div>
            
            <ul class="navbar-nav ml-auto" style="margin-left: 200px;">
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <c:if test = "${sessionScope.LOGIN_USER != null}">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.LOGIN_USER.fullName}</span>
                                </c:if>
                                    <img style="width: 40px; height:40px;" class="img-profile rounded-circle"
                                    src="resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
            </ul>
            <!-- End Atribute Navigation -->
        </div>    
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<div class="top-search">
    <div class="container">
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-search"></i></span>
            <input type="text" class="form-control" placeholder="Search">
            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
        </div>
    </div>
</div>
<!-- End Top Search -->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="shopping.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <c:if test="${sessionScope.CART != null}">
                            <c:if test="${not empty sessionScope.CART}"></c:if>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Update</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <c:set var = "total" value="0"/>
                                <c:forEach var="food" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                                <form action="MainController" method="POST"> 
                                <tr>
                                    <td class="thumbnail-img">
                                        <input class="d-none" type="hidden" name="id" value="${food.id}" readonly=""/>
                                        <h3> ${counter.count}</h3>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">${food.name}</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>${food.price}</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" name="quantity" size="50" value="${food.quantity}" min="1" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>${food.price * food.quantity}</p>
                                    </td>
                                    <td>
                                        <input class="btn btn-success" type="submit" name="action" value="Change"/>
                                    </td>
                                    <td class="remove-pr">
                                        <button style="cursor: pointer;" type= "submit" name="action" value="Remove"><i class='fas fa-times'></i></button>
                                    </td>
                                </tr>
                                    <c:set var = "total" value="${total+(tea.price * tea.quantity)}"/>
                                    </form>
                                    </c:forEach>
                            </tbody>    
                        </table>
                        </c:if>
                            
                    </div>
                </div>
            </div>
            
            

            <c:forEach var="tea" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                <c:set var = "total" value="${total+(tea.price * tea.quantity)}"/>
            </c:forEach>
       
            <c:if test="${sessionScope.CART.cart.size() > 0}">
            <c:if test="${not empty sessionScope.CART}"></c:if>
            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Total</h4>
                            <div class="ml-auto font-weight-bold"> $${total} </div>
                        </div>
                        <div class="d-flex">
                            <h4>Discount</h4>
                            <div class="ml-auto font-weight-bold"> $0 </div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Shipping Cost</h4>
                            <div class="ml-auto font-weight-bold"> $2 </div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <div class="ml-auto h5"> $${total + 2} </div>
                        </div>
                        <hr> </div>
                </div>
                <div class="col-12 d-flex shopping-box"><a href="checkout.jsp" class="ml-auto btn hvr-hover">Checkout</a> </div>
            </div>
                        
            </c:if>
            
        </div>
    </div>
    <!-- End Cart -->

   <!-- Start Feed  -->
   <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <c:forEach items="${sessionScope.LIST}" var="o">
            <div class="item">
                <div class="ins-inner-box">
                    <a href="index.html"><img src="${o.image}" style="width: 330px; height: 330px;" alt="" /></a>
                </div>
            </div>
          
            </c:forEach>
        </div>
            
    </div>

<!-- End Feed  -->


<!-- Start Footer  -->
<footer>
        <div class="footer-main">
            <div class="container">
		<div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12 ml-auto">
			<div class="footer-top-box">
                            <h3>Business Time</h3>
                            <ul class="list-time">
				<li>Monday - Sunday: 08.00am to 10.00pm</li>
                            </ul>
			</div>
                    </div>
                                        
                    <div class="col-lg-4 col-md-12 col-sm-12 mr-auto">
			<div class="footer-top-box">
                            <h3>Contact Us</h3>
                            <ul class="list-time">
				<li><i class="fas fa-phone-square"></i> Phone number: +8411111111</li>
                                <li><i class="fas fa-envelope"></i> Email: fptu@gmail.com</li>
                                <li><i class="fas fa-map-marker-alt"></i> Address: KCN, District Q9, Ho Chi Minh City</li>
                            </ul>
			</div>
                    </div>
		</div>
            </div>
        </div>
</footer>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="MainController?action=Logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
        

<!-- ALL JS FILES -->
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="resources/js/jquery.superslides.min.js"></script>
<script src="resources/js/bootstrap-select.js"></script>
<script src="resources/js/inewsticker.js"></script>
<script src="resources/js/bootsnav.js."></script>
<script src="resources/js/images-loded.min.js"></script>
<script src="resources/js/isotope.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/baguetteBox.min.js"></script>
<script src="resources/js/form-validator.min.js"></script>
<script src="resources/js/contact-form-script.js"></script>
<script src="resources/js/custom.js"></script>
</body>

</html>