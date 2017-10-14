package com.nc.service;

import java.util.List;

import com.nc.dao.Coordinatesdao;
import com.nc.entiy.Coordinates;
import com.nc.entiy.Page;

public class Coordinatesserviceimp implements Coordinatesservice {

	@Override
	public List<Coordinates> listCoordinates( Page page) {
		// TODO Auto-generated method stub
		return Coordinatesdao.getAll(page);
	}

}
