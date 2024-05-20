package Servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DBconnection;
import Controller.Reviewcontroller;
import Model.Review;

/**
 * Servlet implementation class AddReviewServlet
 */
@WebServlet("/AddReview")
public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try(Connection conn = DBconnection.getconnection()) {
	            
	            int userId = Integer.parseInt(request.getParameter("userId"));
	            System.out.println(userId);
	            String userName = request.getParameter("userName");
	            String userEmail = request.getParameter("userEmail");
	            String reviewContent = request.getParameter("reviewContent");

	            
	            Review review = new Review(0,userId, userName, userEmail, reviewContent);

	           
	            Reviewcontroller reviewController = new Reviewcontroller(conn);
	            boolean success = reviewController.addReview(review);

	            if (success) {
	              
	                response.sendRedirect("client/Add_review.jsp"); 
	            } else {
	               
	                response.sendRedirect("review_failed.jsp"); 
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp"); 
	        }
	    }
}
