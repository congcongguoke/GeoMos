package com.nc.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.nc.db.Dbutil;
import com.nc.entiy.Page;
import com.nc.entiy.Results;



public class Resultsdao {

	public static List<Results> getAll(Timestamp epoch,Page page) {
		List<Results> result = null;
		result = new ArrayList<Results>();
		List<Object> paramList = null;
		paramList = new ArrayList<Object>();

		StringBuffer sql = new StringBuffer(
" select top 100 percent R.ID,R.Point_ID,R.Epoch,R.Easting,R.Northing,R.Height,R.EastingDiff,R.NorthingDiff,R.HeightDiff ,P.Name from [AXH].[dbo].[Results]  R, [AXH].[dbo].[Points]  P where R.Point_ID=P.ID GROUP BY R.ID,R.Point_ID,R.Epoch,R.Easting,R.Northing,R.Height,R.EastingDiff,R.NorthingDiff,R.HeightDiff ,P.Name order by R.Epoch desc ");

		
		if (epoch != null && !epoch.equals("")) {
			sql.append(" and R.Epoch >= ? ");
			paramList.add(epoch);
		}
		//sql.append(" order by Point_ID asc");
		try {
			
		page=Dbutil.getPageModel(sql.toString(), paramList,page);
					List<Map<String, Object>> mapList = page.getDatas();
			if (mapList != null) {
				for (Map<String, Object> map : mapList) {
					Results results = new Results(map);
					result.add(results);
				}
			}
			
			//System.out.println(page.getTotalNumber());
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
			throw new RuntimeException("查询监测点结果数据异常！", e);
		}
	}
	
	public static Results getdetail(int id,Page page) {
		List<Results> result = null;
		result = new ArrayList<Results>();
		List<Object> paramList = null;
		paramList = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder(
" select TOP 1 R.ID,R.Point_ID,R.Epoch,R.Easting,R.Northing,R.Height,R.EastingDiff,R.NorthingDiff,R.HeightDiff ,P.Name from [AXH].[dbo].[Results]  R, [AXH].[dbo].[Points]  P where R.Point_ID=P.ID ");
      if(id>0){
	sql.append("and R.Point_ID= ?" );
	paramList.add(id);
         }
		
		sql.append(" order by R.Epoch desc");
		try {
			
		
					List<Map<String, Object>> mapList = Dbutil.selectlist(sql.toString(), paramList);;
			if (mapList != null) {
				for (Map<String, Object> map : mapList) {
					Results results = new Results(map);
					result.add(results);
				}
			}
			//System.out.println(page.getTotalNumber());
			return result.get(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
			throw new RuntimeException("查询具体的监测点结果数据异常！", e);
		}
	}
	
	
	
}
