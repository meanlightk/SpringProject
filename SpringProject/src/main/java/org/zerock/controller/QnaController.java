package org.zerock.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.service.QnaService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/qna*")
@Controller
@Log4j
public class QnaController {
	
	@Autowired
	private QnaService service;

}