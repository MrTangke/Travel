package com.zoubei.service;

import java.util.List;
import java.util.Map;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.cate.Foods;

/**
 * 
 * @项目名称：maven_travel  美食 食品表
 *
 * @author ： YXM
 *
 * @date : 2018年4月23日 上午8:03:46
 */
public interface FoodsService {

	//查询所有美食
	List<Foods> selectCateFoodsList();

	//通过地区id动态获取美食列表
	List<Foods> selectFoodByAreaId(Map<String, Object> map);

	//添加美食
	void insertFood(Cate cate, Foods foods);

	//查询回显食物
	Foods selectFoodByfoodId(Integer foodId);

	void updateFood(Foods food);

	//删除美食
	Integer deleteFood(Integer[] ids);

	//登录后的商家美食
	List<Foods> selectFoodByGroup(Integer cgpId);

}
