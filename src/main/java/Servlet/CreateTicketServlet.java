package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DBconnection;
import Controller.TicketController;

/**
 * Servlet implementation class CreateTicketServlet
 */
@WebServlet("/CreateTicketServlet")
public class CreateTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTicketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userId = request.getParameter("userId");
	        String routeId = request.getParameter("routeId");
	        String username = request.getParameter("username");
	        String price = request.getParameter("price");

	        TicketController ticketController = new TicketController(DBconnection.getconnection());

	        boolean success = ticketController.createTicket(userId, routeId, username, price);

	        if (success) {
	            response.sendRedirect("client/ticketCreated.jsp");
	        } else {
	            
	            response.sendRedirect("error.jsp");
	        }
	    }
	}