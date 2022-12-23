<%@page import="java.util.List"%>
<%@page import="sample.foods.FoodDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Shop Detail</title>
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
    <!--comment
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'USER' && sessionScope.LOGIN_USER.roleID ne 'ADMIN'}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    -->
    

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
                        <a href="cart.jsp">
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
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <li class="cart-box">
                <ul class="cart-list">
                </ul>
            </li>
        </div>
        <!-- End Side Menu -->
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->

    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            
            <div class="row">
                
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    
                    <div class="right-product-box">
                        <div class="search-product">
                                <form action="MainController">
                                    <input class="form-control" placeholder="Search product..." type="text" name="search" value="${requestScope.param}">
                                    <button type="submit" name="action" value="SearchProduct"> <i class="fa fa-search"></i> </button>
                                </form>
                        </div> 
                        
                        <div class="product-item-filter row">
                            
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <p class="h3 text-gray-600">${requestScope.MESSAGE}</p>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            
                            <div class="tab-content">                   
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                        <c:forEach items="${sessionScope.LIST}" var="o">
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                                <div class="box-img-hover">                                       
                                                    <img src="${o.image}" class="img-fluid" style="width: 330px; height: 330px;" alt="Image">
                                                    <div class="mask-icon">
                                                        <ul>
                                                            <li><a href="product-detail.html" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                        </ul>
                                                        <a class="cart" href="MainController?action=Add&cmbFood=${o.id}-${o.name}-${o.price}">Add to Cart</a>
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4>${o.name}</h4>
                                                    <h5>$${o.price}</h5>
                                                </div>
                                            </div>
                                        </div>   
                                        </c:forEach>
                                    </div>
                                </div>


                                <div role="tabpanel" class="tab-pane fade" id="list-view">
                                    <div class="list-view-box">
                                        <div class="row">
                                            <c:forEach items="${sessionScope.LIST}" var="o">
                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <img src="${o.image}" class="img-fluid" style="width: 330px; height: 330px;" alt="Image">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                <div class="why-text full-width">
                                                    <h4>${o.name}</h4>
                                                    <h5>${o.price}</h5>
                                                    <p>${o.description}</p>
                                                    <a class="btn hvr-hover" href="#">Add to Cart</a>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                        </div>
                    </div>
                                                    
                </div>
                
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                             
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->

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