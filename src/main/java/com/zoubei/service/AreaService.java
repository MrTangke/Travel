package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.other.Area;

/**
 * 
 * @项目名称：maven_travel 地区表Service
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午2:29:37
 */
public interface AreaService {
	//根据景点id 查询景点的 市一级地址
	Area selectAreaBySceneId(Integer sceneId);

	//后台查询地址表
	List<Area> selectAreaList();

	void InsertAreaInfo(String areaNamef, String areaNamez);

	void InsertAreaInfoCit(Integer areaId, String areaNamez);

	//删除城市 + 地址
	Integer deleteAreaInfo(Integer areaId);

	Integer deleteAreaAll(Integer[] ids);

	List<Area> selectAreaListBySupperAll();
	//查询酒店区域
	List<Area> selectAreaByHotelId(Integer areaId);

	List<Area> selectAreaListByPid(Integer areaId);
	//获得酒店地址 通过酒店地址id
	Area selectHotelAreaByAreaId(Integer areaId);

	//获得所有城市地区
	List<Area> selectAreaListAll();

	//通过酒店地址Id查询地址表信息
	Area selectAreaByHotelAreaId(Integer areaId);

	//查询动态回显的美食地址下拉菜单回显
	Area selectFoodByAreaEcho(Integer areaPid, Integer areaId);

	//获得地区美食地址 通过店铺id
	Area selectAreaByFoodId(Integer cateId);

}
