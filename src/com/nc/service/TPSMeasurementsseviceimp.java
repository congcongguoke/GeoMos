package com.nc.service;

import java.util.List;

import com.nc.dao.TPSMeasurementsdao;
import com.nc.entiy.Page;
import com.nc.entiy.TPSMeasurements;

public class TPSMeasurementsseviceimp implements TPSMeasurementsservice {

	@Override
	public List<TPSMeasurements> listTPSMeasurements(int pointid, Page page) {
		// TODO Auto-generated method stub
		return TPSMeasurementsdao.getAll(pointid,page);
	}

	@Override
	public TPSMeasurements newTPSMeasurements() {
		// TODO Auto-generated method stub
		return TPSMeasurementsdao.getnew();
	}

}
