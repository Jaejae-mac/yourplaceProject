package com.yourplace.admin.banner.service;

import java.io.File;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UploadService {

	String uploadFile(MultipartHttpServletRequest Request, int seq);
	
}
