package com.nc.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class Jdbc {
	// 表示定义数据库的用户名
		private static String USERNAME ;

		// 定义数据库的密码
		private static String PASSWORD;

		// 定义数据库的驱动信息
		private static String DRIVER;

		// 定义访问数据库的地址
		private static String URL;

		// 定义数据库的链接
		private static Connection connection;
		private static PreparedStatement pstmt;
		private static	ResultSet rs;
		
		static{
			//加载数据库配置信息，并给相关的属性赋值
			loadConfig();
		}
		/**
		 * 加载数据库配置信息，并给相关的属性赋值
		 */
	public static void loadConfig() {
		try {
			InputStream inStream = Jdbc.class
					.getResourceAsStream("/jdbc.properties");
			Properties prop = new Properties();
			prop.load(inStream);
			USERNAME = prop.getProperty("jdbc.username");
			PASSWORD = prop.getProperty("jdbc.password");
			DRIVER= prop.getProperty("jdbc.driver");
			URL = prop.getProperty("jdbc.url");
		} catch (Exception e) {
			throw new RuntimeException("读取数据库配置文件异常！", e);
		}
	}
	
	public Jdbc() {

	}

	/**
	 * 获取数据库连接
	 * 
	 * @return 数据库连接
	 */
	public static Connection getConnection() {
		try {
			Class.forName(DRIVER); // 注册驱动
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD); // 获取连接
		} catch (Exception e) {
			throw new RuntimeException("get connection error!", e);
		}
		return connection;
	}
	
	public static void releaseConn() throws SQLException {
		
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				throw new RuntimeException("rs 关闭异常!", e);
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException("pstmt 关闭异常!", e);
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException("conn 关闭异常!", e);
			}
		}
	}
}
