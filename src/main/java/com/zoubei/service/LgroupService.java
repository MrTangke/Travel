package com.zoubei.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneGroup;
import com.zoubei.entity.scene.SceneType;

public interface LgroupService {

	/**
	 * 查询商家是否存在   通过statusId状态id  返回1表存在
	 */
	String selectGroupByNnameSid(HttpServletRequest request, HashMap<String, Object> map);

	/**
	 * 查询所有景点商家
	 */
	List<SceneGroup> selectSceneGroupList();

	/**
	 * 根据Id查询制定景点商家
	 */
	SceneGroup selectSceneGroupBySid(int sgpId);
	
	/**
	 * 查询商家管理的地区的景点列表
	 */
	List<Scene> selectSceneByGid(Integer areaId);

	/**
	 * 查询商家管理的地区的AreaList集合
	 */
	List<Area> selectAreaListBySgpId(Integer sgpid);
	/**
	 *  查询出所有的景点类型list集合
	 */
	List<SceneType> selectSceneType();
	/**
	 *  后台进行添加景点数据库
	 */
	String insertSceneBySgpid(Scene scene);

	//根据选择的ids进行导出相应的数据
	String exportExcel(HttpServletRequest request, HttpServletResponse response, String ids);

	//导入excel
	String SceneImportExcel(HttpServletRequest request, MultipartFile excelfile);

}
