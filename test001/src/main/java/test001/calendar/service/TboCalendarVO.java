package test001.calendar.service;

import java.util.List;

import test001.common.entity.CommonEntity;

public class TboCalendarVO extends CommonEntity {

	private static final long serialVersionUID = 6892293143448929846L;
	
	private String fcSeq;
	private String fcUser;
	private String fcTitle;
	private String fcStartDate;
	private String fcEndDate;
	private String fcAllday;
	private String fcBgColor;
	private String fcRegistDate;
	private String fcUpdtDate;
	
	private List<TboCalendarVO> claendarVoList;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getFcSeq() {
		return fcSeq;
	}
	public void setFcSeq(String fcSeq) {
		this.fcSeq = fcSeq;
	}
	public String getFcUser() {
		return fcUser;
	}
	public void setFcUser(String fcUser) {
		this.fcUser = fcUser;
	}
	public String getFcTitle() {
		return fcTitle;
	}
	public void setFcTitle(String fcTitle) {
		this.fcTitle = fcTitle;
	}
	public String getFcStartDate() {
		return fcStartDate;
	}
	public void setFcStartDate(String fcStartDate) {
		this.fcStartDate = fcStartDate;
	}
	public String getFcEndDate() {
		return fcEndDate;
	}
	public void setFcEndDate(String fcEndDate) {
		this.fcEndDate = fcEndDate;
	}
	public String getFcAllday() {
		return fcAllday;
	}
	public void setFcAllday(String fcAllday) {
		this.fcAllday = fcAllday;
	}
	public String getFcBgColor() {
		return fcBgColor;
	}
	public void setFcBgColor(String fcBgColor) {
		this.fcBgColor = fcBgColor;
	}
	public String getFcRegistDate() {
		return fcRegistDate;
	}
	public void setFcRegistDate(String fcRegistDate) {
		this.fcRegistDate = fcRegistDate;
	}
	public String getFcUpdtDate() {
		return fcUpdtDate;
	}
	public void setFcUpdtDate(String fcUpdtDate) {
		this.fcUpdtDate = fcUpdtDate;
	}
	public List<TboCalendarVO> getClaendarVoList() {
		return claendarVoList;
	}
	public void setClaendarVoList(List<TboCalendarVO> claendarVoList) {
		this.claendarVoList = claendarVoList;
	}
	
}
