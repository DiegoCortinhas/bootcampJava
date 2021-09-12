<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
</head>

<body class="d-flex flex-column h-100" >
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="/livrariaAlura" style="margin-left: 0.4rem">Livraria Alura</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse" style="margin-left: 0.5rem" >
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="/livraria/home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/livraria/Java">Java</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="/livraria/JSP">JSP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/livraria/Servlet">Servlet</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/livraria/Spring">Spring</a>
            </li>
          </ul>
         </div> 
         <form class="form-inline mt-2 mt-md-0" style="width: 300px; margin-right: 0.5rem"> 
           <input class="form-control mr-sm-2" type="text" placeholder="Pesquisar Livro" aria-label="Search" >
        </form>
        <div>
        	<button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="width: 100px; margin-right: 2rem">Pesquisa</button>
        </div>
      	</nav>
	</header>
	
	<main role="main" class="flex-shrink-0" >
	  
      <div class="container" style="margin-top: 4rem">
      	
      	<h1 class="text-center">Cadastro de Autor</h1>
		<form action="<c:url value="/cadastros"/>" method="POST">
			
			<div class="form-group">
				 <label for="nome">Nome</label>
				 <input id="nome" class = "form-control" name="nome">
			</div>
			
			<div class="form-group">
				 <label for="email">Email</label>
				 <input id="email" class = "form-control" name="email">
			</div>
			
			<div class="form-group">
				 <label for="data">Data</label>
				 <input id="data" class = "form-control" name="data">
			</div>
			
			<div class="form-group">
				 <label for="miniCV">MiniCV</label>
				 <input id="miniCV" class = "form-control" name="miniCV">
			</div>
			<input type="submit" value="Gravar" class="mt-2 btn-primary">
		</form>
	
		<h1 class="text-center">Lista de Autores</h1>
		
		<table class="table table-hover table-striped table-bordered">
			<thead>
				<tr>
					<th>NOME</th>
					<th>EMAIL</th>
					<th>DATA</th>
					<th>MiniCV</th>
					
				</tr>
			</thead>	
		<tbody>
			<!-- referenciar variaveis da lista transacoes -->
			<c:forEach items="${cadastros}" var="c">
				<tr>
					<td>${c.nome}</td>
					<td>${c.email}</td>
					<td>
						<fmt:parseDate value="${c.data}" pattern="yyyy-MM-dd" var="formatada" type="date" />
						<fmt:formatDate value="${formatada}" pattern="dd/MM/yyyy" type="date"/>
						
					</td>
					<td>${c.miniCV}</td>
				</tr>
			</c:forEach>
			
		</tbody>
		</table>
	
	</div>
	</main>
	
	
	<img src="https://pa1.narvii.com/7997/c88885011192ca1a42f8ff42c5b3f262b415c80cr1-480-210_hq.gif" class="img-fluid" style="margin-top: 2rem" alt="Hermione e Harry na Biblioteca">	
	
	
	
	<footer class="footer mt-auto py-3">
      <div class="container">
        <span class="text-muted">Desenvolvido no Módulo 01 - Bootcamp Java Alura 2021</span>
      </div>
    </footer>

    <!-- Principal JavaScript do Bootstrap
    ================================================== -->
    <!-- Foi colocado no final para a página carregar mais rápido -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
	
	
</body> 
</html>