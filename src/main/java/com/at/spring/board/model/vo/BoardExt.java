package com.at.spring.board.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class BoardExt extends Board {
	
	private String name;
}
