package com.kh.spring.board.model.vo;

public class PageInfo {
	int count;
	int last;
	int curpage;
	String curUrn;
	int total;
	int length;
	int start;
	
	
	public PageInfo() {};
	
	
	
	public PageInfo(int count, int last, int curpage, int total) {
		super();
		this.count = count;
		this.last = last;
		this.curpage = curpage;
		this.total = total;
	}

	


	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public int getLast() {
		return last;
	}



	public void setLast(int last) {
		this.last = last;
	}



	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public int getLength() {
		return length;
	}



	public void setLength(int length) {
		this.length = length;
	}



	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	

	public int getCurpage() {
		return curpage;
	}



	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}



	public String getCurUrn() {
		return curUrn;
	}



	public void setCurUrn(String curUrn) {
		this.curUrn = curUrn;
	}



	@Override
	public String toString() {
		return "BoardInfo [count=" + count + ", last=" + last + ", curpage=" + curpage + ", curUrn=" + curUrn
				+ ", total=" + total + ", length=" + length + ", start=" + start + "]";
	}
}
