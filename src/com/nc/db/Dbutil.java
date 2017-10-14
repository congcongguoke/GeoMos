package com.nc.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nc.entiy.Page;




public class Dbutil {

	// 定义一个局部线程变量（使每个线程都拥有自己的连接）
	public static ThreadLocal<Connection> connContainer = new ThreadLocal<Connection>();

	public static List<Map<String, Object>> selectlist(String sql, List<?> params) throws SQLException {

		// 定义sql语句的执行对象
		PreparedStatement pstmt=null;
		// 定义查询返回的结果集合
		ResultSet rs=null;
		List<Map<String, Object>> resultlist = new ArrayList<>(); 
		/*
		 * 
		 * Connection conn = connContainer.get();
		 * if(conn==null){
			conn=Jdbc.getConnection();
			connContainer.set(conn);
		}
		if(conn==null){
			conn=Jdbc.getConnection();
			connContainer.set(conn);
		}
		if(conn==null){
			conn=Jdbc.getConnection();
			connContainer.set(conn);
		}
		 */
		
		try{
			Connection conn=Jdbc.getConnection();
		pstmt = conn.prepareStatement(sql);
		if (params != null && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}	
		}
		rs=pstmt.executeQuery();
		ResultSetMetaData metaData = rs.getMetaData();
		int cols_len = metaData.getColumnCount();
		while(rs.next()){
			
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value;
			
					cols_value = rs.getObject(cols_name);
				
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
				
			
			}
		
			resultlist.add(map);
		}
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		throw e;
	}finally{
		Jdbc.releaseConn();
		
	}
		return resultlist;

	}
	
	public static int executeU(String sql,List<?>params) throws SQLException {
		// 定义sql语句的执行对象
		int result=0;
				PreparedStatement pstmt=null;
		
	/*	Connection conn=connContainer.get();
		if(conn==null){
			conn=Jdbc.getConnection();
			connContainer.set(conn);
		}
		*/
		try{
			Connection conn=Jdbc.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			if (params != null && params.size() > 0) {
				for (int i = 0; i < params.size(); i++) 
					pstmt.setObject(i + 1, params.get(i));
				}	
			
		
			result	=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		finally{
			
			
			Jdbc.releaseConn();
			connContainer.remove();
		
		}	return result;	
	}

	
	
	
	/**
	 * 	获得分页数据列表
	 * @param querySql 查询sql语句
	 * @param clazz 实体类
	 * @param offset 偏移量
	 * @param pagesize 每页显示最大数据
	 * @param params 参数
	 * @return
	 * @throws SQLException
	 */
	public  static  Page getPageModel(String querySql,List<?>params,Page page) throws SQLException{
		
		List<Object>param=new ArrayList<Object>();
		param.addAll(params);
		String sql = getLimit(querySql);
		
	int number=	getTotal(querySql, params);

		page.setTotalNumber(number);
		//System.out.println(page.getTotalPage());
	     int dbIndex=page.getDbIndex();
	     
		param.add(dbIndex);
		
		page.setDatas(selectlist(sql,param));
		
		return page;
	}
	/**
	 * 获得分页sql语句
	 * @param querySql 执行的sql语句
	 * @return
	 */
	public static String getLimit(String querySql) {
		String sql=" select Top 15 o.* from (select row_number() over(order by Epoch Desc ) as rownumber, *from( " ; 
				
		String sql2=" )AS T ) as o where rownumber>? " ;
		sql+=querySql;
		sql+=sql2;
		return sql;
	}
	
	/**
	 * 获取记录总数
	 * 
	 * @param sqlQuery
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public static int getTotal(String sqlQuery,List<?>params) throws SQLException {	
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		if (sqlQuery.toLowerCase().indexOf("from") != -1) {
			 sql = " select  count(*) ct " + sqlQuery.toLowerCase().substring(sqlQuery.indexOf("from"));
		} else{
			throw new SQLException("查询的SQL语句有误，请检查查询语句！");
		}
		/*Connection conn = connContainer.get();
		if(conn==null){
			conn=Jdbc.getConnection();
			connContainer.set(conn);
		}*/
		
		Connection conn = Jdbc.getConnection();
		pstmt = conn.prepareStatement(sql);
		if (params != null&&params.size()>0) {
			
				for (int i = 0; i < params.size(); i++) {
					pstmt.setObject(i + 1, params.get(i));
				}
				}
			 /*else{
				throw new SQLException("查询条件和参数列表不匹配，查询条件个数为 "
						+ pstmt.getParameterMetaData().getParameterCount()
						+ ", 参数列表个数为 " + params.size());
			}*/
		
		rs = pstmt.executeQuery();
		if (rs.next())
			return rs.getInt("ct");
		return 0;
	}
	
	
	
}
