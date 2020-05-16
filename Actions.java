package com.quinnox.mom.model;

import java.sql.Date;

public class Actions {
	private int actionId;
public int getActionId() {
		return actionId;
	}
	public void setActionId(int actionId) {
		this.actionId = actionId;
	}
private String action_name;
private int assignedTo;
private String status;
private int mom_id;
public int getMomid() {
	return mom_id;
}
public void setMomId(int mom_id) {
	this.mom_id = mom_id;
}
private String expectedDt;
public Actions() {
	this.setStatus("open");
	this.setAssignedTo(0);
	// TODO Auto-generated constructor stub
}
public String getActionName() {
	return action_name;
}
public void setActionName(String action_name) {
	this.action_name = action_name;
}
public int getAssignedTo() {
	return assignedTo;
}
public void setAssignedTo(int string) {
	this.assignedTo = string;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getExpectedDt() {
	return expectedDt;
}
public void setExpectedDt(String expectedDt) {
	this.expectedDt = expectedDt;
}
