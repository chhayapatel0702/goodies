package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reg-user")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		PrintWriter pw=res.getWriter();
		String name=req.getParameter("text1");
		String address=req.getParameter("address");
		String email=req.getParameter("login-email");
		String password=req.getParameter("login-password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","root");
			PreparedStatement ps=con.prepareStatement("insert into user(name,address,email,password) values(?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2, address);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.executeUpdate();
		}
		catch (Exception ie) {
			System.out.println(ie);
		}
		RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
		rd.forward(req, res);
		pw.print("<h5 style='color:green'>You are successfully Registered....</h5>");
		

	}
	

}
