package com.nc.service;

import java.util.List;

import com.nc.entiy.Coordinates;
import com.nc.entiy.Page;

public interface Coordinatesservice {

	/**
	 * 
	 * @param c 实体类参数
	 * @param page 实体类分页
	 * @return 返回查询的信息
	 */
	public List<Coordinates> listCoordinates(Page page);
}
