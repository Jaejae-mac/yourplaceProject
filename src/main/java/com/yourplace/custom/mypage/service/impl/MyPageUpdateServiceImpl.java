package com.yourplace.custom.mypage.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageUpdateService;

@Service("MyPageUpdateService")
public class MyPageUpdateServiceImpl implements MyPageUpdateService {
	@Autowired
	private MyPageDAO mypageDAO;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Override
	public void updateUser(UserVO vo) {
		// 프로필 업로드
		
		MultipartFile mf = vo.getProfile();
		String Profile = mf.getOriginalFilename();
		
		if(Profile != "") {
			
			String fileType = Profile.substring(Profile.lastIndexOf(".") + 1);
			int userNum = vo.getUserNum();	
			File file = new File(Profile);
			try {
				mf.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			AwsS3 awsS3 = AwsS3.getInstance();
			int dw = 450;
			int dh = 450;
			BufferedImage srcImg;
			try {
				srcImg = ImageIO.read(file);
				int ow = srcImg.getWidth();
				int oh = srcImg.getHeight();
				int nw = ow;
				int nh = (ow * dh) / dw;
				if (nh > oh) {
					nw = (oh * dw) / dh;
					nh = oh;
				}
				BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);
				BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
				
				String key = "profile/guest/"+userNum +"/ThumbImg."+ fileType;
				
				awsS3.uploadBufferedImageToServer(destImg, key, fileType);
				vo.setUserProfileImg(key);
				mypageDAO.updateUser(vo);
			}catch (NullPointerException ne) {
				// TODO Auto-generated catch block
				ne.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else {
			mypageDAO.updateUser(vo);
		}
		
	}
	@Override
	public void updatePw(UserVO vo) {
		String password = vo.getUserPw();
		String encodePw = passEncoder.encode(password);
		vo.setUserPw(encodePw);
		mypageDAO.updatePw(vo);
	}
}
