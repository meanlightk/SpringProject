package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.Common;
import org.zerock.domain.Goods;
import org.zerock.domain.Review;
import org.zerock.service.GoodsService;
import org.zerock.service.ReviewService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@Log4j 
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@Autowired
	private ReviewService reviewService;

	
	@GetMapping("/list")
	public String showItemList(Model model) {
		log.info("show Admin List start...");
		
		List<Goods> goodsList = service.goodsList();
		model.addAttribute("goodsList", goodsList);
		
		return "/goods/goodsAdminList";
		
	}
	
	@GetMapping("/goods/search.do")
	public String searchList(Model model, Common common) {

		System.out.println(common);
		List<Goods> goodsList = service.getSearchGoodsList(common);
		model.addAttribute("goodsList", goodsList);

		return "searchlist";
	}

	
	@GetMapping("/showItem")
	public String showOneItem(Model model) {
		
		log.info("showOneItem start....");
		
		//Goods good = service.showOneItem(pno);
		
		//model.addAttribute("good", good);
		
		return "item";
	}	
	
	
	/*
	 * @GetMapping("/delete/${pno}") public String removeCart(@RequestParam("pno")
	 * int pno, Model model) {
	 * 
	 * 
	 * }
	 */
	/*@RequestParam("price") String price, @RequestParam("pname") String pname, @RequestParam("stock") int stock*/
//	@PostMapping(value = "/registerGoods", consumes = MediaType.APPLICATION_JSON_VALUE)	
	
//	public Goods registerGoods(@RequestParam("sellPrice") String  sellPrice,@RequestParam("originalPrice") String  originalPrice,@RequestParam("pname") String pname, @RequestParam("stock") String stock,
//			@RequestParam("skintype") String skintype, @RequestParam("category") String category, ) {
	@PostMapping("/registerGoods")	
	public String registerGoods(Goods goods, @RequestParam("uploadFile") MultipartFile[] uploadFile) {
		log.info("registerGoods");
		
		log.info(goods); 		
	
		goods.setStatus("1");
		
	

		List<Goods> list = new ArrayList<>();
		String uploadFolder = "C:\\upload\\main";

		System.out.println("占쎄땀揶쏉옙 獄쏆룇占� 占쎄맒占쎈�� 甕곕뜇�깈: ");
		String uploadFolderPath = String.format("%d", goods.getGno());

		
		
		

		// make folder ---------
		File uploadPath = new File(uploadFolder, uploadFolderPath); // �긽�뭹 踰덊샇濡� 寃쎈줈瑜� 留뚮벀
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) { // �빐�떦 �긽�뭹 �뤃�뜑媛� �뾾�쑝硫�
			uploadPath.mkdirs(); // �빐�떦 寃쎈줈�뿉 �뤃�뜑瑜� 留뚮뱺�떎.
		}
		// make gno folder

		for (MultipartFile multipartFile : uploadFile) {

			int i = 1;

			log.info("test : i" + i++);

			log.info("-----------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());



			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID(); // 泥⑤��뙆�씪�� randomUUID瑜� �씠�슜�빐�꽌 �엫�쓽�쓽 媛믪쓣 �깮�꽦�븷 �닔 �엳�떎.

			uploadFileName = uuid.toString() + "_" + uploadFileName; // �깮�꽦�맂 媛믪� �썝�옒�쓽 �뙆�씪 �씠由꾧낵 援щ텇�븷 �닔 �엳�룄濡� 以묎컙�뿉 '_'瑜� 異붽��븷 �닔 �엳�쓬

			// File saveFile = new File(uploadFolder, uploadFileName);

			try {

				File saveFile = new File(uploadPath, uploadFileName); // c:upload/main/{�긽�뭹 踰덊샇 �뤃�뜑}/�뙆�씪 �씠由꾩쑝濡� 理쒖쥌 寃쎈줈 �깮�꽦
				multipartFile.transferTo(saveFile); // �뙆�씪�쓣 理쒖쥌 寃쎈줈濡� �씠�룞

				int gno2 = goods.getGno();
				goods.setUuid(uploadFileName);
				goods.setImagepath(uploadFolderPath + "/" + uploadFileName);
				

				//service.updateFilePath(goods);
				list.add(goods);

				// 留뚯씪 �씠誘몄� ���엯�씠�씪硫� �꽟�꽕�씪�쓣 �깮�꽦�븯�룄濡� �븳�떎.
				// check image type file
				if (checkImageType(saveFile)) {
					// FileOutputStream :�뜲�씠�꽣瑜� �뙆�씪�뿉 諛붿씠�듃 �뒪�듃由쇱쑝濡� ���옣
					// File �겢�옒�뒪�뒗 �뙆�씪怨� �뵒�젆�꽣由щ�� �떎猷�. 洹몃옒�꽌 File �씤�뒪�꽩�뒪�뒗 �뙆�씪�씪 �닔�룄 �엳怨� �뵒�젆�꽣由� �씪�닔�룄 �엳�떎.
					// File(String parent, String child) - parent �뤃�뜑 寃쎈줈�쓽 child�씪�뒗 �뙆�씪�뿉 ���븳 File 媛앹껜 �깮�꽦
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();

					goods.setUuid(uuid.toString());	
				}

			} catch (Exception e) {
				e.printStackTrace();
			} // end catch
		} // end for

		
		
		
		//Goods goods = new Goods();
		
			/*
			 * int gno = service.getGno() + 1; System.out.println("占쎄땀揶쏉옙 癰귣�沅� gno:" + gno);
			 * goods.setGno(gno); goods.setPname(pname); goods.setStock(stock2); int
			 * realprice = Integer.parseInt(price); // goods.setPrice(realprice);
			 */		 
		service.registerItem(goods); 
		 
		return "redirect:/goodsWrite/write";
		 
		 
	}
	
	@GetMapping("/registerGoods2")
	public String registerGoods2() {
		log.info("register goods");
		return "registerGoods";
	}
	
	@GetMapping("/goodsWrite/{type}")
	public String goodsWrite(Model model, @PathVariable("type") String type) {
		int gno = service.getGno();
		log.info(gno);
		model.addAttribute("type", type);
		model.addAttribute("gno", gno);
		log.info("goods write");
		return "/goods/goodsWrite";
	}
	
	@PostMapping("/search")	
	public String search(Common common) {
		
		
		return "search";
	} 

	
	private String fileUpload() {
		
		return null;
	}
	
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	
	@GetMapping("/goodsDetail/{gno}")
	public String goodsDetail(Model model, Common common, @PathVariable("gno") int gno) {
		log.info("goods detail");

		Goods goods = service.showOneItem(gno);
		log.info("肄섑뀗痢�"+goods.getContent());
//		String optionList = goods.getOption_list();
//		String[] optionListAll = optionList.split("\n");
//		goods.setOption_list_split(optionListAll);
	
		List<Review> list = reviewService.getReviewList(common, gno);
		model.addAttribute("goods", goods);
		model.addAttribute("reviewList", list);

		return "detail";
	}
}
