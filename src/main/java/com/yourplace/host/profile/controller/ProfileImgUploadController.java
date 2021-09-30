package com.yourplace.host.profile.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yourplace.commons.awss3.AwsS3;

@RequestMapping(value = "uploadImg.hdo", method = RequestMethod.POST)
public class ProfileImgUploadController {

	private AwsS3 s3;
	
	@RequestMapping(value="/getImg.hdo")
	public void upload()throws Exception{
	
	}
	
}
