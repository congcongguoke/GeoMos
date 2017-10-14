package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;

import java.util.Map;

public class Results  implements Serializable{

	/**
	 * 监测点的结果
	 */
	private static final long serialVersionUID = 1L;

private int id;
private int pointid;
private Timestamp epoch;//观测时间
private double easting;//东坐标
private double northing;//北坐标
private double height;//高程
private double eastingDiff;//东方向位移
private double northingDiff;//北方向位移
private double heightDiff;//高程位移
private double LongitudinalDisplacement;//纵向位移
private double TransverseDisplacement;//横向位移
private double HeightDisplacement;//沉降位移
private String customText1;//点组
private String name;//点名
private double temperature;//测量时温度
private double pressure;//测量时气压
private double humidity;//测量时湿度


public double getTemperature() {
	return temperature;
}

public void setTemperature(double temperature) {
	this.temperature = temperature;
}

public double getPressure() {
	return pressure;
}

public void setPressure(double pressure) {
	this.pressure = pressure;
}

public double getHumidity() {
	return humidity;
}

public void setHumidity(double humidity) {
	this.humidity = humidity;
}



public Results() {
	super();
	// TODO Auto-generated constructor stub
}

public Results(Map<String, Object> map){
	this.id=Integer.parseInt(String.valueOf(map.get("ID")));
	
	this.pointid=Integer.parseInt(String.valueOf(map.get("Point_ID")));
	
	this.easting = (double)map.get("Easting");
	this.northing = (double)map.get("Northing");
	this.height = (double)map.get("Height");
	this.epoch=(Timestamp)map.get("Epoch");
	this.eastingDiff = (double)map.get("HeightDiff");
	this.northingDiff = (double)map.get("NorthingDiff");
	this.heightDiff = (double)map.get("HeightDiff");
	this.name = (String)map.get("Name");
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
public double getEastingDiff() {
	return eastingDiff;
}
public void setEastingDiff(double eastingDiff) {
	this.eastingDiff = eastingDiff;
}
public double getNorthingDiff() {
	return northingDiff;
}
public void setNorthingDiff(double northingDiff) {
	this.northingDiff = northingDiff;
}
public double getHeightDiff() {
	return heightDiff;
}
public void setHeightDiff(double heightDiff) {
	this.heightDiff = heightDiff;
}
public double getLongitudinalDisplacement() {
	return LongitudinalDisplacement;
}
public void setLongitudinalDisplacement(double longitudinalDisplacement) {
	LongitudinalDisplacement = longitudinalDisplacement;
}
public double getTransverseDisplacement() {
	return TransverseDisplacement;
}
public void setTransverseDisplacement(double transverseDisplacement) {
	TransverseDisplacement = transverseDisplacement;
}
public double getHeightDisplacement() {
	return HeightDisplacement;
}
public void setHeightDisplacement(double heightDisplacement) {
	HeightDisplacement = heightDisplacement;
}
public String getCustomText1() {
	return customText1;
}
public void setCustomText1(String customText1) {
	this.customText1 = customText1;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}



}
