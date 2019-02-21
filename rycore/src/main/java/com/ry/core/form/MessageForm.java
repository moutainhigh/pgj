package com.ry.core.form;

import java.util.Date;

import com.ry.core.entity.Message;

import com.ry.util.DateUtil;

public class MessageForm extends Message{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7094937619476577856L;

	private Date beginDate;
	
	private Date endDate;
	
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		if(endDate==null){
			this.endDate = endDate;
		}else{
			this.endDate = DateUtil.addDays(endDate,1);
		}
		
	}
	
}
