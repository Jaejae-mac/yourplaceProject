package com.yourplace.path;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/applicationContext.xml")
public class PathTest {
	@Test
	public void pathTest() {
		String os = System.getProperty("os.name").toLowerCase();
		String rootPath = System.getProperty("user.dir");
		String arr[] = {"src","main","resources","config","key.json"};
		String sep = File.separator;
		System.out.println(File.separator);
		System.out.println(os);
		System.out.println(rootPath);
		///Users/jaejaean/Desktop/KGitBankWebDev/MySpring/yourplace/src/main/resources/config/key.json
		JSONParser parser = new JSONParser();
		Reader reader;
		try {
			String path = rootPath;
			for(String t : arr) {
				path += (sep+t);
			}
			System.out.println(path);
			reader = new FileReader(path);
			JSONObject jsonObject = (JSONObject) parser.parse(reader);
			String accessKey = (String)jsonObject.get("accessKey");
			String secretKey = (String)jsonObject.get("secretKey");
			
			System.out.println(accessKey);
			System.out.println(secretKey);
			System.out.println(String.valueOf(getClass().getResource("/config/key.json")));
			String realPath = String.valueOf(getClass().getResource("/config/key.json"));
			realPath = realPath.substring(5);
			System.out.println(realPath);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}
}
