package com.nc.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.nc.db.Dbutil;
import com.nc.entiy.Page;
import com.nc.entiy.TPSMeasurements;


public class TPSMeasurementsdao {
//查询所有某监测站点的所有温度历史记录
	public static List<TPSMeasurements> getAll(int pointid,Page page) {
		List<TPSMeasurements> result = null;
		result = new ArrayList<TPSMeasurements>();
		List<Object> paramList = null;
		paramList = new ArrayList<Object>();

		StringBuffer sql = new StringBuffer(
" select T.ID,T.Point_ID,T.Epoch,T.Temperature,T.Pressure,T.Humidity ,P.Name from [AXH].[dbo].[TPSMeasurements] T, [AXH].[dbo].[Points] P where T.Point_ID=P.ID ");

		if (pointid>0) {
			sql.append(" and Point_ID = ? ");
			paramList.add(pointid);
		}
		//sql.append(" order by Epoch desc");
		try {
			
		page=Dbutil.getPageModel(sql.toString(), paramList,page);
					List<Map<String, Object>> mapList = page.getDatas();
			if (mapList != null) {
				for (Map<String, Object> map : mapList) {
					TPSMeasurements results = new TPSMeasurements(map);
					result.add(results);
				}
			}
			//System.out.println(page.getTotalNumber());
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
			throw new RuntimeException("查询单个监测点温度结果数据异常！", e);
		}
	}
	
	
	public static TPSMeasurements getnew() {
		TPSMeasurements result = new TPSMeasurements();
	
		List<Object> paramList = null;
	

		StringBuilder sql = new StringBuilder(
" select TOP 1 Temperature,Pressure,Humidity from [AXH].[dbo].[TPSMeasurements] ");
	
		sql.append(" order by Epoch desc");
		try {
			
			List<Map<String, Object>> mapList=Dbutil.selectlist(sql.toString(), paramList);
			if (mapList != null) {
				result.setTemperature((double)mapList.get(0).get("Temperature"));
				result.setPressure((double)mapList.get(0).get("Pressure"));
				result.setHumidity((double)mapList.get(0).get("Humidity"));
			}
			//System.out.println(page.getTotalNumber());
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
			throw new RuntimeException("查询最新温度结果数据异常！", e);
		}
	}
	
	
	
	
}
