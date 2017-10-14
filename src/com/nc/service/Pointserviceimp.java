package com.nc.service;

import java.util.List;

import com.nc.dao.Pointdao;
import com.nc.entiy.Page;
import com.nc.entiy.Point;

public class Pointserviceimp implements Pointsservice {

	@Override
	public List<Point> listPoints() {
		// TODO Auto-generated method stub
		return Pointdao.getAll();
	}

}
