package com.ximelon.xmlife.bean;

import java.io.Serializable;

public class OperationResult implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String OK="OK";
	public static final String ERROR="ERROR";
	
	private String status;
	private String msg;
	
	public static OperationResult OK(String msg){
		OperationResult result=new OperationResult();
		result.status=OK;
		result.msg=msg;
		return result;
	}
	
	public static OperationResult ERROR(String msg){
		OperationResult result=new OperationResult();
		result.status=ERROR;
		result.msg=msg;
		return result;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
