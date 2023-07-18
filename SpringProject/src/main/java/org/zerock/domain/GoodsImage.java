package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsImage {
	private String uuid;
	private int ino;
	private int gno;
	private String imagepath;
	
	private String ifmain;
}
