package com.yourplace.host.refund;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class refundController {
	
	public static final String KEY = "8698570682820935";
	public static final String SECRET = "cb21b339006bbc53d207e4dd308d435d31ed87ea2afc04225b1c7332f8257e63580436d3225f7875";
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";

	public String getImportToken() { //토큰 발급
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

private List<NameValuePair> convertParameter(Map<String, String> paramMap) { //http요청 파라미터
	List<NameValuePair> paramList = new ArrayList<NameValuePair>();
	Set<Entry<String, String>> entries = paramMap.entrySet();
	for (Entry<String, String> entry : entries) {
		paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
	}
	return paramList;
}
	
public int cancelPayment(String token, String mid) { //결제 취소
	HttpClient client = HttpClientBuilder.create().build();
	HttpPost post = new HttpPost("https://api.iamport.kr/payments/cancel");
	Map<String, String> map = new HashMap<String, String>();
	post.setHeader("Authorization", token);
	map.put("merchant_uid", mid);
	String asd = "";
	try {
		post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
		HttpResponse res = client.execute(post);
		ObjectMapper mapper = new ObjectMapper();
		String enty = EntityUtils.toString(res.getEntity());
		JsonNode rootNode = mapper.readTree(enty);
		asd = rootNode.get("response").asText();
	} catch (Exception e) {
		e.printStackTrace();
	}
	if (asd.equals("null")) {
		System.err.println("환불실패");
		return -1;
	} else {
		System.err.println("환불성공");
		return 1;
	}
}

}