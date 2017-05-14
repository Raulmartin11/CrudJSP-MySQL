<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #d9d9d9;
	background-attachment: fixed;
	background-position: medium bottom;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}


.button {
	padding: 10px 20px;
	background-color: #333;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}
</style>
<title>Menu Principal</title>
</head>
<body>
	<%
		String[][] impresoras = (String[][]) request.getAttribute("impresorasAUX");
	%>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Marca</th>
					<th>Modelo</th>
					<th>Tipo</th>
					<th>Precio</th>
				<tr>
			</thead>
			<tbody>
				<%
					int i = 0;
					String modelo = impresoras[i][1];
					for (i = 0; i < impresoras.length; i++) {

						out.print("<tr><td>" + impresoras[i][0] + "</td><td>" + impresoras[i][1] + "</td><td>"
								+ impresoras[i][2] + "</td><td>" + impresoras[i][3] + "</td><td>"
								+ "<form action=\"MainServlet?action=eliminar\" method=\"post\" name=\"eliminar\"><button class=\"btn-danger btn\""
								+ " type=\"submit\" value=\"eliminar\">Eliminar<input type=\"hidden\" name=\"action\" value=\"eliminar\"><input type=\"hidden\" name=\"modelo\" value=\""
								+ impresoras[i][1] + "\"></button></form></td>"

								+ "<td><form action=\"MainServlet?action=modificar\" method=\"get\" name=\"modificar\"><button class=\"btn-primary btn\""
								+ " type=\"submit\" value=\"Modificar\">Modificar<input type=\"hidden\" name=\"action\" value=\"modificar\"><input type=\"hidden\" name=\"modelo\" value=\""
								+ impresoras[i][1] + "\"></button></form></td>");
					}
				%>
			</tbody>
		</table>
		<center>
			<button class="btn btn-success col-sm-12 "; data-toggle="modal"
				data-target="#myModal">Añadir</button>
		</center>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4>
							<center>
								<span class="glyphicon glyphicon-lock"></span>Añadir Impresora
						</h4>
						</center>
					</div>
					<%
						String servlet = "MainServlet?action=addnuevo";
					%>
					<div class="modal-body">
						<form role="form" action="<%=servlet%>" method="post"
							name="addnuevo">
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-shopping-cart"></span>Marca</label> <input
									type="text" class="form-control" name="marca"
									placeholder="Marca" value="" required>
							</div>
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span>Modelo</label> <input
									type="text" class="form-control" name="modelo"
									placeholder="Modelo" value="" required>
							</div>
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span>Tipo</label> <input type="text"
									class="form-control" name="tipo" placeholder="Tipo" value=""
									required>
							</div>
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-shopping-cart"></span>Precio</label> <input
									type="float" class="form-control" name="precio"
									placeholder="Precio" value="" required>
							</div>
							<button type="submit" class="btn btn-success btn-block">
								Añadir <span class="glyphicon glyphicon-ok"></span><input
									type="hidden" name="action" value="addnuevo">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>