<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connection.DbCon" %>
<%@ page import="model.User" %>

<%
  User auth=(User)request.getSession().getAttribute("auth");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<%@ include file="includes/head.jsp" %>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
 <div class="container mt-5">
  <div class="row">
  <div class="col-6">
    <div class="card">
      <div class="card-header text-center">Sell your home sweet dishes on GOODIES.in </div>
      <div class="card-body">
      <form action="add-product" method="post" enctype="multipart/form-data">
       <div class="form group">
    <label>Product ID</label>
    <input type="number" class="form-control" name="pnum" placeholder="Enter Product ID..." required>
    </div>
     <div class="form group">
    <label>Name</label>
    <input type="text" class="form-control" name="pname" placeholder="Enter product name" required>
    </div>
     <div class="form group">
    <label>Category</label>
    <input type="text" class="form-control" name="pcat" placeholder="Enter category here" required>
    </div>
     <div class="form group">
    <label>Price</label>
    <input type="number" class="form-control" name="pPrice" placeholder="Enter the price of product" required>
    </div>
     <div class="form group">
    <label>Attach your item photo</label>
    <input type="file" class="form-control" name="pfile" required>
    </div>
    <div class="text-center mt-2">
    <button type="submit" class="btn btn-primary">Add-Product</button>
    </div>
      </form>
      </div>
    </div>
  </div>
   <div class="col-4">
   <img src="pic.webp" class="rounded float-end" alt="...">
   </div>
  
  </div>
 </div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>