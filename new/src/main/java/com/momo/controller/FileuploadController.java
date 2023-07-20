package com.momo.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momo.service.FileuploadService;
import com.momo.vo.FileuploadVo;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
public class FileuploadController extends CommonRestController {

	
	
	@GetMapping("/file/fileupload")
	public String fileupload() {

		return "/file/fileupload";
	}

	private static final String ATTACHES_DIR = "C:\\upload\\";

	/**
	 * ! 오류가 발생할 수 있는 경우 !
	 * 
	 * 전달된 파일이 없는 경우 - NullPointerException 발생 가능
	 * 
	 * enctype = "multipart/form/data" 오타
	 * 
	 * 설정이 안되었을 때 - 라이브러리 추가 - bean 객체 추가
	 * 
	 * @param files
	 * @return
	 */
	@PostMapping("/file/fileuploadAction")
	public String fileAction(List<MultipartFile> files, int bno, RedirectAttributes rttr) {

		// 주석주석
//		int insertRes = 0;
//
//		// list 를 돌면서 file 이라는 이름으로 출력..
////		files.forEach(file -> {
//
//		for (MultipartFile file : files) {
//
//			// file 이 없지 않으면 <<..
//			if (file.isEmpty()) {
//
//				continue;
//			}
//
//			log.info("==========================================");
//			log.info("oFileName : " + file.getOriginalFilename());
//			log.info("name : " + file.getName());
//			log.info("size : " + file.getSize());
//
//			try {
//
//				// UUID
//				/**
//				 * 소프트웨어 구축에 쓰이는 식별자 표준 파일이름이 중복되어 파일이 소실될 위험을 방지한다.
//				 */
//
//				UUID uuid = UUID.randomUUID();
//
//				String saveFileName = uuid + "_" + file.getOriginalFilename();
//
//				// 파일경로 지정
//				// [경로 + 식별자 + 파일이름]
//				String uploadPath = getFolder();
//				// dir
//				// c:/upload/2023/7/18/
//				// 년/월/일
//				File sFile = new File(ATTACHES_DIR + uploadPath + saveFileName);
//				// file(원본파일) sFile(저장 대상 파일)에 저장
//				file.transferTo(sFile);
//
//				FileuploadVo vo = new FileuploadVo();
//
//				// 주인 파일의 Mime유형
//				String contentType = Files.probeContentType(sFile.toPath());
//
//				// Mime 타입을 확인하여 이미지인 경우 썸네일 생성
//				if (contentType != null && contentType.startsWith("image")) {
//					// 썸네일 생성
//					vo.setFiletype("I");
//
//					String thumbnail = ATTACHES_DIR + uploadPath + "s_" + saveFileName;
//
//					// 썸네일 생성
//					// 원본파일, 크기, 저장될 경로
//
//					Thumbnails.of(sFile).size(100, 100).toFile(thumbnail);
//
//				} else {
//
//					vo.setFiletype("F");
//
//				}
//
//				vo.setBno(bno);
//				vo.setFilename(file.getOriginalFilename());
//
//				vo.setUploadpath(uploadPath);
//				vo.setUuid(uuid.toString());
//
//				int res = service.insert(vo);
//
//				if (res > 0) {
//
//					insertRes++;
//				}
//
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
////		});
//		}

		int insertRes = fileupload(files, bno);

		String msg = insertRes + "건 저장 되었습니다";
		rttr.addAttribute("msg", msg);

		return "redirect:/file/fileupload";

	}

	
	@PostMapping("/file/fileuploadActionFetch")
	public @ResponseBody Map<String, Object> fileActionFetch(List<MultipartFile> files
						, int bno) {

		log.info("fileActionFetch 실행 =============================================================");
		
		int insertRes = fileupload(files, bno);
		
		log.info("업로드건수 : " + insertRes);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map = responseMapMsg(REST_SUCCESS, insertRes + "건 저장 되었습니다");
		 
		System.out.println("============================================ map : " + map );
		 
		return map;
	}

	@Autowired
	FileuploadService service;

