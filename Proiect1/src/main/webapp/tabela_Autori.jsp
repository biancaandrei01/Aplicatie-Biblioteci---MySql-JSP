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
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>Administrarea Bibliotecilor</title>
  <meta name="description" content="Free Bootstrap 4 Pingendo Neon template for unique 
events.">
  <meta name="keywords" content="Pingendo conference event neon free template bootstrap 4">
  <!-- CSS dependencies -->
  <link rel="stylesheet" href="neon.css">
  <link rel="stylesheet" href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type=
"text/css">
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
      <button class="navbar-toggler navbar-toggler-right collapsed" type="button" data-toggle=
"collapse" data-target="#navbar2SupportedContent" aria-controls=
"navbar2SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span 
class="navbar-toggler-icon"></span> </button>
      <div class="navbar-collapse justify-content-center collapse" id=
"navbar2SupportedContent" style="">
        <ul class="navbar-nav">
          <li class="nav-item mx-2">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="tabela_Autori.jsp">Autori</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="tabela_Carti.jsp">Carti</a>
          </li>
        </ul>
        <a class="btn navbar-btn mx-2 btn-outline-primary" href="tabela_Biblioteci.jsp">
Biblioteci</a>
      </div>
    </div>
  </nav>

 <!-- Autori -->
  <div class="py-5 section section-fade-in-out" style="background-image: 
url(&quot;assets/conference/autori.jpg&quot;);">
    <div class="container">
      <div class="row">
        <div class="col-md-5 text-left " style="">
          <h1 class="mb-3">Tabela Autorilor</h1>
        </div>
        </div>
  </div>
  </div>
  <div class="py-5" id="modificaautor" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="table-responsive">
		   <form action="sterge_Autor.jsp" method="post">
            <table class="table table-striped table-borderless">
              <thead>
                <tr>
                  <th scope="col">Mark:</th>
                  <th scope="col">IdAutor:</th>
                  <th scope="col">Nume:</th>
				  <th scope="col">Prenume:</th>
				  <th scope="col">Data Nasterii:</th>
                </tr>
              </thead>
			  <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("autori");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idAutor");
                %>
              <tbody>
                <tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("Nume")%></td>
				<td><%= rs.getString("Prenume")%></td>
				<td><%= rs.getDate("DataNasterii")%></td>
				<%
                        }
                    %>
			</tr>
              </tbody>
            </table>
          </div>
          <input href="sterge_Autor" type="submit" class="btn btn-lg btn-dark shadowed" value="Sterge liniile selectate">
          <a class="btn btn-lg btn-dark shadowed" href="nou_Autor.jsp">Adauga Autor</a>
          <a class="btn btn-lg btn-dark shadowed" href="modifica_Autor.jsp">Modifica Autor</a>
        </div>
		</p>
 </form> 
 <%
            rs.close();
            jb.disconnect();
        %>
		</div>
    </div>
  </div>
  
   <!-- Footer -->
  <!-- JavaScript dependencies -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
crossorigin="anonymous" integrity=
"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" 
crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in a same page -->
  <script src="js/smooth-scroll.js"></script>
</body>

</html>