package com.shop.vo;

public class PageBean {
	private int pagesize; //页面大小 每页最多显示的记录数
	private int total;    //需要分页显示的总记录数
	
	private int pagenum;  //总页数
	
	private int page;  // 当前页号    1 ~ pagenum
	
	private int startindex; //当前页的首记录位置号
	private int endindex;  // 当前页的末记录位置号
	
	public PageBean(){
		this.pagesize = 8;
		this.total = 0;
		this.pagenum = 1;
		this.page = 1;
	}
	
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		//...
		this.pagesize = pagesize;
		//计算
		pagenum = (total+ pagesize-1)/pagesize;
		if(pagenum==0){pagenum=1;}
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		//...
		this.total = total;
		
		//计算
		pagenum = (total+ pagesize-1)/pagesize;
		if(pagenum==0){pagenum=1;}
	}
	
	
	public int getPagenum() {
		return pagenum;
	}

	public int getPage() {
		return page;
	}

		
	public void setPage(int page) {
		//。。。
		if(page<1) page=1;
		if(page>pagenum){page=pagenum;}
		this.page = page;
	}

	public int getStartindex() {
		this.startindex =  (page-1)*pagesize;
		return startindex;
	}

	public int getEndindex() {
		int index = page*pagesize - 1;
		if(index>total-1){
			index = total-1;
		}
		if(index<=0){
			index=0;
		}
		this.endindex = index;
		
		return endindex;
	}
	
	
	
	
}
