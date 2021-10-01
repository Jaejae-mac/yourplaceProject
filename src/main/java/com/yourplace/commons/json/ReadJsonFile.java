package com.yourplace.commons.json;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

//JSON 파일을 읽어오기 위한 클래스.
public class ReadJsonFile {
	//JSON 파일을 읽어들여 파싱하고, 리스트 객체에 값들을 추가후 키들을 리턴해준다.
	public List<String> parser(List<String> keys) throws IOException, ParseException{
		List<String> values = new ArrayList<String>();
		JSONObject jsonObject = getJsonFile();
		if(jsonObject != null) {
			for(String str : keys) {
				String key = (String) jsonObject.get(str);
				values.add(key);
			}
		}
		return values;
	}

	private JSONObject getJsonFile() {
		String rootPath = System.getProperty("user.dir");
		String arr[] = { "src", "main", "resources", "config", "key.json" };
		String sep = File.separator;
		String path = rootPath;
		// JSON-SIMPLE 라이브러리를 이용한다.
		JSONParser parser = new JSONParser();
		// IO 의 리더 클래스를 이용해 내 컴퓨터의 *.json을 가지는 파일을 읽어들인다.
		// .gitignore 에 포함되어 있는 파일이기 때문에 GITHUB에는 PUSH 되어 있지 않다.
		for (String t : arr) {
			path += (sep + t);
		}
		Reader reader;
		JSONObject jsonObject;
		try {
			String realPath = String.valueOf(getClass().getResource("/config/key.json"));
			realPath = realPath.substring(5);
			reader = new FileReader(realPath);
			//JSON 객체를 읽어들인다.
			jsonObject = (JSONObject) parser.parse(reader);
			return jsonObject;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
