package spring.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AnswerDto {
	
	private int aidx;
	private int acnum;
	private int amidnum;
	private String awriter;
	private String amemo;
	private int arestep;
	private int arelevel;
	private int aregroup;
	private String msg;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp awritedate;
	public int getAidx() {
		return aidx;
	}
	public void setAidx(int aidx) {
		this.aidx = aidx;
	}
	public int getAcnum() {
		return acnum;
	}
	public void setAcnum(int acnum) {
		this.acnum = acnum;
	}
	public int getAmidnum() {
		return amidnum;
	}
	public void setAmidnum(int amidnum) {
		this.amidnum = amidnum;
	}
	public String getAwriter() {
		return awriter;
	}
	public void setAwriter(String awriter) {
		this.awriter = awriter;
	}
	public String getAmemo() {
		return amemo;
	}
	public void setAmemo(String amemo) {
		this.amemo = amemo;
	}
	public int getArestep() {
		return arestep;
	}
	public void setArestep(int arestep) {
		this.arestep = arestep;
	}
	public int getArelevel() {
		return arelevel;
	}
	public void setArelevel(int arelevel) {
		this.arelevel = arelevel;
	}
	public int getAregroup() {
		return aregroup;
	}
	public void setAregroup(int aregroup) {
		this.aregroup = aregroup;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Timestamp getAwritedate() {
		return awritedate;
	}
	public void setAwritedate(Timestamp awritedate) {
		this.awritedate = awritedate;
	}

	
	
}
