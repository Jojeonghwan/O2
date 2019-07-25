package o2.controller;

import java.io.File;
import java.util.List;

import o2.data.member_dto;
import o2.service.member_service_imple;
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
	
	@RequestMapping("/member/adminPage.do")
	public String adminPage() {
		return "/o2_admin/admin_list";
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
		m_service.update_member(dto);
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
}
