package Servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Complaintcontroller;
import Controller.DBconnection;
import Model.Complaint;

/**
 * Servlet implementation class SubmitComplaint
 */
@WebServlet("/SubmitComplaint")
public class SubmitComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitComplaint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String fullName = request.getParameter("fullName");
	        String email = request.getParameter("email");
	        String complaintText = request.getParameter("complaint");
	        String c_status =request.getParameter("c_status");

	        Complaint complaint = new Complaint(fullName, email, complaintText,c_status);

	        try (Connection conn = DBconnection.getconnection()) {
	            Complaintcontroller complaintController = new Complaintcontroller(conn);
	            boolean success = complaintController.submitComplaint(complaint.getFullName(), complaint.getEmail(),
	                    complaint.getComplaint(),complaint.getC_status());

	            if (success) {
	                response.sendRedirect("client/contactSuccsess.jsp"); // Redirect to a success page
	            } else {
	                // Handle submission failure
	                response.getWriter().println("Failed to submit complaint");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle database error
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	    
		// TODO Auto-generated method stub
	}

}
