package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

public class TPSMeasurements implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int id;
private int tPSSetupid;//测站ID
private int pointid;//点名ID
private Timestamp epoch;//测量时间
private double hzAngle;//水平角
private double vAngle;//垂直角
private double SlopeDistance;//斜距
private double temperature;//测量时温度
private double pressure;//测量时气压
private double humidity;//测量时湿度
private int reductionFlag;//
private int editflag;//
private short face;//测量面(1-盘左，2-盘右，3-双面)
private short type;//
private short compensatorState;//
private int pointGroupid;//
private String name;

public TPSMeasurements() {
	super();
	// TODO Auto-generated constructor stub
}

public TPSMeasurements(Map<String, Object> map){
	this.id=Integer.parseInt(String.valueOf(map.get("ID")));
	this.pointid=Integer.parseInt(String.valueOf(map.get("Point_ID")));
	this.epoch=(Timestamp)map.get("Epoch");
	this.temperature = (double)map.get("Temperature");
	this.pressure = (double)map.get("Pressure");
	this.humidity = (double)map.get("Humidity");
	this.name=(String)map.get("Name");
	
}




public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int gettPSSetupid() {
	return tPSSetupid;
}
public void settPSSetupid(int tPSSetupid) {
	this.tPSSetupid = tPSSetupid;
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
public double getHzAngle() {
	return hzAngle;
}
public void setHzAngle(double hzAngle) {
	this.hzAngle = hzAngle;
}
public double getvAngle() {
	return vAngle;
}
public void setvAngle(double vAngle) {
	this.vAngle = vAngle;
}
public double getSlopeDistance() {
	return SlopeDistance;
}
public void setSlopeDistance(double slopeDistance) {
	SlopeDistance = slopeDistance;
}
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
public int getReductionFlag() {
	return reductionFlag;
}
public void setReductionFlag(int reductionFlag) {
	this.reductionFlag = reductionFlag;
}
public int getEditflag() {
	return editflag;
}
public void setEditflag(int editflag) {
	this.editflag = editflag;
}
public short getFace() {
	return face;
}
public void setFace(short face) {
	this.face = face;
}
public short getType() {
	return type;
}
public void setType(short type) {
	this.type = type;
}
public short getCompensatorState() {
	return compensatorState;
}
public void setCompensatorState(short compensatorState) {
	this.compensatorState = compensatorState;
}
public int getPointGroupid() {
	return pointGroupid;
}
public void setPointGroupid(int pointGroupid) {
	this.pointGroupid = pointGroupid;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}



}
