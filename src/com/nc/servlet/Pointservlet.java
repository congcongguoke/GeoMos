package com.nc.servlet;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nc.entiy.Page;
import com.nc.entiy.Point;
import com.nc.service.Pointserviceimp;
import com.nc.service.Pointsservice;

/**
 * Servlet implementation class Pointservlet
 */
public class Pointservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Pointsservice ps=new Pointserviceimp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pointservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		List<Point>pspage=ps.listPoints();
		// 查询消息列表并传给页面
		request.setAttribute("pspage",pspage );
			
		
		request.getRequestDispatcher("/jsp/point.jsp").forward(request, response);
	}

}
