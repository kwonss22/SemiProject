package com.travelez.app.myplan.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.myplan.dto.MyPlanDetailDto;
import com.travelez.app.myplan.dto.MyPlanDto;
import com.travelez.app.myplan.service.MyplanService;

@Controller
@RequestMapping("/member")
public class MyplanController {
	@Autowired
	MyplanService service;
	
	@GetMapping(value="myPlanListWrite.do")
	public String myPlanListWrite(Model model, MyPlanDto dto) {
		System.out.println("MyplanController myPlanListWrite" + new Date());
		boolean isS = service.addPlanList(dto);
		
		String message="";
		if(isS) {
			message="MYPLAN_LIST_ADD_OK";
		}else {
			message="MYPLAN_LIST_ADD_NO";
		}
		model.addAttribute("message", message);
		return "member/message";
	}
	
	@GetMapping(value = "myPlanList.do")
	public String mypage(Model model, String teId) {
		
		System.out.println("MemberController mypage" + new Date());
		
		MemberDto userInfo = service.userInfo(teId);
		List<MyPlanDto> myPlanList = service.myPlanList(teId);
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("myPlanList", myPlanList);
		
		return "member/myPlanList";
	}
	@GetMapping(value="myPlanWrite.do")
	public String myPlanWrite(Model model, int seq) {
		System.out.println("MemberController myPlanWrite" + new Date());
		
		MyPlanDto myPlan = service.myPlan(seq);
		model.addAttribute("myPlan", myPlan);
		
		return "member/myPlanWrite";
	}
	@GetMapping(value="myPlanWriteAf.do")
	public String myPlanWriteAf(Model model, MyPlanDetailDto dto) {
		System.out.println("MemberController myPlanWriteAf" + new Date());
		
		boolean isS = service.planWrite(dto);
		
		String message="";
		if(isS) {
			message="ADD_PLAN_OK";
		}else {
			message="ADD_PLAN_NO";
		}
		model.addAttribute("planSeq", dto);
		model.addAttribute("message", message);
		return "member/message";
	}
	@GetMapping(value="myPlanListUpdate.do")
	public String myPlanListUpdate(Model model, int seq) {
		
		System.out.println("MemberController myPlanListUpdate" + new Date());
		
		MyPlanDto myPlan = service.myPlan(seq);
		model.addAttribute("myPlan", myPlan);
		
		return "member/myPlanListUpdate";
		
	}
	@GetMapping(value="myPlanListUpdateAf.do")
	public String myPlanListUpdateAf(Model model, MyPlanDto dto) {
		System.out.println("MemberController myPlanListUpdateAf" + new Date());
		
		boolean isS = service.updatePlanList(dto);
		String message="";
		if(isS) {
			message="UPDATE_PLANLIST_OK";
		}else {
			message="UPDATE_PLANLIST_NO";
		}
		model.addAttribute("message", message);
		return "member/message";
		
	}
	@GetMapping(value="myPlanListDelete.do")
	public String myplanListDelete(Model model, int seq) {
		System.out.println("MemberController myplanListDelete" + new Date());
		
		boolean isS = service.deletePlanList(seq);
		
		String message="";
		if(isS) {
			message="DELETE_PLANLIST_OK";
		}else {
			message="DELETE_PLANLIST_NO";
		}
		model.addAttribute("message", message);
		return "member/message";
	}
	@GetMapping(value="myPlanDetail.do")
	public String myPlanDetail(Model model, int seq) {
		System.out.println("MemberController myPlanDetail" + new Date());
		
		List<MyPlanDetailDto> planDetailList = service.planDetailList(seq);
		MyPlanDto myPlan = service.myPlan(seq);
		
		model.addAttribute("planDetailList", planDetailList);
		model.addAttribute("myPlan", myPlan);
		
		return "member/myPlanDetail";
	}
	@GetMapping(value="myPlanUpdate.do")
	public String myPlanUpdate(Model model, int teDseq, int seq) {
		System.out.println("MemberController myPlanUpdate" + new Date());
		
		MyPlanDetailDto myPlanDetail = service.myPlanDetail(teDseq);
		MyPlanDto myPlan = service.myPlan(seq);
		
		model.addAttribute("myPlan", myPlan);
		model.addAttribute("myPlanDetail", myPlanDetail);
		
		return "member/myPlanUpdate";
	}
	@GetMapping(value="myPlanUpdateAf.do")
	public String myPlanUpdateAf(Model model, MyPlanDetailDto dto) {
		System.out.println("MemberController myPlanUpdateAf" + new Date());
		
		boolean isS=service.planUpdate(dto);
		
		String message = "";
		if(isS) {
			message = "UPDATE_PLAN_OK";
		} else {
			message = "UPDATE_PLAN_NO";
		}
		model.addAttribute("planSeq", dto);
		model.addAttribute("message", message);
		return "member/message";
	}
	@GetMapping(value="myPlanDelete.do")
	public String myPlanDelete(Model model, int teDseq, int seq) {
		System.out.println("MemberController myPlanDelete" + new Date());
		
		MyPlanDto myPlan = service.myPlan(seq);
		boolean isS=service.planDelete(teDseq);
		
		String message = "";
		if(isS) {
			message = "DELETE_PLAN_OK";
		} else {
			message = "DELETE_PLAN_NO";
		}
		model.addAttribute("myPlan", myPlan);
		model.addAttribute("message", message);
		return "member/message";
	}
	
}
