package com.yourplace.host.regist.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UploadFileService {
	//이미지 저장 경로 문자열로 리턴.
	String upload(MultipartHttpServletRequest mtfRequest,String hostId,int seq,String category, String placeTitle);
}
