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
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/updateReview")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        String reviewContent = request.getParameter("reviewContent");

        try (Connection conn = DBconnection.getconnection()) {
            Reviewcontroller reviewController = new Reviewcontroller(conn);
            boolean updated = reviewController.updateReview(reviewId, reviewContent);
            if (updated) {
                response.sendRedirect("admin/Review_List.jsp");
            } else {
                // Handle update failure
                response.getWriter().println("Failed to update review");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
