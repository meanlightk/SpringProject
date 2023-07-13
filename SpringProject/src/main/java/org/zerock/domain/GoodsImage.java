package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GoodsImage {
	private int ino;
	private int gno;
	private String imagepath;
}
