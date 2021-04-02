package spring.dto;

import java.sql.Date;

public class ReserveDto {
   private int rnum;
   private int rmnum;
   private int rdmnum;
   private String rmemo;
   private String rtime;
   private Date rdate;
   private int mnum;
   private String mid;
   private String mnick;
   private String mpw;
   private String mhp;
   private String memail;
   private int mrole;
   private int mchat;
   
   
   public int getMnum() {
	return mnum;
}
public void setMnum(int mnum) {
	this.mnum = mnum;
}
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}
public String getMnick() {
	return mnick;
}
public void setMnick(String mnick) {
	this.mnick = mnick;
}
public String getMpw() {
	return mpw;
}
public void setMpw(String mpw) {
	this.mpw = mpw;
}
public String getMhp() {
	return mhp;
}
public void setMhp(String mhp) {
	this.mhp = mhp;
}
public String getMemail() {
	return memail;
}
public void setMemail(String memail) {
	this.memail = memail;
}
public int getMrole() {
	return mrole;
}
public void setMrole(int mrole) {
	this.mrole = mrole;
}
public int getMchat() {
	return mchat;
}
public void setMchat(int mchat) {
	this.mchat = mchat;
}
public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public int getRmnum() {
      return rmnum;
   }
   public void setRmnum(int rmnum) {
      this.rmnum = rmnum;
   }
   public int getRdmnum() {
      return rdmnum;
   }
   public void setRdmnum(int rdmnum) {
      this.rdmnum = rdmnum;
   }
   public String getRmemo() {
      return rmemo;
   }
   public void setRmemo(String rmemo) {
      this.rmemo = rmemo;
   }
   public String getRtime() {
      return rtime;
   }
   public void setRtime(String rtime) {
      this.rtime = rtime;
   }
   public Date getRdate() {
      return rdate;
   }
   public void setRdate(Date rdate) {
      this.rdate = rdate;
   }
   
   

   
}