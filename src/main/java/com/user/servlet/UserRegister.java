package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entity.User;
import com.DB.DVConnect;

//com.user.servlet takes the data from the html page and sends it to user.java where it is stored in the database 
@WebServlet("/user_register") //in signup.jsp we have mentioned the form action as user_register to execute this code
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname=req.getParameter("fullname");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			User u =new User(fullname,email,password);
			
			UserDao dao=new UserDao(DVConnect.getConn());
			
			HttpSession session=req.getSession();
			
			boolean f=dao.register(u);
			
			if(f) {
				session.setAttribute("sucMsg", "Register Sucesssfully");
				resp.sendRedirect("signup.jsp");
				System.out.println("register sucessful");
			}else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("signup.jsp");
				System.out.println("something wrong on server");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}

}
}