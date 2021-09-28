package com.yourplace.admin.space.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.space.service.AllowSpaceService;
import com.yourplace.admin.space.service.DeleteSpaceService;
import com.yourplace.admin.space.service.SpaceListService;
import com.yourplace.admin.space.vo.SpaceVO;
import com.yourplace.commons.awss3.AwsS3;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceListService spaceList;
	
	@Autowired
	private DeleteSpaceService deleteSpaceService;
	
	@Autowired
	private AllowSpaceService allowSpaceService;
	
	
	//get과 동시에 장소승인 및 조회페이지 호출
	@GetMapping(value="/spaceList.mdo")
	public void spaceTable(Model model)
	{
		List<SpaceVO> list = spaceList.getSpaceList();
		System.out.println("[Controller] spaceTable getMapping 호출");
		model.addAttribute("spaceList", list);	
	}
	
	
	//장소 삭제
	@PostMapping(value="/deleteSpace.mdo")
	public String deleteSpace(@RequestParam("deleteSpace") int deleteSpace)
	{
		System.out.println("-----삭제할 장소번호 조회-----");
		System.out.println("Parameter Value: " + deleteSpace + "번 장소");
	
		//url 조회 후, s3 서버에서 삭제
		//현재 aws s3 서버 access denied error : 삭제 불가
		AwsS3 awsS3 = AwsS3.getInstance();
		List<SpaceVO> list = deleteSpaceService.selectSpaceImgUrl(deleteSpace);
		System.out.println("-----삭제할 이미지 url 조회-----");
		
		for (int i=0; i < list.size(); i++)
		{
			System.out.println("key= " + (list.get(i)).getS3FileName());
			System.out.println("-----S3 서버에서 삭제 진행-----");
			awsS3.delete(list.get(i).getS3FileName()); // 등록된 모든 key 확인하며 삭제
		}
		
		//DB삭제
		deleteSpaceService.deleteSpace(deleteSpace);
		
		return "redirect:spaceList.mdo";
	}
	
	
	@PostMapping(value="/allowSpace.mdo")
	public String allowSpace(@RequestParam("allowSpace") String allowSpace)
	{
		System.out.println("------ 승인할  내용 -------");
		System.out.println("Parameter value: " + allowSpace);
		allowSpaceService.allowSpace(allowSpace);
		return "redirect:spaceList.mdo";
	}
	
	
	@PostMapping(value="/denySpace.mdo")
	public String denySpace(@RequestParam("denySpace") String denySpace)
	{
		System.out.println("------ 미승인할  내용 -------");
		System.out.println("Parameter value: " + denySpace);
		allowSpaceService.denySpace(denySpace);
		return "redirect:spaceList.mdo";
	}
	
	
}
