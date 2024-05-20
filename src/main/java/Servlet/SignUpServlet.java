package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DBconnection;
import Controller.Usercontroller;
import Model.User;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection connection = DBconnection.getconnection();
		 Usercontroller userController = new Usercontroller(connection);
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        String phoneNumber = request.getParameter("phoneNumber");
	        String nic = request.getParameter("nic");

	        User newUser = new User(0, username, password, email, name, phoneNumber,nic);

	        try {
	            boolean success = userController.register(newUser);
	            if (success) {
	                // Registration successful, redirect to login page
	                response.sendRedirect("client/Login.jsp");
	            } else {
	                // Registration failed, redirect back to sign-up page with error message
	                request.setAttribute("errorMessage", "Failed to register user");
	                request.getRequestDispatcher("client/Signup.jsp").forward(request, response);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle database error
	            // Redirect to an error page
	            response.sendRedirect("error.jsp");
	        }
	}

}
