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
					<h1 class="mb-3">Modificare Biblioteca</h1>
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
            String NumeAutor, Prenume, DataNasterii, NumeCarte, Gen, DataPublicarii, NumeBibl, Adresa;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceBibliotecaId(aux);
            rs.first();
            int id1 = rs.getInt("idAutor_bibl");
            int id2 = rs.getInt("idCarte_bibl");

            NumeAutor = rs.getString("NumeAutor");
            Prenume = rs.getString("Prenume");
            DataNasterii = rs.getString("DataNasterii");
            NumeCarte = rs.getString("NumeCarte");
            Gen = rs.getString("Gen");
            DataPublicarii = rs.getString("DataPublicarii");
            NumeBibl = rs.getString("NumeBibl");
            Adresa = rs.getString("Adresa");

            ResultSet rs1 = jb.vedeTabela("autori");
            ResultSet rs2 = jb.vedeTabela("carti");
            int idAutor, idCarte;


        %>
					<form id="c_form-h" class="" action="m2_Biblioteca.jsp"
						method="post">
						<div class="form-group row">
							<label for="idBiblioteca" class="col-2 
col-form-label">IdBiblioteca
							</label>
							<div class="col-10 col-md-9 offset-md-1">
								<input type="text" class="form-control" name="idBiblioteca"
									value="<%= aux%>" readonly />
							</div>
						</div>
						<div class="form-group row">
							<label for="idAutor" class="col-2 
col-form-label">IdAutor</label>
							<div class="col-10 col-md-9 offset-md-1">
							<div class="input-group">
								<SELECT NAME="idAutor">
									<%
                                while (rs1.next()) {
                                	idAutor = rs1.getInt("idAutor");
                                    NumeAutor = rs1.getString("Nume");
                                    Prenume = rs1.getString("Prenume");
                                    DataNasterii = rs1.getString("DataNasterii");
                                    if (idAutor != id1) {
                            %>
									<OPTION VALUE="<%= idAutor%>"><%= idAutor%>,
										<%= NumeAutor%>,
										<%= Prenume%>,
										<%= DataNasterii%></OPTION>
									<%
                                        } else {
                                %>
									<OPTION selected="yes" VALUE="<%= idAutor%>"><%= idAutor%>,
										<%= NumeAutor%>,
										<%= Prenume%>,
										<%= DataNasterii%></OPTION>
									<%
                                        }
                                    }
                                %>
								</SELECT>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="idCarte" class="col-2 
col-form-label">IdCarte</label>
							<div class="col-10 col-md-9  offset-md-1">
							<div class="input-group">
								<SELECT NAME="idCarte">
									<%
                                while (rs2.next()) {
                                	idCarte = rs2.getInt("idCarte");
                                    NumeCarte = rs2.getString("Nume");
                                    Gen = rs2.getString("Gen");
                                    DataPublicarii = rs2.getString("DataPublicarii");
                            if (idCarte != id2) {
                            %>
									<OPTION VALUE="<%= idCarte%>"><%= idCarte%>,
										<%= NumeCarte%>,
										<%= Gen%>,
										<%= DataPublicarii%></OPTION>
									<%
                                        } else {
                                %>
									<OPTION selected="yes" VALUE="<%= idCarte%>"><%= idCarte%>,
										<%= NumeCarte%>,
										<%= Gen%>,
										<%= DataPublicarii%></OPTION>
									<%
                                        }
                                    }
                                %>
								</SELECT>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="NumeBibl" class="col-2">Numele Bibliotecii</label>
							<div class="col-10 col-md-9 offset-md-1">
								<div class="input-group">
									<input type="text" class="form-control" name="NumeBibl"
										placeholder="ex_Panait Istrati" value="<%= NumeBibl%>" />
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="Adresa" class="col-2">Adresa Bibliotecii</label>
							<div class="col-10 col-md-9 offset-md-1">
								<div class="input-group">
									<input type="text" class="form-control" name="Adresa"
										placeholder="ex_Braila" value="<%= Adresa%>" />
								</div>
							</div>
						</div>
						<input type="submit" class="btn btn-primary"
							value="Modifica biblioteca" />
					</form>
					<br /> <a href="tabela_Biblioteci.jsp"><b>Revino la Tabela
							Biblioteci</b></a> <br />
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