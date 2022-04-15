package com.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO2 {

	private Long rno; 				// 댓글의 고유번호
	private Long bno; 				// 게시글 번호
	private String reply; 			// 댓글
	private String replyer; 		// 댓글 작성자
	private Timestamp replyDate; 	// 댓글 작성날짜
	private Long grp; 				// 한댓글의 자식댓글들까지의 그룹번호
	private Integer step;			// 댓글의 시각적으로 보이는 순서(같은값이 존재 할 수 없다.)
	private Integer lev;			// 댓글의 깊이 (같은값이 존재 할 수 있다.)
	
}
