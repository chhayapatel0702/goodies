package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177216)
@WebServlet("/add-product")
public class AddSell extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		Part part =req.getPart("pfile");
		String filename=part.getSubmittedFileName();
		PrintWriter pw=res.getWriter();
		if(part!=null) {
		int id=Integer.parseInt(req.getParameter("pnum"));
		String pname=req.getParameter("pname");
		String category=req.getParameter("pcat");
		int price=Integer.parseInt(req.getParameter("pPrice"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","root");
			PreparedStatement ps=con.prepareStatement("insert into products(id,name,category,price,image) values(?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setString(2, pname);
			ps.setString(3, category);
			ps.setInt(4, price);
			ps.setString(5, filename);
			ps.executeUpdate();
			System.out.println("Product added");
		}
		catch (Exception ie) {
			System.out.println(ie);
		}
		RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
		rd.forward(req, res);
		pw.print("<h5 style='color:green'>You are successfully Registered....</h5>");
		

	}
	}

}
