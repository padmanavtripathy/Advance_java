package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginadmin
 */
@WebServlet("/Loginadmin")
public class Loginadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processrequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	{
    		DeleteOrderTable delete=new DeleteOrderTable();
            delete.deleteorders();
            Clear cl=new Clear();
			cl.clear();
    		response.setContentType("text/html");
    		PrintWriter out=response.getWriter();
    		
    		String name=request.getParameter("myname");
    		String password=request.getParameter("mypwd");
    		
    		try {
                //create the connection
    			Connection con = ConnectionProvider.getCon();
                PreparedStatement st= con.prepareStatement("SELECT Userid,Password,Email FROM sellers");
                
                ResultSet rs = st.executeQuery();
                int status=0;
                while(rs.next()){
                	System.out.println(rs.getString(1));
                	System.out.println(rs.getString(2));
                	System.out.println(rs.getString(3));
                	System.out.println(" ");
                	if((name.equals(rs.getString(1)))&&(password.equals(rs.getString(2))))
                			{
                		System.out.println("match found \n\n\n");
                		System.out.println(rs.getString(1));
                    	System.out.println(rs.getString(2));
                    	System.out.println(rs.getString(3));
                    	HttpSession session=request.getSession();  
                        session.setAttribute("Userid",name);
                				status=1;
                				break;
                			}
                }
                if(status==0)
                	out.println("error");
                else
                	out.println("done");
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    			out.println("error");
    		}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processrequest(request, response);
	}

}
