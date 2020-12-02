package com.kh.spring.board.model.vo;

import java.sql.Date;

/**
 * @author air92
 *
 */
public class BoardVO {

	int no;
	String category;
	String writer;
	String title;
	String content;
	String originalFileName;
	String renameFileName;
	Date insert_date;
	Date trade_date;
	String trade_id;
	char isTraded;
	char isDeleted;
	char Reported;
	int price;
	int checkZzim;
	
	public BoardVO() {}

	public BoardVO(int no, String category, String writer, String title, String content, String originalFileName,
			String renameFileName, Date insert_date, Date trade_date, String trade_id, char isTraded, char isDeleted,
			char reported, int price, int checkZzim) {
		super();
		this.no = no;
		this.category = category;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.insert_date = insert_date;
		this.trade_date = trade_date;
		this.trade_id = trade_id;
		this.isTraded = isTraded;
		this.isDeleted = isDeleted;
		Reported = reported;
		this.price = price;
		this.checkZzim = checkZzim;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Date getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}

	public Date getTrade_date() {
		return trade_date;
	}

	public void setTrade_date(Date trade_date) {
		this.trade_date = trade_date;
	}

	public String getTrade_id() {
		return trade_id;
	}

	public void setTrade_id(String trade_id) {
		this.trade_id = trade_id;
	}

	public char getIsTraded() {
		return isTraded;
	}

	public void setIsTraded(char isTraded) {
		this.isTraded = isTraded;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	public char getReported() {
		return Reported;
	}

	public void setReported(char reported) {
		Reported = reported;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCheckZzim() {
		return checkZzim;
	}

	public void setCheckZzim(int checkZzim) {
		this.checkZzim = checkZzim;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", category=" + category + ", writer=" + writer + ", title=" + title + ", content="
				+ content + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
				+ ", insert_date=" + insert_date + ", trade_date=" + trade_date + ", trade_id=" + trade_id
				+ ", isTraded=" + isTraded + ", isDeleted=" + isDeleted + ", Reported=" + Reported + ", price=" + price
				+ ", checkZzim=" + checkZzim + "]";
	}

	

	
	
	
}	
