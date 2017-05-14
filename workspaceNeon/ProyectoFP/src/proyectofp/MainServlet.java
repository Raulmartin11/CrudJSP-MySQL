package proyectofp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public MainServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Context ctx;
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs;
		String nextJSP = "";
		String impresoras[][] = new String[50][4];
		String impresora[] = new String[4];
		int i = 0;
		String query = "";
		String action = request.getParameter("action");

		switch (action) {
		case "main":

			query = "SELECT * FROM IMPRESORAS";

			try {

				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProyectoFP");
				connection = ds.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery(query);

				while (rs.next()) {
					String modelo = rs.getString("MODELO");
					String precio = rs.getString("PRECIO");
					String tipo = rs.getString("TIPO");
					String marca = rs.getString("MARCA");

					impresoras[i][0] = marca;
					impresoras[i][1] = modelo;
					impresoras[i][2] = tipo;
					impresoras[i][3] = precio;
					i++;
				}
				String impresorasAUX[][] = new String[i][4];
				for (int j = 0; j < impresorasAUX.length; j++) {
					for (int a = 0; a < 4; a++) {
						impresorasAUX[j][a] = impresoras[j][a];
					}
				}
				request.setAttribute("impresorasAUX", impresorasAUX);

				nextJSP = "/index.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request, response);
				
			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			break;

		case "modificar":

			query = "SELECT * FROM IMPRESORAS WHERE MODELO LIKE '" + request.getParameter("modelo") + "'";
			try {

				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProyectoFP");
				connection = ds.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery(query);

				while (rs.next()) {
					String marca = rs.getString("MARCA");
					String modelo = rs.getString("MODELO");
					String tipo = rs.getString("TIPO");
					String precio = rs.getString("PRECIO");

					impresora[0] = marca;
					impresora[1] = modelo;
					impresora[2] = tipo;
					impresora[3] = precio;
					i++;
				}
				request.setAttribute("impresora", impresora);

				nextJSP = "/Modificar.jsp";

				RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher1.forward(request, response);
				break;
			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			break;
		}
	}
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Context ctx;
		Connection connection = null;
		Statement stmt = null;
		String action = request.getParameter("action");
		String nextJSP = "";
		String query = "";

		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProyectoFP");
			connection = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

		switch (action) {

		case "eliminar":
			try {
				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProyectoFP");
				connection = ds.getConnection();

				query = "DELETE from Impresoras WHERE MODELO ='" + request.getParameter("modelo") + "'";
				stmt = connection.createStatement();
				int insert = stmt.executeUpdate(query);

			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");

						connection.close();
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			break;
		case "addnuevo":
			query = "INSERT INTO IMPRESORAS (MARCA, MODELO, TIPO, PRECIO) VALUES ('" + request.getParameter("marca")
					+ "', '" + request.getParameter("modelo") + "', '" + request.getParameter("tipo") + "', '"
					+ request.getParameter("precio") + "')";

			try {
				stmt = connection.createStatement();
				int rs = stmt.executeUpdate(query);
				response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");
			} catch (SQLException e) {
				e.printStackTrace();
			}

			break;
		case "modificado":
			query = "UPDATE Impresoras SET Marca='" + request.getParameter("marca") +"', Modelo='"+ request.getParameter("modelo") 
					+  "', Tipo='" + request.getParameter("tipo") + "', Precio='" + request.getParameter("precio")
					+ "' WHERE Modelo='" + request.getParameter("modeloantiguo") + "'";

			try {
				stmt = connection.createStatement();
				int rs = stmt.executeUpdate(query);
				response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");
			} catch (SQLException e) {
				e.printStackTrace();
			}

			break;
		}
	}
}