package com.yourplace.admin.banner.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.admin.banner.dao.BannerDAO;
import com.yourplace.admin.banner.vo.BannerVO;
import com.yourplace.commons.awss3.AwsS3;


@Service("uploadService")
public class UploadServiceImpl implements UploadService {
	
	@Autowired
	private BannerDAO bannerDAO;
	
	@Override
	public String uploadFile(MultipartHttpServletRequest Request, int bannerNum) {
		
		List<MultipartFile> fileList = Request.getFiles("file");
		
		String uploadPath = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/";
		String rst = "";
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = ""; //파일 경로 + 명
		String contentType=""; //파일 타입
		long contentLength=0l; //파일 크기
		
		int i = 1;
		
		for(MultipartFile mf : fileList) {
			
			try {
				
				InputStream is = mf.getInputStream();
				
				String originalFileName = mf.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				//s3 서버에 업로드될 경로
				key = "banner/" + bannerNum + "/" + i + "." + ext;
				rst = uploadPath + key + " ";
				contentType = mf.getContentType();
				contentLength = mf.getSize();
				
				awsS3.upload(is, key, contentType, contentLength);
				
				BannerVO vo = new BannerVO();
				vo.setOriginalFileName(originalFileName);
				vo.setS3FileName(key);
				
				bannerDAO.insertUploadImg(vo);
				i++;
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return "upload file done";
	}

}
