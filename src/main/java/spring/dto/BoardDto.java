package spring.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardDto {
	
	private int bnum;
	private int bmidnum;
	private String bwriter;
	private String bsubject;
	private String bcontent;
	private String bphoto;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp bwritedate;
	private int breadcount;
	private int readcount;
	private int regroup;
	private int restep;
	private int relevel;
	private int hbnum;
	private String hashtag;
	private int snum;
	private int smidnum;
	private int sbnum;
	private int scnum;
	
	
	public String getBphoto() {
		return bphoto;
	}
	public void setBphoto(String bphoto) {
		this.bphoto = bphoto;
	}
	public int getHbnum() {
		return hbnum;
	}
	public void setHbnum(int hbnum) {
		this.hbnum = hbnum;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRegroup() {
		return regroup;
	}
	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}
	public int getRestep() {
		return restep;
	}
	public void setRestep(int restep) {
		this.restep = restep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBmidnum() {
		return bmidnum;
	}
	public void setBmidnum(int bmidnum) {
		this.bmidnum = bmidnum;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Timestamp getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(Timestamp bwritedate) {
		this.bwritedate = bwritedate;
	}
	public int getBreadcount() {
		return breadcount;
	}
	public void setBreadcount(int breadcount) {
		this.breadcount = breadcount;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getSmidnum() {
		return smidnum;
	}
	public void setSmidnum(int smidnum) {
		this.smidnum = smidnum;
	}
	public int getSbnum() {
		return sbnum;
	}
	public void setSbnum(int sbnum) {
		this.sbnum = sbnum;
	}
	public int getScnum() {
		return scnum;
	}
	public void setScnum(int scnum) {
		this.scnum = scnum;
	}
	
}
