<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<link rel="icon"
	href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
<title>Administrarea Bibliotecilor</title>
<meta name="description"
	content="Free Bootstrap 4 Pingendo Neon template for unique 
events.">
<meta name="keywords"
	content="Pingendo conference event neon free template bootstrap 4">
<!-- CSS dependencies -->
<link rel="stylesheet" href="neon.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<!-- Script: Make my navbar transparent when the document is scrolled to top -->
<script src="js/navbar-ontop.js"></script>
<!-- Script: Animated entrance -->
<script src="js/animate-in.js"></script>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="text-center">
	<!-- Navbar -->

	<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
	<div class="container">
		<button class="navbar-toggler navbar-toggler-right collapsed"
			type="button" data-toggle="collapse"
			data-target="#navbar2SupportedContent"
			aria-controls="navbar2SupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse justify-content-center collapse"
			id="navbar2SupportedContent" style="">
			<ul class="navbar-nav">
				<li class="nav-item mx-2"><a class="nav-link" href="index.html">Home</a>
				</li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="tabela_Autori.jsp">Autori</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="tabela_Carti.jsp">Carti</a></li>
			</ul>
			<a class="btn navbar-btn mx-2 btn-outline-primary"
				href="tabela_Biblioteci.jsp"> Biblioteci</a>
		</div>
	</div>
	</nav>

	<!-- Carti -->

	<div class="py-5 section section-fade-in-out" style="background-image: 
url(&quot;assets/conference/carti.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-md-5 text-left " style="">
					<h1 class="mb-3">Modificare Carte</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="py-5" id="modificaautor" style="">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					 <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("carti", "idCarte", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Gen = rs.getString("Gen");
            String DataPublicarii = rs.getString("DataPublicarii");
            rs.close();
            jb.disconnect();
        %>
					<form id="c_form-h" class="" action="m2_Carte.jsp" method="post">
						<div class="form-group row">
						<label for="idCarte" class="col-2 
col-form-label">IdCarte
						</label>
						<div class="col-10 col-md-9 offset-md-1">
							<input type="text" class="form-control" name="idCarte" value="<%= aux%>" readonly/>
						</div>
						</div>
				<div class="form-group row">
					<label for="Nume" class="col-2 
col-form-label">Numele
						Cartii</label>
					<div class="col-10 col-md-9 offset-md-1">
						<input type="text" class="form-control" name="Nume" 
							placeholder="ex_Morometii" value="<%= Nume%>"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="Gen" class="col-2 
col-form-label">Genul</label>
					<div class="col-10 col-md-9  offset-md-1">
						<input type="text" class="form-control" name="Gen"
							placeholder="ex_Marin" value="<%= Gen%>"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="DataPublicarii" class="col-2">Data Publicarii</label>
					<div class="col-10 col-md-9 offset-md-1">
						<div class="input-group">
							<input type="text" class="form-control" name="DataPublicarii"
								placeholder="ex_1999-12-31" value="<%= DataPublicarii%>"/>
						</div>
					</div>
				</div>
				<input type="submit" class="btn btn-primary"
					value="Modifica cartea" />
				</form>
				<br /> <a href="tabela_Carti.jsp"><b>Revino la Tabela
						Carti</b></a> <br />
						</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<!-- JavaScript dependencies -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		crossorigin="anonymous"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<!-- Script: Smooth scrolling between anchors in a same page -->
	<script src="js/smooth-scroll.js"></script>
</body>

</html>