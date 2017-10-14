package com.nc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;




import com.nc.db.Dbutil;
import com.nc.entiy.Coordinates;
import com.nc.entiy.Page;


public class Coordinatesdao {

	public static List<Coordinates> getAll(Page page){
		List<Coordinates> result =null;
		result = new ArrayList<Coordinates>();
		List<Object> paramList ;
		paramList = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer(
	" select C.Point_ID ,C.Epoch ,C.Easting,C.Northing,C.Height ,P.Name from [AXH].[dbo].[Coordinates] C,[AXH].[dbo].[Points] P where C.Point_ID=P.ID  ");


		//sql.append(" order by Point_ID asc ");
		
		try {
			
			page=Dbutil.getPageModel(sql.toString(), paramList,page);
						List<Map<String, Object>> mapList = page.getDatas();
				if (mapList != null) {
					for (Map<String, Object> map : mapList) {
						Coordinates top = new Coordinates(map);
						result.add(top);
					}
				}
				
				//System.out.println(page.getTotalNumber());
				return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();

			throw new RuntimeException("查询初始坐标数据异常！", e);
		}
	}
	
	
}
