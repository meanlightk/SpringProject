package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	


	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload form");
	}
	
	 @GetMapping("/uploadAjax") 
	 public void uploadAjax() {
	 
		 log.info("upload ajax"); 
	 }
	
	 
	
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("update ajax post.....");
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		// make folder ---------
		File uploadPath = new File(uploadFolder, uploadFolderPath);  //연월일 폴더 경로 생성
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {                      //해당 연월일 경로가 없으면
			uploadPath.mkdirs();                                //해당 경로에 폴더를 만든다. 
		}
		//make yyyy/MM/dd folder
		
		
		for(MultipartFile multipartFile: uploadFile) {
			
			log.info("-----------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();                             //첨부파일은 randomUUID를 이용해서 임의의 값을 생성할 수 있다.
																		
			uploadFileName = uuid.toString() + "_" + uploadFileName;	// 생성된 값은 원래의 파일 이름과 구분할 수 있도록 중간에 '_'를 추가할 수 있음
			
			//File saveFile = new File(uploadFolder, uploadFileName);   
			
			try {
				
				File saveFile = new File(uploadPath, uploadFileName);         //연월일경로에 파일이름으로 최종 경로 생성
				multipartFile.transferTo(saveFile);                       //파일을 최종 경로로 이동
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				// 만일 이미지 타입이라면 섬네일을 생성하도록 한다.
				//check image type file
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);
					//FileOutputStream :데이터를 파일에 바이트 스트림으로 저장
					//File 클래스는 파일과 디렉터리를 다룸. 그래서 File 인스턴스는 파일일 수도 있고 디렉터리 일수도 있다.
					//File(String parent, String child) - parent 폴더 경로의 child라는 파일에 대한 File 객체 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				//add to List
				list.add(attachDTO);
				
			}catch(Exception e) {
				e.printStackTrace();
			}//end catch
		}//end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//연.월.일 폴더를 만드는 함수
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	

	

}
