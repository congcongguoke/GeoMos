package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

public class Point  implements Serializable{
	
/**
	 * 测站点属性
	 */
	private static final long serialVersionUID = 1L;
private int id;
private int limiteid;//限差
private int  profileid;//参考断面
private String name;//点名
private Timestamp epoch;//点名创建时间


public Point() {
	super();
	// TODO Auto-generated constructor stub
}
public Point(Map<String, Object> map){
	this.id=Integer.parseInt(String.valueOf(map.get("ID")));
	this.name=(String)map.get("Name");
	this.epoch=(Timestamp)map.get("Epoch");
	
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getLimiteid() {
	return limiteid;
}
public void setLimiteid(int limiteid) {
	this.limiteid = limiteid;
}
public int getProfileid() {
	return profileid;
}
public void setProfileid(int profileid) {
	this.profileid = profileid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Timestamp getEpoch() {
	return epoch;
}
public void setEpoch(Timestamp epoch) {
	this.epoch = epoch;
}


}
