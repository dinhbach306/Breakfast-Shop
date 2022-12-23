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
    <title>Checkout</title>
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
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->


    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Checkout</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="shopping.jsp">Home</a></li>
                        <li class="breadcrumb-item active"> Checkout</li>
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
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <form class="needs-validation" novalidate>
                            
                            <div class="mb-3">
                                <label for="username">Name *</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="username" placeholder="" required>
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="phone">Email *</label>
                                <input type="email" class="form-control" id="mail" placeholder="" required>
                                <div class="invalid-feedback"> Please enter a valid phone number for shipping updates. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">Address *</label>
                                <input type="text" class="form-control" id="address" placeholder="" required>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            
                            <hr class="mb-4">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="save-info">
                                <label class="custom-control-label" for="save-info">Save this information for next time</label>
                            </div>
                            <hr class="mb-4">
                            <div class="title"> <span>Payment Methods</span> </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="debit">Cash</label>
                                </div>
                            </div>
                            <hr class="mb-1">
                            <br> 
                        </form>
                        <button class="ml-auto btn hvr-hover" onclick="sendMail()" style="color: white;">Send Mail</button> 
                    </div>
                </div>
                
                <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>
                                
                                <c:if test="${sessionScope.CART != null}">
                                    <c:if test="${not empty sessionScope.CART}"></c:if>
                                    <c:set var = "total" value="0"/>
                                    <c:forEach var="food" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                                <div class="rounded p-2 bg-light">
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="#"> ${food.name}</a>
                                            <div class="small text-muted">Price: ${food.price} <span class="mx-2">|</span> Qty: ${food.quantity} <span class="mx-2">|</span> Subtotal: ${food.price * food.quantity}</div>
                                        </div>
                                    </div>
                                </div>
                                    </c:forEach>
                                </c:if>  
                            </div>
                        </div>
                    
                    <c:forEach var="tea" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                        <c:set var = "total" value="${total+(tea.price * tea.quantity)}"/>
                    </c:forEach>
                    
                    <c:if test="${sessionScope.CART.cart.size() > 0}">
                    <c:if test="${not empty sessionScope.CART}"></c:if>
                    
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h2><b>Your order</b></h2>
                                </div>
                                <div class="d-flex">
                                    <div class="font-weight-bold">Product</div>
                                    <div class="ml-auto font-weight-bold">Total</div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Sub Total</h4>
                                    <div class="ml-auto font-weight-bold"> $${total}</div>
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
                    </c:if>
                    <div class="col-12 d-flex shopping-box"> 
                        <a href="MainController?action=Checkout" class="ml-auto btn hvr-hover">
                        Place Order</a> 
                    </div>
                    
                    </div>
                </div>
            </div>

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
            
    <!--Log out-->        
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
<!--MailSender-->
<script type="text/javascript">
    function sendMail() {
  var params = {
    name: document.getElementById("username").value,
    mail: document.getElementById("mail").value,
    address: document.getElementById("address").value,
  };

  const serviceID = "service_i7m616n";
  const templateID = "template_i5lfuzj";

    emailjs.send(serviceID, templateID, params)
    .then(res=>{
        document.getElementById("username").value = "";
        document.getElementById("mail").value = "";
        document.getElementById("address").value = "";
        console.log(res);
        alert("Your message sent successfully!!")

    })
    .catch(err=>console.log(err));
}
</script>

<script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"
></script>

<script type="text/javascript">
    (function () {
       emailjs.init("_A3IE3jsj3dbAs_Qz");
    })();
</script>
    
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