package com.nc.service;

import java.util.List;

import com.nc.entiy.Page;
import com.nc.entiy.TPSMeasurements;

public interface TPSMeasurementsservice {
  
	/**
	 * 
	 * @param pointid 实体类TPSMeasurements的关联point的唯一编号
	 * @param page 实体类分页
	 * @return 返回分页结果
	 */
	
	public List<TPSMeasurements> listTPSMeasurements(int pointid,Page page);
	
	/**
	 * 
	 * @param tp 实体类参数
	 * @return 返回最实时的温度等结果
	 */
	public TPSMeasurements newTPSMeasurements();
}
