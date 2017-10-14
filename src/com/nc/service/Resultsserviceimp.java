package com.nc.service;

import java.sql.Timestamp;
import java.util.List;

import com.nc.dao.Resultsdao;
import com.nc.entiy.Page;
import com.nc.entiy.Results;

public class Resultsserviceimp implements Resultsservice {

	@Override
	public List<Results> getlistresult(Timestamp epoch, Page page) {
		// TODO Auto-generated method stub
		
		
		return Resultsdao.getAll( epoch,page);
	}

	@Override
	public Results getdetail(int id, Page page) {
		// TODO Auto-generated method stub
		
		
		return Resultsdao.getdetail(id, page);
	}

}
