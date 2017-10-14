package com.nc.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Date parse tools
 * <p>
 * Title: DateUtils.java
 * </p>
 * 
 * Description: 
 * <p> 
 * <pre>
 * A Date tools parse String to Date or generate a String delegate the input Date	
 * </pre>
 * @author Gavin
 * @version 1.0
 * @since Jun 27, 2011, 1:39:22 PM
 */
public class DateUtil {
	
	public final static String YYYY = "yyyy";
	public final static String YYYY_MM_DD = "yyyy-MM-dd";
	public final static String YYYYMMDD = "yyyyMMdd";
	public final static String YYYY_MM_DD_HH_MM="yyyy-MM-dd HH:mm"; 
	public final static String YYYYMMDDHHMM="yyyyMMddHHmm"; 
	public final static String YYYY_MM_DD_HH_MM_SS="yyyy-MM-dd HH:mm:ss";
	public final static String YYYYMMDDHHMMSS="yyyyMMddHHmmss";
	
	/**
	 * generate a date object uses the given string and format
	 * @param str - the source string use the parameter format  to express
	 * @param format - the String in this class such as <code>DateUtils.YYYYMMDD</code>
	 * @return
	 */
	public static Date getFormatDate(String str, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		try {
			return df.parse(str);
		} catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	/**
	 * generate a String uses the given Date and format
	 * @param date - the source date will format
	 * @param format - the String in this class such as <code>DateUtils.YYYYMMDD</code>
	 * @return
	 */
	public static String getStringDate(Date date, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	/**
	 * Return to 13 filament words grow of time format, the precision arrives milliscond
	 * @param date
	 * @return
	 */
	public static long getLong13Time(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}
	
	/**
	 *  Returns to 10 figure word lengths the time format, precisely to second  
	 * @param date
	 * @return
	 */
	public static long getLong10Time(Date date) {
		return getLong13Time(date)/1000;
	}
	
	/**
	 * get the Timestamp format time
	 * @param date
	 * @return
	 */
	public static Timestamp getTimestamp(Date date) {
        try{
        	return new java.sql.Timestamp(date.getTime());
        }catch(Exception e){
        	return null;
        }
    }
	

	/**
	 * get the Timestamp2  format String
	 * @param date
	 * @return
	 */
	public static Timestamp getTimestamp2(String date) {
        try{
        	
        	 Timestamp ts = Timestamp.valueOf(date);
        	return ts;
        }catch(Exception e){
        	return null;
        }
    }
} // end of class DateUtils
