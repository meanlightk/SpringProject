package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@RequestMapping("/")
@Controller
@Log4j
public class CommonController {

	@RequestMapping("/")
	public String main() {
		return "redirect:/home";
	}

	@RequestMapping("/home")
	public String mainPage() {
		return "home";
	}

	@RequestMapping("/list")
	public String goodslist() {
		return "itemlist";
	}

	@RequestMapping("/list/goods")
	public String goods() {
		return "item";
	}

	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("/blogs")
	public String bloglist() {
		return "blogs";
	}

	@RequestMapping("/blogs/blog")
	public String blog() {
		return "blog";
	}

	@GetMapping("/login")
	public String loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		return "/customlogin";
	}

	@GetMapping("/review/form")
	public String reviewForm() {
		return "/review/form";
	}

	@RequestMapping("/sample/member")
	public String membersample() {
		return "/sample/member";
	}

	@RequestMapping("/test")
	public String test() {
		return "test";
	}



	// 서머노트 이미지 업로드 temp폴더에 저장
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		String realPath ="";  //저장루트
		
		// ajax를 위한 Map 생성
		Map<String, String> ajax = new HashMap<String, String>();
		
		// 이미지 파일이 저장될 경로 설정
		String contextRoot = realPath + "/upload_image/image/fileupload/29/";
		String fileRoot = contextRoot;

		// 업로드된 파일의 원본 파일명과 확장자 추출
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		// 새로운 파일명 생성 (고유한 식별자 + 확장자)
		String savedFileName = UUID.randomUUID() + extension;

		// 저장될 파일의 경로와 파일명을 나타내는 File 객체 생성
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			// 업로드된 파일의 InputStream 얻기
			java.io.InputStream fileStream = multipartFile.getInputStream();

			// 업로드된 파일을 지정된 경로에 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile);

			// 이미지 URL과 응답 코드 추가
			ajax.put("url", "/upload_image/image/fileupload/29/" + savedFileName);
			ajax.put("responseCode", "success");
		} catch (IOException e) {
			// 파일 저장 중 오류가 발생한 경우 해당 파일 삭제 및 에러 응답 코드 추가
			FileUtils.deleteQuietly(targetFile);
			ajax.put("responseCode", "error");
			e.printStackTrace();
		}
		return ajax;
	}
}
