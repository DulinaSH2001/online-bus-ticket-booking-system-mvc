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

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Usercontroller userController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  Connection connection = DBconnection.getconnection();
	        userController = new Usercontroller(connection);
		
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("userObj");

        // Retrieve updated user details from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Update the user object with the new details
        currentUser.setName(name);
        currentUser.setEmail(email);
        currentUser.setPhoneNumber(phoneNumber);
        currentUser.setNic(nic);
        currentUser.setUsername(username);
        currentUser.setPassword(password);

        try {
            // Update user details in the database
            boolean updated = userController.updateUser(currentUser);
            if (updated) {
                // Update session with the updated user object
                session.setAttribute("userObj", currentUser);
                // Redirect to a success page
                response.sendRedirect("client/User_profile.jsp");
            } else {
                // Redirect to an error page if update failed
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database error
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
