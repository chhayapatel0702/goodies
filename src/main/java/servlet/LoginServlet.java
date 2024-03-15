package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import connection.DbCon;
import dao.UserDao;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      res.setContentType("text/html");
      try(PrintWriter pw =res.getWriter()){
    	  String email=req.getParameter("login-email");
    	  String password=req.getParameter("login-password");
    	try {

			UserDao udao = new UserDao(DbCon.getConnection());
			User user =udao.userLogin(email, password);

			if(user!=null) {
				req.getSession().setAttribute("auth", user);
				res.sendRedirect("index.jsp");
			}
			else {
				pw.print("user login failed");
			}
      }
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
      }
	}
		  
  }


