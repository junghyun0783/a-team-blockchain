package com.board.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage; 	// 현재페이지의 시작 페이지	ex) 1  11 21 31 	   	
	private int endPage;	// 현재페이지의 마지막 페이지	ex) 10 20 30 40
	private boolean prev; 	// < 좌측화살표
	private boolean next;   // > 우측화살표
	
	private int total;		// 전체 글의 개수 
	private Criteria cri; 	// 페이지번호, 페이지당 보여줄 글의 개수 
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri; 
		this.total = total; 
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10; // 10
		System.out.println("헐 페이지 이거 뭔데!!!!!!!!!?????????? endPage :       "+endPage);
		System.out.println("헐 페이지 이거 뭔데!!!!!!!!!?????????? 현재페이지 :      "+cri.getPageNum());
		this.startPage = this.endPage - 9; // -9
		int lastPage = (int)(Math.ceil((total * 1.0) / cri.getListQty()));
		System.out.println("헐 페이지 이거 뭔데!!!!!!!!!?????????? 마지막페이지 :        "+lastPage);
		if(lastPage < this.endPage) {
			this.endPage = lastPage; 
		}
		
		this.prev = this.startPage > 1; 
		this.next = this.endPage < lastPage; 
		
		
	}
	
}
