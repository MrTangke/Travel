package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.cate.Cate;

/**
 * 
 * @项目名称：maven_travel 美食店铺表 Service
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 上午8:35:27
 */
public interface CateService {

	//根据景点区域id 查询该区域美食商家 排行优先推荐销量高的美食商家 order by
	List<Cate> selectCateBySceneAreaId(Integer areaId);

	//通过城市id获得该城市美食
	List<Cate> selectCateList(Integer areaId);

	//添加美食店铺
	void insertCate(Cate cate);

	//ajax回显店铺
	Cate selectCateEchoByHotelId(Integer cateId);

	// 修改美食店鋪表
	void updateCateBy(Cate cate);

	//批量刪除美食店鋪
	Integer deleteCate(Integer[] ids);

	//获得所有的美食商家
	List<Cate> selectCateListAll();

	Cate selectCateByzhongjian(Integer foodId);

	//商家管理登录查询店铺
	List<Cate> selectCateByGroup(Integer cgpId);

	//添加商家和店铺关联
	void insertCate(Cate cate, Integer cgpId);

	//查询商家所有的店铺
	List<Cate> selectCateListAlls(Integer cgpId);


}
