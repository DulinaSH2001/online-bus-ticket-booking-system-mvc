package Servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DBconnection;
import Controller.Routecontroller;
import Model.Route;

/**
 * Servlet implementation class CreateRouteServlet
 */
@WebServlet("/CreateRouteServlet")
public class CreateRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateRouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBconnection.getconnection();
		String fromLocation = request.getParameter("fromLocation");
        String toLocation = request.getParameter("toLocation");
        String startTime = request.getParameter("startTime");
        String finishTime = request.getParameter("finishTime");
        String routeNumber = request.getParameter("routeNumber");
        String bus_reg_num=request.getParameter("busRegNumber");
        int availability = Integer.parseInt(request.getParameter("availability"));
        double price = Double.parseDouble(request.getParameter("price"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        int airConditioned = Integer.parseInt(request.getParameter("airConditioned"));

        // Create Route object
        Route route = new Route(0, fromLocation, toLocation, startTime, finishTime, routeNumber, availability, price, seats, airConditioned,bus_reg_num);

        // Call a method in your controller to save the route to the database
        Routecontroller routeController = new Routecontroller(conn);
        boolean success = routeController.createRoute(route);

        if (success) {
            response.sendRedirect("admin/Route_list.jsp"); // Redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }

}
