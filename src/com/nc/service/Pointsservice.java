package com.nc.service;

import java.util.List;

import com.nc.entiy.Page;
import com.nc.entiy.Point;

public interface Pointsservice {

	/**
	 * 
	 * @param 实体类参数
	 * @param page 实体类分页
	 * @return 返回查询的信息
	 */
public List<Point> listPoints();

}
