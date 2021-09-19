package com.yourplace.host.regist.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.host.regist.dao.RegistPlaceDAO;
import com.yourplace.host.regist.service.UploadFileService;
import com.yourplace.host.regist.vo.PlaceImgVO;
import com.yourplace.host.regist.vo.PlaceVO;

@Service("uploadFileService")
public class UploadFileServiceImpl implements UploadFileService {
	
	@Autowired
	private RegistPlaceDAO registPlaceDAO;
	
	//이미지 저장 경로 문자열로 리턴.
	@Override
	public String upload(MultipartHttpServletRequest mtfRequest,String hostId,int seq,String category,String placeTitle) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		MultipartFile thumbMf = fileList.get(0);
		String uploadPath = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/";
		String rst = "";
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = "";//업로드될 파일 경로 + 명.
		String contentType="";//업로드될 파일 타입.
		long contentLength=0l; //업로드될 파일 크기.
		int i = 1;
		for(MultipartFile mf : fileList) {
			try {
				InputStream is = mf.getInputStream();
				//원본 파일명.
				String originalFileName = mf.getOriginalFilename();
				//확장자
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				//s3 서버에 업로드될 경로
				key = "place/"+hostId+"/"+seq+"/"+i + "." + ext;
				rst = uploadPath + key + " ";
				contentType = mf.getContentType();
				contentLength = mf.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				PlaceImgVO imgVO = new PlaceImgVO();
				imgVO.setPlaceNum(seq);
				imgVO.setOriginalFileName(originalFileName);
				imgVO.setS3FileName(key);
				registPlaceDAO.setPlaceImg(imgVO);
				i++;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//썸네일 이미지 파트. 업로드한 사진의첫번째가 썸네일이 된다.
		imageResizing(thumbMf, awsS3,hostId,seq);
		return null;
	}
	
	public void imageResizing(MultipartFile mf,AwsS3 awsS3,String hostId, int curSeq) {
		String originalFileName = mf.getOriginalFilename();
		String fileType = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		File file = new File(originalFileName);
		try {
			mf.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int dw = 450;
		int dh = 300;
		// 저장된 원본파일로부터
		// BufferedImage 객체를
		// 생성합니다.
		BufferedImage srcImg;
		try {
			srcImg = ImageIO.read(file);
			// 원본 이미지의 너비와 높이 입니다.
			int ow = srcImg.getWidth();
			int oh = srcImg.getHeight();
			// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
			int nw = ow;
			int nh = (ow * dh) / dw;
			// 계산된 높이가 원본보다 높다면 crop이 안되므로 // 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
			if (nh > oh) {
				nw = (oh * dw) / dh;
				nh = oh;
			}
			// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
			BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);
			// crop된 이미지로 썸네일을 생성합니다.
			BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
			// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
			String key = "thumbnail/"+hostId+"/"+curSeq+"/ThumbImg."+fileType;

			awsS3.uploadBufferedImageToServer(destImg, key, fileType);
			PlaceVO tbVO = new PlaceVO();
			tbVO.setPlaceNum(curSeq);
			tbVO.setPlaceThumb(key);
			registPlaceDAO.updateThumb(tbVO);

		}catch (NullPointerException ne) {
			// TODO Auto-generated catch block
			ne.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