	/**
	 * ResponseBody << json 형식으로 반환 할 수 있도록 반환타입 앞에 어노테이션 작성 필.
	 * 
	 * @param bno
	 * @return
	 */
	@GetMapping("file/list/{bno}")
	public @ResponseBody Map<String, Object> fileuploadList(@PathVariable("bno") int bno) {

		System.err.println("file/list 실행 =============================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.getList(bno));

		return map;
	}

	/**
	 * 경로 생성 메서드 중복 방지용 업로드 날짜를 폴더 이름으로 사용
	 * 
	 * @return
	 */
	public String getFolder() {

		LocalDate currentDate = LocalDate.now();

		String uploadPath = currentDate.toString().replace("-", File.separator) + File.separator;

		log.info("CurrentDate : " + currentDate);
		log.info("경로 : " + uploadPath);

		File saveDir = new File(ATTACHES_DIR + uploadPath);

		if (!saveDir.exists()) {
			if (saveDir.mkdirs()) {

				log.info("경로생성 ====================");
			} else {
				log.info("경로생성실패 ========================");
			}
		}
		;

		return uploadPath;

	}

	public static void main(String[] args) {

		LocalDate currentDate = LocalDate.now();
		String uploadPath = currentDate.toString().replace("-", File.separator) + File.separator;

		log.info("CurrentDate : " + currentDate);
		log.info("경로 : " + uploadPath);
	}

	
	
	public int fileupload(List<MultipartFile> files, int bno) {

		int insertRes = 0;

		for (MultipartFile file : files) {

			// file 이 없지 않으면 <<..
			if (file.isEmpty()) {

				continue;
			}

			log.info("==========================================");
			log.info("oFileName : " + file.getOriginalFilename());
			log.info("name : " + file.getName());
			log.info("size : " + file.getSize());

			try {

				// UUID
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준 파일이름이 중복되어 파일이 소실될 위험을 방지한다.
				 */

				UUID uuid = UUID.randomUUID();

				String saveFileName = uuid + "_" + file.getOriginalFilename();

				// 파일경로 지정
				// [경로 + 식별자 + 파일이름]
				String uploadPath = getFolder();
				// dir
				// c:/upload/2023/7/18/
				// 년/월/일
				File sFile = new File(ATTACHES_DIR + uploadPath + saveFileName);
				
				// file(원본파일) sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);

				FileuploadVo vo = new FileuploadVo();

				// 주인 파일의 Mime유형
				String contentType = Files.probeContentType(sFile.toPath());

				// Mime 타입을 확인하여 이미지인 경우 썸네일 생성
				if (contentType != null && contentType.startsWith("image")) {
					// 썸네일 생성
					vo.setFiletype("I");

					String thumbnail = ATTACHES_DIR + uploadPath + "s_" + saveFileName;

					// 썸네일 생성
					// 원본파일, 크기, 저장될 경로

					Thumbnails.of(sFile).size(100, 100).toFile(thumbnail);

				} else {

					vo.setFiletype("F");

				}

				log.info("파일경로 ==================================================" + sFile);
				
				vo.setBno(bno);
				vo.setFilename(file.getOriginalFilename());

				vo.setUploadpath(uploadPath);
				vo.setUuid(uuid.toString());

				int res = service.insert(vo);

				if (res > 0) {

					insertRes++;
				}

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return insertRes;
	}
	
	@GetMapping("/file/delete/{uuid}/{bno}/{savePath}/{fileName}")
	public @ResponseBody Map<String, Object> delete(@PathVariable("uuid") String uuid
										,@PathVariable("bno") int bno
										,@PathVariable("savePath") String savePath
										,@PathVariable("fileName") String fileName){
		
		FileuploadVo vo = new FileuploadVo();
		vo.setUuid(uuid);
		vo.setBno(bno);
		
		int res = service.delete(vo);
		
		String msg = "";
		if(res > 0) {
			msg = "삭제되었습니다.";
		}else {
			msg = "삭제 중 오류 발생";
		}
		
		
		File file = new File(ATTACHES_DIR + fileName);
		
		System.out.println(ATTACHES_DIR + savePath);
		
		if(file.exists()) {
			if(file.delete()) {
				System.out.println("파일 삭제 성공 ! ! !");
			}else {
				System.out.println("파일 삭제 실패 ...............");
			}
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		
		return responseMapMsg(REST_SUCCESS, msg);
	}
	
	/**
	 * 파일 다운로드
	 * 		컨텐츠 타입을 다운로드 받을 수 있는 형식으로 지정하여 
	 * 		브라우저에서 파일을 다운로드 받을 수 있도록 처리한다.
	 * @param fileName
	 * @return
	 */
	@GetMapping("/file/download")
	public @ResponseBody ResponseEntity<byte[]> download(String fileName){
		
		log.info("download file : " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		
		File file = new File(ATTACHES_DIR + fileName);
		
		System.out.println("======================== " + ATTACHES_DIR + fileName);
		
		if(file.exists()) {
			// 컨텐츠 타입을 지정
			// APPLICATION_OCTET_STREAM
			headers.add("contentType"
						, MediaType.APPLICATION_OCTET_STREAM.toString());
			
			// 한글처리
			try {
			      headers.add("Content-Disposition"
			    		  ,	"attachment; filename=\""
			      + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			      
			      return new ResponseEntity<>(
			    		  	FileCopyUtils.copyToByteArray(file)
			    		  	, headers
			    		  	, HttpStatus.OK
			    		  );
			    } catch (UnsupportedEncodingException e) {
			      e.printStackTrace();
			      	return new ResponseEntity<>(
			      				HttpStatus.INTERNAL_SERVER_ERROR);			      
			    } catch (IOException e) {
			    	e.printStackTrace();
					// TODO Auto-generated catch block
			    	return new ResponseEntity<>(
		      				HttpStatus.INTERNAL_SERVER_ERROR);	
				}

		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
			
	}		
	
}