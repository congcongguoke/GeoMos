package com.nc.servlet;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.nc.entiy.Coordinates;
import com.nc.entiy.Page;
import com.nc.service.Coordinatesservice;
import com.nc.service.Coordinatesserviceimp;



/**
 * Servlet implementation class Coordinatesservlet
 */
public class Coordinatesservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Coordinatesservice cs = new Coordinatesserviceimp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Coordinatesservlet() {
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
		
		
		String currentPage = request.getParameter("currentPage");
		Page page=new Page();
		Pattern pattern = Pattern.compile("[0-9]{1,9}");
		if(currentPage == null ||  !pattern.matcher(currentPage).matches()) {
			page.setCurrentPage(1);
		} else {
			page.setCurrentPage(Integer.valueOf(currentPage));
		}
		List<Coordinates>cspage=cs.listCoordinates(page);
		// 查询消息列表并传给页面
		request.setAttribute("cspage",cspage );
				// 向页面传值
		request.setAttribute("page", page);
		request.getRequestDispatcher("/jsp/Coordinates.jsp").forward(request, response);
	}

}
