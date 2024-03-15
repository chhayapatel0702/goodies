<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connection.DbCon" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
   }
	ProductDao pd =new ProductDao(DbCon.getConnection());
	List<Product> products =pd.getAllProducts();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>main page</title>
<%@ include file="includes/head.jsp" %>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
		<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="images/<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<h6 class="price">Price: Rs.<%=p.getPrice() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

			
<%@ include file="includes/footer.jsp" %>
</body>
</html>