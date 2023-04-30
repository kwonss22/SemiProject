package com.travelez.app.plan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.plan.dto.LikeDTO;
import com.travelez.app.plan.dto.PlanCommentDTO;
import com.travelez.app.plan.dto.PlanDTO;
import com.travelez.app.plan.dto.PlanParam;
import com.travelez.app.plan.service.PlanCommentService;
import com.travelez.app.plan.service.PlanService;
import com.travelez.app.plan.util.FileUtil;

/**
 * 여행 플랜 게시판
 * @author 백해운
 */

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	private PlanService pService;
	
	@Autowired
	private  PlanCommentService pCService;

	// 리스트
	@GetMapping("/list.do")
	public String list(Model model, PlanParam param) {
		
		// RNum은 1부터 6까지로 설정
		int pn = param.getPageNumber();
		int start = 1 + (pn * 6);
		int end = (pn +1) * 6;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<PlanDTO> list = pService.list(param);
		
		// 총 게시글 수
		int totalPostCount = pService.getPostCount(param);
		
		// 총 게시글 수에 따른 페이지 수 구하기
		int totalPages = totalPostCount / 6;
		
		// 게시글 수가 6개 미만일 때는 페이지 수를 1로 고정
		// else, 6으로 나눈 나머지가 0이 아닐 때에는 기존 페이지 값에 +1
		if(totalPages == 0) {
			totalPages = 1;
		} else if(totalPages % 6 != 0) {
			totalPages = totalPages + 1;
		}
		
		if(param.getCategory() == null || param.getCategory().equals("") || param.getSearch() == null || param.getSearch().equals("")) {
			param.setCategory("All");
			param.setSearch("");
		}
		
		// view로 보내기
		model.addAttribute("planList", list);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", param.getPageNumber());
		model.addAttribute("category", param.getCategory());
		model.addAttribute("search", param.getSearch());
		
		return "plan/planList";
	}
	
	// 게시글 상세
	@GetMapping("/planDetail.do")
	public String getDetail(HttpServletRequest req, Model model, LikeDTO likeDto, int tpSeq) {
		MemberDto memberDto = (MemberDto) req.getSession().getAttribute("login");
		
		// 해당 글의 댓글 수 가져오기
		int commentCount = pCService.commentCount(tpSeq);
		
		// 상세 가져오기
		PlanDTO planDTO = pService.getDetail(tpSeq);
		
		// 좋아요 클릭한 이력이 있는지 체크
		likeDto.setTpId(memberDto.getTeId());
		int likeCheck = pService.likeCheck(likeDto);
		
		// 해당 게시글 좋아요 수
		int countLike = pService.countLike(tpSeq);
		
		// 댓글 리스트
		List<PlanCommentDTO> commentList = pCService.commentList(tpSeq);
		
		model.addAttribute("post", planDTO);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("likeCheck", likeCheck);
		model.addAttribute("commentList", commentList);
		model.addAttribute("countLike", countLike);
		return "plan/planDetail";
	}
	
	// 게시글 작성
	@GetMapping("/planWriteForm.do")
	public String planWriteForm() {
		return "plan/planWriteForm";
	};
	
	@PostMapping("/planWrite.do")
	public String planWrite(PlanDTO dto, HttpServletRequest req) throws Exception {
		
		String path = "/upload/plan";
		String fileName = FileUtil.upload(path, dto.getImage(), req);
		dto.setTpFileName(fileName);
		
		int count = pService.planWrite(dto);
		return count > 0 ? "redirect:/plan/list.do" : "실패";
	}
	
	// CKEditor를 이용한 이미지 업로드
	@ResponseBody
	@PostMapping("/fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/planImg"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/planImg/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}

			
		}
		
	}
	}
	
	// 게시글 수정
	@GetMapping("/planUpdateForm.do")
	public String updateForm(Model model, int tpSeq) {
		PlanDTO planDTO = pService.getDetail(tpSeq);
		model.addAttribute("dto",planDTO);
		return "plan/planUpdateForm";
	}
	
	// 게시글 수정 처리
	@PostMapping("/planUpdate.do")
	public String updatePlan(PlanDTO dto, int tpSeq, HttpServletRequest req) throws Exception {
		String path = "/upload/plan";
		
		String fileName = FileUtil.upload(path, dto.getImage(), req);
		dto.setTpFileName(fileName);
		
		int count = pService.planUpdate(dto);
		
		FileUtil.remove(FileUtil.getRealPath("", dto.getDeleteImage(), req));
		
		Thread.sleep(500);
		return count > 0 ? "redirect:/plan/planDetail.do?tpSeq="+tpSeq : "실패";
	}
	
	// 게시글 삭제 처리
	@GetMapping("/planDelete.do")
	public String planDelete(int tpSeq) {
		int count = pService.planDelete(tpSeq);
		return count > 0 ? "redirect:/plan/list.do" : "실패";
	}
	
	// 좋아요 반영
	@ResponseBody
	@GetMapping(value="/planLike.do", produces="application/text;charset=UTF-8")
	public String like(LikeDTO dto) {
		pService.likeUp(dto);
		pService.plusLike(dto.getTpSeq());
		return "좋아요가 반영 되었습니다.";
	}
	
	// 좋아요 취소
	@GetMapping(value="/unLike.do", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String unLike(LikeDTO dto) {
		pService.likeDel(dto);
		pService.minusLike(dto.getTpSeq());
		return "좋아요가 취소 되었습니다.";
	}
	
	
		
}

