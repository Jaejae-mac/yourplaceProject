/*
 * package com.yourplace.admin.revenue.service;
 * 
 * import org.json.simple.JSONArray; import org.json.simple.JSONObject; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.yourplace.admin.revenue.dao.RevenueDAO; import
 * com.yourplace.admin.revenue.vo.RevenueVO;
 * 
 * @Service("jsonListService") public class getListServiceImpl implements
 * getListService{
 * 
 * @Autowired private RevenueDAO revenueDAO;
 * 
 * @Override public JSONObject getJsonList() {
 * 
 * JSONObject successJObj = new JSONObject(); JSONArray successJArray = new
 * JSONArray();
 * 
 * successJObj.put("getList", revenueDAO.getList());
 * 
 * return successJObj;
 * 
 * }
 * 
 * 
 * 
 * }
 */