package com.bbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.service.UserService;
import com.bbs.service.impl.UserServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //创建一个操作用户业务类对象
    private UserService bus = new UserServiceImpl();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.getWriter().append("Served at: ").append(req.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码格式
		req.setCharacterEncoding("UTF-8");
		//获取页面上的数据
		String userId = req.getParameter("userId");
		String userPsw = req.getParameter("userpsw");
		//调用业务层的方法进行验证
		boolean isOK = bus.verification(userId, userPsw);
		//根据验证结果实现页面跳转
		if(isOK) {
			req.getRequestDispatcher("server/index.jsp").forward(req, resp);
		}else {
			resp.sendRedirect("login.html");
		}
	}

}
