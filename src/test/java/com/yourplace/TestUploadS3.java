package com.yourplace;

import java.io.File;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.yourplace.commons.awss3.AwsS3;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/applicationContext.xml")
public class TestUploadS3 {

	@Test
	public void insertProduct() {
		AwsS3 awsS3 = AwsS3.getInstance();
//		File file = new File("/Users/wldms/Pictures/mizz.jpg");
		String key = "img/exampletest02.png";
		String copyKey = "img/exampletestfile02_copy.png";
//		awsS3.upload(file, key);
//		awsS3.copy(key, copyKey);
//		awsS3.delete(copyKey);
//		awsS3.delete(key);
	}
}
