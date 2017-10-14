package com.nc.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nc.entiy.Page;
import com.nc.entiy.Results;
import com.nc.service.Resultsservice;
import com.nc.service.Resultsserviceimp;
import com.nc.util.DateUtil;
import com.nc.util.StringUtils;

/**
 * Servlet implementation class Resultsservlet
 */
public class Resultsservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Resultsservice rs=new Resultsserviceimp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Resultsservlet() {
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
	
		String epoch= request.getParameter("epoch");
		String currentPage = request.getParameter("currentPage");
		Page page=new Page();
		Pattern pattern = Pattern.compile("[0-9]{1,9}");
		if(currentPage == null ||  !pattern.matcher(currentPage).matches()) {
			page.setCurrentPage(1);
		} else {
			page.setCurrentPage(Integer.valueOf(currentPage));
		}
	
		if(StringUtils.hasLength(epoch)){
			request.setAttribute("epoch", epoch);
			List<Results>rspage=rs.getlistresult(DateUtil.getTimestamp2(epoch),page);
			request.setAttribute("rspage",rspage );
		}else{
			List<Results>rspage=rs.getlistresult(null,page);
			request.setAttribute("rspage",rspage );
		}
		
		
	
	request.setAttribute("page", page);
	request.getRequestDispatcher("/jsp/resultlist.jsp").forward(request, response);
	}

}
