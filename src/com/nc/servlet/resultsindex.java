package com.nc.servlet;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nc.entiy.Page;
import com.nc.entiy.Point;
import com.nc.entiy.Results;
import com.nc.entiy.TPSMeasurements;
import com.nc.service.Pointserviceimp;
import com.nc.service.Pointsservice;
import com.nc.service.Resultsservice;
import com.nc.service.Resultsserviceimp;
import com.nc.service.TPSMeasurementsservice;
import com.nc.service.TPSMeasurementsseviceimp;
import com.nc.util.StringUtils;

/**
 * Servlet implementation class resultsindex
 */
public class resultsindex extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Resultsservice rs=new Resultsserviceimp();
    private TPSMeasurementsservice tp=new TPSMeasurementsseviceimp();
    private Pointsservice ps=new Pointserviceimp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resultsindex() {
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
		String action= request.getParameter("action");
		HttpSession session = request.getSession(false);
		if(action.equals("pointname")&&action!=null){
			List<Point>pspage=ps.listPoints();
			session.setAttribute("ps", pspage);
			response.sendRedirect(request.getContextPath()+"/jsp/admin.jsp");
			return;
		}
		
			if(action!=null&&action.equals("sel")){
	
				
				 Results result=new Results();
				 TPSMeasurements tps=new TPSMeasurements();
				 String pointid= request.getParameter("pointid");
				if(StringUtils.hasLength(pointid)){

					result=	rs.getdetail( Integer.valueOf(pointid),null); 
					request.setAttribute("result", result);
				}
				
				tps=tp.newTPSMeasurements();
				request.setAttribute("tps",tps);
	
				request.getRequestDispatcher("/jsp/result.jsp").forward(request, response);
			
			}
			
		}
		
		
		
	

}
