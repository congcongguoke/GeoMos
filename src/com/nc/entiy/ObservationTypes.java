package com.nc.entiy;

import java.io.Serializable;

public class ObservationTypes  implements Serializable{

	/**
	 * 
	 */
private static final long serialVersionUID = 1L;
private int id;
private String text;//测量内容
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}


}
