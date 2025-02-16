<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gopal.model.DAO"%>
<%
String adminName = (String) session.getAttribute("adminName");
if (adminName == null) {
	session.setAttribute("msg", "Please Login First!");
	response.sendRedirect("index.jsp");
} else {
%>

<!DOCTYPE html>
<html>

<head>
<title>Krypturg</title>
<link rel="icon" href="resources/Krypturg-logo.png" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
	integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- AOS CSS & Script -->
<script src="resources/aos/aos.js"></script>
<link rel="stylesheet" href="resources/aos/aos.css" />

<!-- custom css -->
<link rel="stylesheet" href="resources/custom.css">

<meta name="author" content="Rahul Chauhan" />
<meta name="description" content="This is a website for Computers." />
<meta name="keywords" content="" />
</head>

<body>

	<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
	%>
	<p class="bg-danger text-white p-2 text-center">
		<%=msg%>
	</p>
	<%
	session.setAttribute("msg", null);
	}
	%>


	<nav class="navbar navbar-expand-sm container my-3">
		<a href="AdminHome.jsp" class="navbar-brand"> <img
			src="resources/icon.png" height="35px" alt=""> <span>Kryp</span>turg
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#my-navbar">
			<i class="fa-solid fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="my-navbar">
			<ul class="navbar-nav mx-auto p-2">
				<li><a href="AdminHome.jsp">Orders</a></li>
				<li><a href="Enquiries.jsp">Enquiries</a></li>
				<li><a href="Products.jsp">Products</a></li>
				<li><a href="ViewProducts.jsp">View Products</a></li>
			</ul>
			<label id="call" href=""> Welcome: <b><%=adminName%></b> <a
				class="btn btn-sm btn-danger" href="Logout">Logout</a>
			</label>
		</div>
	</nav>
	
	<section class="container bg-light mt-3 p-3">
		<h2 class="text-center">All products</h2>
		<%
    DAO	db=new DAO();
    ArrayList<HashMap<String, Object>> products=(ArrayList<HashMap<String, Object>>)db.getAllProducts();
    db.closeConnection();
    for(HashMap<String, Object> product:products){
    	%>
    		<div class="bg-warning my-1 p-2 pt-4 row">
    			<div class="col-sm-3">
    				<img src="GetProductImage?name=<%=product.get("name") %>" height="100px" />
    			</div>
    			<div class="col-sm-9">
    				<p>
    				Name: <b><%= product.get("name") %></b> &nbsp; &nbsp;
    				Price: <b><%= product.get("price") %></b> &nbsp; &nbsp;
    				Company Name: <b><%= product.get("cname") %></b> &nbsp; &nbsp;
    				Category: <b><%= product.get("category") %></b> &nbsp; &nbsp;
    				Info: <b><%= product.get("info") %></b> &nbsp; &nbsp;
    				Quantity: <b><%= product.get("qty") %></b> &nbsp; &nbsp;
    			</p>
    			<a href="DeleteProduct?name=<%=product.get("name") %>" class="btn btn-sm btn-danger">Delete</a>
    			</div>
    		</div>
    	<%
    }
    %>
	</section>
	
	<label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

</body>
<script>
	AOS.init();
	//script for scroll to top
	$("#top-button").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, 1000);
	});
</script>
</html>
<%
}
%>