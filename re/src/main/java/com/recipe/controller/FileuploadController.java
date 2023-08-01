package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.recipe.service.FileuploadService;
import com.recipe.service.ReplyService;
import com.recipe.vo.RecipeReplyVo;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileuploadController {

	public static final String ATTACHES_DIR = "C:\\upload\\";
	
	@Autowired
	FileuploadService service;
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping("file/list/{bno}")
	public @ResponseBody Map<String, Object> fileuploadList(@PathVariable("bno") int bno){
		
		System.err.println("file/list 실행 =============================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.getFileList(5));
		map.put("fileStepList", service.getRecipeStep(5));
		
		
		return map;
	}
	
	
//	
//	@PostMapping("/file/photoReview")
//	public @ResponseBody Map<String, Object> photoReviewUpload(List<MultipartFile> files
//											, int b_no
//											){
////		int b_no = 5;
//		System.out.println("/file/photoReview 실행 =====================================");
//		System.out.println(b_no + "======================================================");
//		
//		// 형변환
//		
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		
//		try {
//
//			int fileInsertRes = service.fileupload(files, b_no, );
//			System.out.println("업로드 결과 출력 ================================================ " +fileInsertRes);
//			
//			
//			if(fileInsertRes > 0) {
//				
//				map.put("result", "success");
//			
//			} else {
//			
//				map.put("result", "파일 업로드에 실패하였습니다 ....");
//				
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return map; 
//		
//	}
	
	
	
	
	@PostMapping("/file/photoReview_Test")
	public @ResponseBody Map<String, Object> uploadTest(List<MultipartFile> files
											,RecipeReplyVo vo
											){
		
		System.out.println("uploadTest 출력 =================================");
		
		
		System.out.println(vo.getStar());
		System.out.println(vo.getB_no());
		System.out.println(vo.getReply());
		System.out.println(vo.getWriter());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int res = replyService.replyWrite(vo);

			System.out.println("vo ===================== " + vo);
			
			 RecipeReplyVo replyVo = new RecipeReplyVo();
			 
			 if(res > 0) {
			 
				 service.fileupload(files, vo.getB_no(), vo.getR_no());

				 map.put("result", "success");
				 return map;
			 } else {
				 map.put("result", "fail");
			 }
		
		}catch (Exception e) {
			 map.put("result", "댓글 추가 및 사진추가 오류발생 오류발생 ==========");
		}
		
		return map;
	}
	
	
	
	
	
	@GetMapping("/display")
	// 이미지를 화면에 보여줍니다
	public ResponseEntity<byte[]> display(String fileName) {
		log.info("=====fileName : " + fileName);
		
		try {
			// 파일 객체를 생성
			File file = new File(ATTACHES_DIR + fileName);
			HttpHeaders headers = new HttpHeaders();
			
			// 이미지 파일이 존재하면 파일을 이미지를 다운로드
			if(file.exists()) {
				// Mime타입을 설정
				headers.add("Content-Type",Files.probeContentType(file.toPath()));
				return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
		} catch (IOException e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}

}
