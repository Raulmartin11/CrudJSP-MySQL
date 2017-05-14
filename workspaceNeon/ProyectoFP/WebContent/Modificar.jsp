<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Modificar Usuario</title>
<style>
body{
	background-color: #f2f2f2;
}
.btn {
	background-color: #d9d9d9;
}
</style>
</head>
<body>
	<center>
		<h1>Modificar</h1>
	</center>

	<%
		String[] impresora = (String[]) request.getAttribute("impresora");
	%>
	<%
		String servlet = "MainServlet?action=modificado";
	%>
	<div class="container">
		<form action="<%=servlet%>" method="post">
			<div class="col-md-6">
				<div class="row">
					<div class="col-sm-12 form-group">
						<label for="Marca">Marca</label><input class="form-control"
							type="text" name="marca" placeholder="Marca"
							value="<%=impresora[0]%>" required>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12 form-group">
						<label for="Modelo">Modelo</label><input class="form-control"
							type="text" name="modelo" placeholder="Modelo"
							value="<%=impresora[1]%>" required>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-sm-12 form-group">
						<label for="tipo">Tipo</label><input class="form-control"
							type="text" name="tipo" placeholder="Tipo"
							value="<%=impresora[2]%>" required>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12 form-group">
						<label for="precio">Precio</label><input class="form-control"
							type="text" name="precio" placeholder="Precio"
							value="<%=impresora[3]%>" required>
					</div>
				</div>
			</div>
			<center>
				<form action="MainServlet?action=modificado" method="post"
					name="modificado">
					<div class="row">
						<div class="form-group">
							<input type="hidden" name="modeloantiguo"
								value="<%=impresora[1]%>">
							<button class="btn btn-default col-sm-12" type="submit"
								value="modificar">Modificar</button>
							<input type="hidden" name="action" value="modificado">
						</div>
					</div>
				</form>
			</center>
		</form>
	</div>
</body>
</html>