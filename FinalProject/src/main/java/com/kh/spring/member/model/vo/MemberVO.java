package com.kh.spring.member.model.vo;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String password;
	private String username;
	private String gender;
	private String birthyy;
	private String birthmm;
	private String birthdd;
	private String email;
	private String emailChk;
	private String phone;
	private String adrress;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String id, String password, String username, String gender, String birthyy, String birthmm,
			String birthdd, String email, String emailChk, String phone, String adrress, Date enrollDate,
			Date updateDate, String mStatus) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
		this.gender = gender;
		this.birthyy = birthyy;
		this.birthmm = birthmm;
		this.birthdd = birthdd;
		this.email = email;
		this.emailChk = emailChk;
		this.phone = phone;
		this.adrress = adrress;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.mStatus = mStatus;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthyy() {
		return birthyy;
	}
	public void setBirthyy(String birthyy) {
		this.birthyy = birthyy;
	}
	public String getBirthmm() {
		return birthmm;
	}
	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}
	public String getBirthdd() {
		return birthdd;
	}
	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailChk() {
		return emailChk;
	}
	public void setEmailChk(String emailChk) {
		this.emailChk = emailChk;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdrress() {
		return adrress;
	}
	public void setAdrress(String adrress) {
		this.adrress = adrress;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getmStatus() {
		return mStatus;
	}
	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", username=" + username + ", gender=" + gender
				+ ", birthyy=" + birthyy + ", birthmm=" + birthmm + ", birthdd=" + birthdd + ", email=" + email
				+ ", emailChk=" + emailChk + ", phone=" + phone + ", adrress=" + adrress + ", enrollDate=" + enrollDate
				+ ", updateDate=" + updateDate + ", mStatus=" + mStatus + "]";
	}
	
	
	
}
