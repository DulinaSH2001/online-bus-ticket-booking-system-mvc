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

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		try (Connection conn = DBconnection.getconnection()) {
            Usercontroller userController = new Usercontroller(conn);
            boolean deleted = userController.deleteUser(userId);
            if (deleted) {
                response.sendRedirect("admin/Manage_users.jsp"); 
            } else {
                // Handle deletion failure
                response.getWriter().println("Failed to delete user");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}

}
