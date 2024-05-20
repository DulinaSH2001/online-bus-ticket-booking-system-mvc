package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DBconnection;
import Controller.Usercontroller;
import Model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Usercontroller userController;

	public void init() throws ServletException {
		
		Connection connection = DBconnection.getconnection();
		userController = new Usercontroller(connection);
	}

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		try {
			User user = userController.login(username, password);
			
			if (user != null) {
				session.setAttribute("userObj", user);
				response.sendRedirect("client/Index.jsp");
			} else {
				boolean isAdmin = userController.checkAdminCredentials(username, password);
				if (isAdmin) {

					response.sendRedirect("admin/AdminDashboard.jsp");
				} else {

					response.sendRedirect("client/Login.jsp");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace(); // Handle database error
			// Redirect to an error page
			response.sendRedirect("error.jsp");
		}

	}

}
