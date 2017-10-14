package com.nc.servlet;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nc.util.StringUtils;
import com.nc.entiy.Page;
import com.nc.entiy.Point;
import com.nc.entiy.TPSMeasurements;
import com.nc.service.Pointserviceimp;
import com.nc.service.Pointsservice;
import com.nc.service.TPSMeasurementsservice;
import com.nc.service.TPSMeasurementsseviceimp;

/**
 * Servlet implementation class TPSMeasurements
 */
public class TPSMeasurementsservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private TPSMeasurementsservice tp=new TPSMeasurementsseviceimp();
       private Pointsservice ps=new Pointserviceimp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TPSMeasurementsservlet() {
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
		
		int id=0;
    String pointid=request.getParameter("pointid");
    if(StringUtils.hasLength(pointid)) {
    	id=Integer.valueOf(pointid);
		
	}
		String currentPage = request.getParameter("currentPage");
		Page page=new Page();
		Pattern pattern = Pattern.compile("[0-9]{1,9}");
		if(currentPage == null ||  !pattern.matcher(currentPage).matches()) {
			page.setCurrentPage(1);
		} else {
			page.setCurrentPage(Integer.valueOf(currentPage));
		}
		List<TPSMeasurements> tppage=tp.listTPSMeasurements(id,page);
		// 查询消息列表并传给页面
		request.setAttribute("tppage",tppage );
				// 向页面传值
		request.setAttribute("page", page);
		request.getRequestDispatcher("/jsp/TPSMeasurements.jsp").forward(request, response);
	}

}
