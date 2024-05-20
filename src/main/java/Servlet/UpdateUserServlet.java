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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User updatedUser = new User(userId, username, password, email, name, phoneNumber, nic);
        
        try (Connection conn = DBconnection.getconnection()) {
            Usercontroller userController = new Usercontroller(conn);
            boolean updated = userController.updateUser(updatedUser);
            if (updated) {
                response.sendRedirect("admin/Manage_users.jsp");
            } else {
                // Handle update failure
                response.getWriter().println("Failed to update user");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
