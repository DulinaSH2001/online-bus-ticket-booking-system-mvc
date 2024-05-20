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
 * Servlet implementation class DeleteRouteServlet
 */
@WebServlet("/DeleteRoute")
public class DeleteRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int routeId = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBconnection.getconnection()) {
            Routecontroller routeController = new Routecontroller(conn);
            boolean deleted = routeController.deleteRoute(routeId);
            if (deleted) {
                response.sendRedirect("admin/Route_list.jsp"); 
            } else {
                response.getWriter().println("Failed to delete route");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
        }
    }
}
