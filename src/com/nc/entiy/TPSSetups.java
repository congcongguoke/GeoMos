package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;

public class TPSSetups  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private int tPSsensorid;//全站仪id
	private int pointid;//点名id
	private String name;//点名
	private Timestamp epoch;//初始值更新时间
	private double ppm;//ppm值
	private double orientation;//定向值
	private int state;//0,3
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int gettPSsensorid() {
		return tPSsensorid;
	}
	public void settPSsensorid(int tPSsensorid) {
		this.tPSsensorid = tPSsensorid;
	}
	public int getPointid() {
		return pointid;
	}
	public void setPointid(int pointid) {
		this.pointid = pointid;
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
	public double getPpm() {
		return ppm;
	}
	public void setPpm(double ppm) {
		this.ppm = ppm;
	}
	public double getOrientation() {
		return orientation;
	}
	public void setOrientation(double orientation) {
		this.orientation = orientation;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	} 


}
