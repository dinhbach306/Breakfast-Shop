<%@page import="java.util.List"%>
<%@page import="sample.foods.FoodDTO"%>
<%@page import="sample.foods.FoodDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Search page</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet"/>
</head>

<body id="page-top">
    <!--comment
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'ADMIN'}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    -->
    
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-hamburger"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Management food<sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="search.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Manager</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Choose Manager</h6>
                        
                        <c:if test = "${sessionScope.LOGIN_USER.roleID ne 'USER'}">
                        
                        <a class="collapse-item" href="MainController?action=Search">  
                                    Management foods
                        </a>
                        </c:if>    

                        <a class="collapse-item" href="shopping.jsp">Shopping</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form action="MainController"
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" name="search" value="${requestScope.param}" class="form-control bg-light border-0 small" 
                                   placeholder="Search for...">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit" name="action" value="Search">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <c:if test = "${sessionScope.LOGIN_USER != null}">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.LOGIN_USER.fullName}</span>
                                </c:if>
                                <img class="img-profile rounded-circle"
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

                </nav>
                <!-- End of Topbar -->

                <c:if test="${requestScope.LIST_FOOD != null}">
                    <c:if test="${not empty requestScope.LIST_FOOD}"></c:if>       
                <!-- Begin Page Content -->
                <div class="container-fluid">

                <!-- Page Heading -->
                <div class="col-lg-8 mb-4">
                    <table border="1" class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Cooking Time</th>
                                <th>Status</th>
                                <th>Delete</th>
                                <th>Update</th>

                            </tr>
                        </thead>
                    <tbody>
                        <c:forEach var="food" varStatus="counter" items="${requestScope.LIST_FOOD}">
                    <form action="MainController" method="POST">
                        
                        <tr>
                            <td>${counter.count}</td>
                            <td>
                                <input type="text" style="width: 150px;" name="id" value="${food.id}" readonly=""/>
                            </td>
                            <td>
                                <input type="text" style="width: 150px;" name="name" value="${food.name}" required=""/>
                            </td>
                            <td>
                                <input type="text" name="description" value="${food.description}" required=""/>
                            </td>
                            <td>
                                <input type="number" style="width: 150px;" name="price" value="${food.price}" required="" min="1"/>
                            </td>
                            <td>
                                <input type="number" style="width: 150px;" name="cookingTime" value="${food.cookingTime}" required=""/>
                            </td>
                            <td class="text-uppercase text-gray-600 font-weight-bold">${food.status}</td>
                            <!--delete here-->
                            <td>
                                <c:url var="delete" value="MainController">
                                    <c:param name="action" value="Delete"></c:param>
                                    <c:param name="id" value="${food.id}"></c:param>
                                    <c:param name="search" value="${requestScope.param}"></c:param>
                                </c:url>
                                <a class="btn btn-danger" href="${delete}">Delete</a>
                            </td>
<!--                            <td>
                                <input class="btn btn-danger" type="submit" name="action" value="Delete"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>-->
                            <!--update here-->
                            <td>
                                <input class="btn btn-success" type="submit" name="action" value="Update"/>
                                <input type="hidden" name="id" value="${food.id}"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>
                        </tr>
                        
                    </form>
                        </c:forEach>
                    </tbody>
                </table>
                </div>   
                </div>
                </c:if> 
                <!-- /.container-fluid -->
                    <h1 class="text-center">Welcome to website</h1>
                    <h2 class="text-center">Of roleID: SE150702</h2>
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; By Bach Dinh 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
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

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
    <script src="resources/js/demo/chart-pie-demo.js"></script>
</body>

</html>