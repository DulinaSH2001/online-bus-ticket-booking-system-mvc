package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DBconnection;
import Controller.Routecontroller;
import Model.Route;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBconnection.getconnection(); 
		String fromLocation = request.getParameter("fromLocation");
        String toLocation = request.getParameter("toLocation");

        // Call controller to get search results
        Routecontroller controller = new Routecontroller(conn);
        List<Route> searchResults = controller.searchRoutes(fromLocation, toLocation);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("<title>BusTicket - Online Bus Ticket Booking</title>");
        out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">");
        // Include your CSS and JavaScript files here
        out.println("</head>");
        out.println("<body>");

        // Include your navigation bar and header here

        out.println("<div class=\"container\">");
        out.println("<h2>Search Results</h2>");

        if (searchResults.isEmpty()) {
            out.println("<p>No results found.</p>");
        } else {
            out.println("<table class=\"table\">");
            out.println("<thead>");
            // Include table header here
            out.println("</thead>");
            out.println("<tbody>");
            for (Route route : searchResults) {
                // Include table rows here
            }
            out.println("</tbody>");
            out.println("</table>");
        }

        out.println("</div>");

        // Include your footer here

        out.println("</body>");
        out.println("</html>");

        out.close();
    
        

        // Forward the results to a JSP page for display
        //request.setAttribute("searchResults", searchResults);
          //      RequestDispatcher dispatcher = request.getRequestDispatcher("client/searchResults.jsp");
        //dispatcher.forward(request, response);
        //response.sendRedirect("client/searchResults.jsp");

    }

}
