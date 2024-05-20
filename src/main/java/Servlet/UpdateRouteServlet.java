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
import Model.Route;

/**
 * Servlet implementation class UpdateRouteServlet
 */
@WebServlet("/updateRoute")
public class UpdateRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int routeId = Integer.parseInt(request.getParameter("routeId"));
	        String fromLocation = request.getParameter("fromLocation");
	        String toLocation = request.getParameter("toLocation");
	        String startTime = request.getParameter("startTime");
	        String finishTime = request.getParameter("finishTime");
	        String routeNumber = request.getParameter("routeNumber");
	        String busRegNum = request.getParameter("busRegNum");
	        int availability = Integer.parseInt(request.getParameter("availability"));
	        double price = Double.parseDouble(request.getParameter("price"));
	        int seats = Integer.parseInt(request.getParameter("seats"));
	        int airConditioned = Integer.parseInt(request.getParameter("airConditioned"));

	        Route updatedRoute = new Route(routeId, fromLocation, toLocation, startTime, finishTime, routeNumber, 
	                availability, price, seats, airConditioned,busRegNum);

	        try (Connection conn = DBconnection.getconnection()) {
	            Routecontroller routeController = new Routecontroller(conn);
	            boolean updated = routeController.updateRoute(updatedRoute);
	            if (updated) {
	                response.sendRedirect("admin/Route_list.jsp");
	            } else {
	                // Handle update failure
	                response.getWriter().println("Failed to update route");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle database error
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	    
	}

}
