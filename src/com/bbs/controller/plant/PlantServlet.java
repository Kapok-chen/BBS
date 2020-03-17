package com.bbs.controller.plant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.print.PrintService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.entity.bbs_plate;
import com.bbs.service.plant.bbs_plateService;
import com.bbs.service.plant.impl.bbs_plateServiceImpl;

/**
 * Servlet implementation class PlantServlet
 */
@WebServlet("/PlantServlet")
public class PlantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 创建一个业务层的对象
	private bbs_plateService ps = new bbs_plateServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得客户端传递的参数值
		request.setCharacterEncoding("UTF-8");
		String op = request.getParameter("op");
		if("add".equals(op)) {
			// 调用增加模块的方法
			savePlant(request,response);
		}else if("show".equals(op)) {
			findAll(request,response);
		}else if("delById".equals(op)) {
			
		}else if("delAll".equals(op)) {
			delAll(request,response);
		}else if("update".equals(op)) {
			
		}else if("findById".equals(op)) {
			
		}
	}

	private void delAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获得客户端传递的数据
		String ids = request.getParameter("ids");
		System.out.println(ids);
		boolean isOk = ps.delAll(ids);
		PrintWriter pw = response.getWriter();
		if(isOk) {
			pw.write("{\"result\":\"true\"}");
		}else {
			pw.write("{\"result\":\"false\"}");
		}
		pw.flush();
	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<bbs_plate> list = ps.getPlateList();
		HttpSession session = request.getSession();
		if(session.getAttribute("list") != null) {
			session.removeAttribute("list");
		}
		session.setAttribute("list", list);
		response.sendRedirect("server/plant-list.jsp");
	}

	private void savePlant(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 设置响应的文件类型
		response.setContentType("application/json;charset=UTF-8");
		// 获得表单的提交数据
		String plantTitle = request.getParameter("plateTitle");
		String plantMessage = request.getParameter("plateMessage");
		
		System.out.println(plantTitle+","+plantMessage);
		// 创建需要保存的实体类
		bbs_plate plant = new bbs_plate(plantTitle, plantMessage);
		boolean isOk = ps.savePlant(plant);
		PrintWriter pw = response.getWriter();
		if(isOk) {
			pw.write("{\"result\":\"true\"}");
		}else {
			pw.write("{\"result\":\"false\"}");
		}
		pw.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
