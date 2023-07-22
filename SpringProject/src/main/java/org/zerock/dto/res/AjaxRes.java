package org.zerock.dto.res;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Builder
public class AjaxRes {
	private String status;
	private String message;
	private Object data;
}
