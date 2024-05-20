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
import Controller.Reviewcontroller;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/DeleteReview")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int reviewId = Integer.parseInt(request.getParameter("id"));
	        try (Connection conn = DBconnection.getconnection()) {
	            Reviewcontroller reviewController = new Reviewcontroller(conn);
	            boolean deleted = reviewController.deleteReview(reviewId);
	            if (deleted) {
	                response.sendRedirect("admin/Review_List.jsp"); 
	            } else {
	                response.getWriter().println("Failed to delete review");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	    }
}
