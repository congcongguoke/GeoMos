package com.nc.entiy;

import java.io.Serializable;
import java.sql.Timestamp;

public class Observations implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int observationTpyeid;
	private Timestamp epoch;//测量时间
	private double floatValue;//测量值
	public int getObservationTpyeid() {
		return observationTpyeid;
	}
	public void setObservationTpyeid(int observationTpyeid) {
		this.observationTpyeid = observationTpyeid;
	}
	public Timestamp getEpoch() {
		return epoch;
	}
	public void setEpoch(Timestamp epoch) {
		this.epoch = epoch;
	}
	public double getFloatValue() {
		return floatValue;
	}
	public void setFloatValue(double floatValue) {
		this.floatValue = floatValue;
	}


}
