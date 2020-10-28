package com.kh.spring.board.model.vo;

public class BoardVO {
	int no;
	String category;
	String trade_no;
	String title;
	String content;
	String image;
	String insert_date;
	boolean isComplete;
	boolean isDelete;
	boolean reported;
	int price;
	
	public BoardVO() {}
	
	public BoardVO(int no, String category, String trade_no, String title, String content, String image,
			String insert_date, boolean isComplete, boolean isDelete, boolean reported, int price) {
		super();
		this.no = no;
		this.category = category;
		this.trade_no = trade_no;
		this.title = title;
		this.content = content;
		this.image = image;
		this.insert_date = insert_date;
		this.isComplete = isComplete;
		this.isDelete = isDelete;
		this.reported = reported;
		this.price = price;
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
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
	public boolean isComplete() {
		return isComplete;
	}
	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}
	public boolean isDelete() {
		return isDelete;
	}
	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	public boolean isReported() {
		return reported;
	}
	public void setReported(boolean reported) {
		this.reported = reported;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", category=" + category + ", trade_no=" + trade_no + ", title=" + title
				+ ", content=" + content + ", image=" + image + ", insert_date=" + insert_date + ", isComplete="
				+ isComplete + ", isDelete=" + isDelete + ", reported=" + reported + ", price=" + price + "]";
	}
	
	
}	
