package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Complaintcontroller;
import Controller.DBconnection;

/**
 * Servlet implementation class ReadComplaintServlet
 */
@WebServlet("/readComplaint")
public class ReadComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int complaintId = Integer.parseInt(request.getParameter("id"));
        try (Connection conn = DBconnection.getconnection()) {
            Complaintcontroller complaintController = new Complaintcontroller(conn);
            boolean markedAsRead = complaintController.markComplaintAsRead(complaintId);
            if (markedAsRead) {
                response.sendRedirect("admin/manage_complaint.jsp");
            } else {
                // Handle marking as read failure
                response.getWriter().println("Failed to mark complaint as read");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
