package o2.controller;

import java.io.File;
import java.util.List;

import o2.data.member_dto;
import o2.data.qna_dto;
import o2.data.qna_reply_dto;
import o2.service.member_service_imple;
import o2.service.qna_service_imple;
import o2.util.FileWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class admin_controller {
	@Autowired
	member_service_imple m_service;
	
	@Autowired
	qna_service_imple q_service;
	
	@RequestMapping("/member/adminPage.do")
	public String adminPage() {
		return "/o2_admin/admin_list";
	}
	
	@RequestMapping("/member/admin_user_page.do")
	public String admin_user_page() {
		return "/o2_admin/admin_user_page";
	}
	
	@RequestMapping("/member/admin_qna_page.do")
	public String admin_qna_page() {
		return "/o2_admin/admin_qna_page";
	}

	@RequestMapping(value="/member/userList.do", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody List<member_dto> getList(@RequestParam(value="keyword", defaultValue="") String keyword,
												  @RequestParam String preItems,
												  @RequestParam String items) throws Exception {
		return m_service.user_list(keyword, preItems, items);
	}
	
	@RequestMapping(value="/member/userContent.do", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody member_dto getContent(@RequestParam String num) throws Exception {
		return m_service.user_dto(num);
	}
	
	@RequestMapping(value="/member/userUpdate.do", method=RequestMethod.POST)
	@CrossOrigin
	public @ResponseBody void userUpdate(@RequestBody member_dto dto) throws Exception {
		System.out.println(dto.getUser_type());
		m_service.update_member_admin(dto);
	}
	
	@RequestMapping(value="/member/upload.do",consumes = {"multipart/form-data"},method=RequestMethod.POST)
	@CrossOrigin
	public @ResponseBody String getFileUpload(MultipartHttpServletRequest req,
											 @RequestBody MultipartFile uploadFile)
	{
		String path=req.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		FileWriter sfw=new FileWriter();
		sfw.writeFile(uploadFile, path,
				uploadFile.getOriginalFilename());	
		return "success";
	}
	
	@RequestMapping(value="/member/userDelete.do", method=RequestMethod.DELETE)
	@CrossOrigin
	public @ResponseBody void userDelete(@RequestParam String num) throws Exception{
		m_service.delete_member(m_service.user_dto(num).getId());
	}
	
	@RequestMapping(value="/qna/qnaList.do", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody List<qna_dto> qna_get_List(@RequestParam String preItems,
												    @RequestParam String items) throws Exception {
		return q_service.admin_qna_list(preItems, items);
	}
	
	@RequestMapping(value="/qna/qnaContent.do", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody qna_dto qna_get_Content(@RequestParam String num) throws Exception {
		return q_service.admin_qna_dto(num);
	}
	
	@RequestMapping(value="/qna/qna_review_in.do", method=RequestMethod.POST)
	@CrossOrigin
	public @ResponseBody void qna_review_in(@RequestBody qna_reply_dto qr_dto) throws Exception {
		System.out.println(qr_dto.getContent());
		System.out.println(qr_dto.getId());
		System.out.println(qr_dto.getQ_num());
		q_service.qna_reivew_insert(qr_dto);
	}
	
	@RequestMapping(value="/qna/qna_review_List.do", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody List<qna_reply_dto> qna_review_get_List(@RequestParam String q_num) throws Exception {
		return q_service.qna_reivew_list(q_num);
	}
	
	@RequestMapping(value="/qna/qna_review_Delete.do", method=RequestMethod.DELETE)
	@CrossOrigin
	public @ResponseBody void qna_review_del(@RequestParam String num) throws Exception{
		System.out.println("삭제 넘" + num);
		q_service.qna_reivew_delete(num);
	}
}
