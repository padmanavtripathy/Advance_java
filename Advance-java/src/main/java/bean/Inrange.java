package bean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Inrange
 */
@WebServlet("/Inrange")
public class Inrange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inrange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        session.removeAttribute("Type");
        session.removeAttribute("lowest");
        session.removeAttribute("lowest");
		String Type=request.getParameter("selecttype");
		String highest=request.getParameter("highest");
		String lowest=request.getParameter("lowest");
		
//		String highest=request.getParameter("highest");
//		String lowest=request.getParameter("lowest");
//		HttpSession session=request.getSession();  
//        session.setAttribute("filteret","called");
//        String destination = "index.jsp";
        if((Type.equals("all"))&&(highest.equals("3000"))&&(lowest.equals("0")))
        {
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
	        requestDispatcher.forward(request, response);
        }
        else { 
    		session.setAttribute("Type",Type);
    		session.setAttribute("highest",highest);
    		session.setAttribute("lowest",lowest);
        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
	        requestDispatcher.forward(request, response);
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
