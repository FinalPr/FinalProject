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
	private String address;
	private String originalFileName;
	private String renameFileName;
	private String self_introduction;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus;
	private String SALT;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String username, String gender, String birthyy, String birthmm,
			String birthdd, String email, String emailChk, String phone, String address, String originalFileName,
			String renameFileName, String self_introduction, Date enrollDate, Date updateDate, String mStatus,
			String sALT) {
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
		this.address = address;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.self_introduction = self_introduction;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.mStatus = mStatus;
		SALT = sALT;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getSelf_introduction() {
		return self_introduction;
	}

	public void setSelf_introduction(String self_introduction) {
		this.self_introduction = self_introduction;
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

	public String getSALT() {
		return SALT;
	}

	public void setSALT(String sALT) {
		SALT = sALT;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", username=" + username + ", gender=" + gender
				+ ", birthyy=" + birthyy + ", birthmm=" + birthmm + ", birthdd=" + birthdd + ", email=" + email
				+ ", emailChk=" + emailChk + ", phone=" + phone + ", address=" + address + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", self_introduction=" + self_introduction
				+ ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", mStatus=" + mStatus + ", SALT="
				+ SALT + "]";
	}



}
