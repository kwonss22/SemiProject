package com.travelez.app.play.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travelez.app.play.dto.PlayComment;
import com.travelez.app.play.dto.PlayDto;
import com.travelez.app.play.dto.PlayParam;
import com.travelez.app.play.service.PlayService;
import com.travelez.app.play.util.PlayUtil;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	PlayService service;

	@GetMapping(value = "play.do")
	public String playlist(PlayParam param, Model model) {
		
		int pn = param.getPageNumber();

		int start = 1 + (pn * 10);
		int end = (pn + 1) * 10;

		param.setStart(start);
		param.setEnd(end);

		List<PlayDto> list = service.playlist(param);// 검색 처리 된 리스트
		int len = service.getAllPlay(param); // 총 글 개수

		int pagePlay = len / 10; //
		if ((len % 10) > 0) {
			pagePlay = pagePlay + 1;
		}

		if (param.getChoice() == null || param.getChoice().equals("") || param.getSearch() == null
				|| param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}

		model.addAttribute("playlist", list);
		model.addAttribute("pagePlay", pagePlay);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());

		return "play/play";
	}

	
	@GetMapping(value = "playwrite.do")
	public String playwrite() {
		return "play/playwrite";
	}

	@PostMapping(value = "playwriteAf.do")
	public String pdsupload(Model model, PlayDto dto, HttpServletRequest req, // 파일(upload) 경로를 얻어 오기 위해
			@RequestParam(value = "fileload", required = false) // 실패시 재업로드 = false
			MultipartFile fileload) { // 다양한 데이터(binary 데이터 → file 데이터타입)

		// filename 취득 (원본파일명)
		String filename = fileload.getOriginalFilename();

		// (DB에 저장되는 파일명)
		dto.setpFilename(filename); // 원본 파일명 설정(DB에 넣기 위함)

		// upload의 경로 설정

		// server
		String fupload = "/Volumes/SAMSUNG/programming/tripEasy/travelez2/src/main/webapp/upload/play";

		// 파일명을 충돌되지 않는 명칭(Date)으로 변경 (ex)time.확장자명)
		String newfilename = PlayUtil.getNewFileName(filename);

		// 변경된 파일명 (실제로 올가가는 파일)
		dto.setpNewfilename(newfilename);

		File file = new File(fupload + "/" + newfilename);

		// io 소속
		try {
			// ※핵심※ 실제로 파일 생성 + 기입 = 업로드 되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());

			// db에 저장
			boolean isS = service.writeplay(dto);
			String msg = "OK";
			if (isS == false) {
				msg = "FAIL";
			}
			model.addAttribute("playwrite", msg);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "play/message";
	}


	@GetMapping(value = "playdetail.do")
	public String playdetail(Model model, int pSeq) {

		PlayDto play = service.getPlay(pSeq);

		service.upReadcount(pSeq);

		model.addAttribute("pdto", play);

		return "play/playdetail";
	}

	
	@GetMapping(value = "playupdate.do")
	public String playupdate(Model model, int pSeq) {

		PlayDto dto = service.getPlay(pSeq);

		model.addAttribute("pdto", dto);

		return "play/playupdate";
	}

	@PostMapping(value = "playupdateAf.do")
	public String playupdateAf(Model model, PlayDto dto, HttpServletRequest req,
			@RequestParam(value = "fileload", required = false) MultipartFile fileload) {
		
		String orginalFileName = fileload.getOriginalFilename();

		if (!fileload.isEmpty()) { // 파일이 변경 되었다면

			String newfilename = PlayUtil.getNewFileName(orginalFileName);

			dto.setpFilename(orginalFileName); 
			dto.setpNewfilename(newfilename);

			// 경로 취득
			String fupload = "/Volumes/SAMSUNG/programming/tripEasy/travelez2/src/main/webapp/upload/play";

			File file = new File(fupload + "/" + newfilename);

			try {
				// 새로운 파일로 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				// DB갱신
				boolean isS = service.updatePlay(dto);
				String msg = "OK";
				if (isS == false) {
					msg = "FAIL";
				}

				model.addAttribute("playupdate", msg);
				model.addAttribute("pSeq", dto.getpSeq());

			} catch (IOException e) {
				e.printStackTrace();
			}

		} else { // 파일이 변경되지 않았다면
			boolean isS = service.updatePlay(dto);
			String msg = "OK";
			if (isS == false) {
				msg = "FAIL";
			}

			model.addAttribute("playupdate", msg);
			model.addAttribute("pSeq", dto.getpSeq());

		}

		return "play/message";

	}
	

	@GetMapping(value = "playdelete.do")
	public String playdelete(Model model, int pSeq) {

		boolean isS = service.deletePlay(pSeq);

		String msg = "OK";
		if (isS == false) {
			msg = "FAIL";
		}

		model.addAttribute("playdelete", msg);

		return "play/message";
	}

	@PostMapping(value = "playCommentWriteAf.do")
	public String playCommentWriteAf(Model model, PlayComment dto) {

		boolean isS = service.pCommentWrite(dto);
		if (isS) {
			System.out.println("댓글작성 성공");
		} else {
			System.out.println("댓글작성 실패");
		}

		return "redirect:/play/playdetail.do?pSeq=" + dto.getpSeq();
	}

	@ResponseBody
	@GetMapping(value = "playCommentList.do")
	public List<PlayComment> playCommentList(int pSeq) {

		List<PlayComment> list = service.pCommentList(pSeq);

		return list;
	}

	@GetMapping(value = "cdelete.do")
	public String cdelete(Model model, int pAnswerSeq , int pSeq) {
		
		service.deleteComment(pAnswerSeq);
		
		return "redirect:/play/playdetail.do?pSeq=" + pSeq;
	}
	

}
