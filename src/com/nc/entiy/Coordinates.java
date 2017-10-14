package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;

import java.util.Map;

public class Coordinates implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private int pointid;//点名id
	private int tPSSetupid;//测站id
	private Timestamp epoch;//初始值更新时间
	private double easting;//东坐标
	private double northing;//北坐标
	private double height;//高程
	private short type;//坐标类型（1初始值，2参考值，3当前值，4扫描值）
	private String name;
	
	public Coordinates(Map<String, Object> map){
		
		
		this.pointid=Integer.parseInt(String.valueOf(map.get("Point_ID")));
		
		this.easting= (double)map.get("Easting");
		this.northing = (double)map.get("Northing");
		this.height = (double)map.get("Height");
		this.epoch=(Timestamp)map.get("Epoch");
		this.setName((String)map.get("Name"));
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPointid() {
		return pointid;
	}
	public void setPointid(int pointid) {
		this.pointid = pointid;
	}
	public int gettPSSetupid() {
		return tPSSetupid;
	}
	public void settPSSetupid(int tPSSetupid) {
		this.tPSSetupid = tPSSetupid;
	}
	public Timestamp getEpoch() {
		return epoch;
	}
	public void setEpoch(Timestamp epoch) {
		this.epoch = epoch;
	}
	public double getEasting() {
		return easting;
	}
	public void setEasting(double easting) {
		this.easting = easting;
	}
	public double getNorthing() {
		return northing;
	}
	public void setNorthing(double northing) {
		this.northing = northing;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public short getType() {
		return type;
	}
	public void setType(short type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
