package com.kh.spring.qna.model.vo;

import java.sql.Date;

public class QnaVO {
	private int qnaId;
	private String reason;
	private String qnaTitle;
	private String qnaWriter;
	private String qnaContent;
	private String areply;
	private String originalFileName;
	private String renameFileName;
	private int qnaCount;
	private Date qnaCreateDate;
	private Date qnaModifyDate;
	private String qStatus;
	
	
	public QnaVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public QnaVO(int qnaId, String reason, String qnaTitle, String qnaWriter, String qnaContent, String areply,
			String originalFileName, String renameFileName, int qnaCount, Date qnaCreateDate, Date qnaModifyDate,
			String qStatus) {
		super();
		this.qnaId = qnaId;
		this.reason = reason;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaContent = qnaContent;
		this.areply = areply;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.qnaCount = qnaCount;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaModifyDate = qnaModifyDate;
		this.qStatus = qStatus;
	}


	public int getQnaId() {
		return qnaId;
	}


	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getQnaTitle() {
		return qnaTitle;
	}


	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}


	public String getQnaWriter() {
		return qnaWriter;
	}


	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}


	public String getQnaContent() {
		return qnaContent;
	}


	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}


	public String getAreply() {
		return areply;
	}


	public void setAreply(String areply) {
		this.areply = areply;
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


	public int getQnaCount() {
		return qnaCount;
	}


	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}


	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}


	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}


	public Date getQnaModifyDate() {
		return qnaModifyDate;
	}


	public void setQnaModifyDate(Date qnaModifyDate) {
		this.qnaModifyDate = qnaModifyDate;
	}


	public String getqStatus() {
		return qStatus;
	}


	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}


	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", reason=" + reason + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter
				+ ", qnaContent=" + qnaContent + ", areply=" + areply + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", qnaCount=" + qnaCount + ", qnaCreateDate=" + qnaCreateDate
				+ ", qnaModifyDate=" + qnaModifyDate + ", qStatus=" + qStatus + "]";
	}




	
	
	
}
