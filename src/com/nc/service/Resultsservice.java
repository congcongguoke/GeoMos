package com.nc.service;

import java.sql.Timestamp;
import java.util.List;

import com.nc.entiy.Page;
import com.nc.entiy.Results;

public interface Resultsservice {
    /**
     * 
     * @param r 位移结果实体类参数
     * @param page 分页实体类
     * @return  返回所查询到的信息
     */
	public List<Results>getlistresult(Timestamp epoch,Page page);
	/**
	 * 
	 * @param id 位移结果的唯一编号
	 * @return 返回最新详细结果
	 */
	public Results getdetail(int id,Page page);
	
}
