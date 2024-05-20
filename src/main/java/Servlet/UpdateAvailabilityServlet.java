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
import Controller.Routecontroller;

/**
 * Servlet implementation class UpdateAvailabilityServlet
 */
@WebServlet("/updateAvailability")
public class UpdateAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAvailabilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int routeId = Integer.parseInt(request.getParameter("id"));
		 int currentAvailability = Integer.parseInt(request.getParameter("availability"));
		  int newAvailability = (currentAvailability == 1) ? 0 : 1;

        try (Connection conn = DBconnection.getconnection()) {
            Routecontroller routeController = new Routecontroller(conn);
            boolean updated = routeController.updateAvailability(routeId, newAvailability);
            if (updated) {
                response.sendRedirect("admin/Route_list.jsp");
            } else {
              
                response.getWriter().println("Failed to update availability");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
