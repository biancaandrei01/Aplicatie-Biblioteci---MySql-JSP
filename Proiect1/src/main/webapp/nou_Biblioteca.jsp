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

	<!-- Biblioteci -->

	<div class="py-5 section section-fade-in-out" style="background-image: 
url(&quot;assets/conference/biblioteci.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-md-5 text-left " style="">
					<h1 class="mb-3">Adaugare Biblioteca</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="py-5" id="modificaautor" style="">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<%
            int idAutor, idCarte;
            String id1, id2, NumeAutor, Prenume, DataNasterii, NumeCarte, Gen, DataPublicarii, NumeBibl, Adresa;
            id1 = request.getParameter("idAutor");
            id2 = request.getParameter("idCarte");
            NumeBibl = request.getParameter("Nume");
            Adresa = request.getParameter("Adresa");
            if (id1 != null) {
                jb.connect();
                jb.adaugaBiblioteca(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), NumeBibl, Adresa);
                jb.disconnect();
        %>
					<h1>Datele au fost adaugate.</h1>
					<%
            } else {
                jb.connect();
                ResultSet rs1 = jb.vedeTabela("autori");
                ResultSet rs2 = jb.vedeTabela("carti");
                %>
					<form id="c_form-h" class="" action="nou_Biblioteca.jsp"
						method="post">
						<div class="form-group row">
							<label for="idAutor" class="col-2 
col-form-label">Id
								Autor</label>
							<div class="col-10 col-md-9 offset-md-1">
							<div class="input-group">
								<SELECT NAME="idAutor">
									<%
                                    while(rs1.next()){
                                        idAutor = rs1.getInt("idAutor");
                                        NumeAutor = rs1.getString("Nume");
                                        Prenume = rs1.getString("Prenume");
                                        DataNasterii = rs1.getString("DataNasterii");
                                %>
									<OPTION VALUE="<%= idAutor%>"><%= idAutor%>,<%= NumeAutor%>,<%= Prenume%>,<%= DataNasterii%></OPTION>
									<%
                                    }
                                %>
								</SELECT>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="idCarte" class="col-2 
col-form-label">Id
								Carte</label>
							<div class="col-10 col-md-9  offset-md-1">
							<div class="input-group">
								<SELECT NAME="idCarte">
									<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
									<%
                                    while(rs2.next()){
                                    	idCarte = rs2.getInt("idCarte");
                                        NumeCarte = rs2.getString("Nume");
                                        Gen = rs2.getString("Gen");
                                        DataPublicarii = rs2.getString("DataPublicarii");
                                %>
									<OPTION VALUE="<%= idCarte%>"><%= idCarte%>,<%= NumeCarte%>,<%= Gen%>,<%= DataPublicarii%></OPTION>
									<%
                                    }
                                %>
								</SELECT>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="NumeBibl" class="col-2">Numele bibliotecii</label>
							<div class="col-10 col-md-9 offset-md-1">
								<div class="input-group">
									<input type="text" class="form-control" name="NumeBibl"
										placeholder="ex_Panait Istrati">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="Adresa" class="col-2">Adresa bibliotecii</label>
							<div class="col-10 col-md-9 offset-md-1">
								<div class="input-group">
									<input type="text" class="form-control" name="Adresa"
										placeholder="ex_Braila">
								</div>
							</div>
						</div>
						<input type="submit" class="btn btn-primary"
							value="Adauga biblioteca" />
					</form>
					<%
            }
        %>
					<br /> <a href="tabela_Biblioteci.jsp"><b>Revino la Tabela
							Biblioteci</b></a> <br />
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