package com.nc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.nc.db.Dbutil;
import com.nc.entiy.Page;
import com.nc.entiy.Point;




public class Pointdao {

	public static List<Point> getAll() {
		List<Point> result= null;
		result= new ArrayList<Point>();
		List<Object> paramList = null;
		paramList = new ArrayList<Object>();
	
		StringBuilder sql = new StringBuilder(" select ID,Name,Epoch from [AXH].[dbo].[Points] ");

		
		//sql.append(" order by ID asc ");
		try {
			
	
					List<Map<String, Object>> mapList = Dbutil. selectlist(sql.toString(), paramList);
			if (mapList != null) {
				for (Map<String, Object> map : mapList) {
					Point top = new Point(map);
					result.add(top);
				}
			}
			
			//System.out.println(page.getTotalNumber());
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
			throw new RuntimeException("查询监测点数据异常！", e);
		}
	}
	
}
