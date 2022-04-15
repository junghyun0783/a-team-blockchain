package com.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno; 				// 댓글 번호
	private Long bno; 				// 게시글 번호
	private String reply; 			// 댓글
	private String replyer; 		// 댓글 작성자
	private Timestamp replyDate; 	// 댓글 작성날짜
	private Timestamp updateDate;	// 댓글 수정날짜
	
}
