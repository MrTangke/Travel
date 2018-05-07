package com.zoubei.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.cate.CateFoodRel;
import com.zoubei.entity.cate.Foods;
import com.zoubei.mapper.cate.CateFoodRelMapper;
import com.zoubei.mapper.cate.CateMapper;
import com.zoubei.mapper.cate.FoodsMapper;
import com.zoubei.service.FoodsService;
/**
 * 
 * @项目名称：maven_travel 美食 食品表实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月23日 上午8:04:36
 */
@Service
public class FoodsServiceImpl implements FoodsService {

	@Autowired(required = false)
	private FoodsMapper foodsMapper ;
	
	@Autowired(required = false)
	private CateMapper cateMapper ;

	//店铺食物中间表
	@Autowired(required = false)
	private CateFoodRelMapper cateFoodRelMapper ;
	/**
	 * 查询所有美食  并且为美食寻找店铺
	 */
	@Override
	public List<Foods> selectCateFoodsList() {
		// TODO Auto-generated method stub
		//查找所有的店铺美食   每个美食所属店铺
		List<Foods> list = foodsMapper.selecCateFoodsList();
		for (Foods foods : list) {
			Cate cate = cateMapper.selectCateByFoodsId(foods.getFoodId());
			foods.setCateShopname(cate.getCateShopname());
		}
		return list;
	}

	/**
	 * 通过地区id动态获取美食列表
	 */
	@Override
	public List<Foods> selectFoodByAreaId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Foods> list = foodsMapper.selectFoodByAreaId(map);
		//通过美食id -- 并循环获得店铺名称 赋值到美食店铺字段中  
		for (Foods foods : list) {
			Cate cate = cateMapper.selectCateByFoodsId(foods.getFoodId());
			foods.setCateShopname(cate.getCateShopname());
		}
		return list;
	}

	/**
	 * 添加美食
	 */
	@Override
	public void insertFood(Cate cate, Foods foods) {
		// TODO Auto-generated method stub
		foodsMapper.insertFood(foods);
		CateFoodRel catefoodRel = new CateFoodRel();
		catefoodRel.setCateId(cate.getCateId());
		catefoodRel.setFoodId(foods.getFoodId());
		cateFoodRelMapper.insertSelective(catefoodRel);
		
	}

	//查询回显食物
	@Override
	public Foods selectFoodByfoodId(Integer foodId) {
		// TODO Auto-generated method stub
		return foodsMapper.selectByPrimaryKey(foodId);
	}

	@Override
	public void updateFood(Foods food) {
		// TODO Auto-generated method stub
		foodsMapper.updateByPrimaryKeySelective(food);
	}

	//删除美食
	@Override
	public Integer deleteFood(Integer[] ids) {
		// TODO Auto-generated method stub
		Integer count = 0 ;
		for (Integer foodId : ids) {
			count += foodsMapper.deleteByPrimaryKey(foodId);
			cateFoodRelMapper.deleteByFoodId(foodId);
		}
		return count;
	}

	//登录后的商家美食
	@Override
	public List<Foods> selectFoodByGroup(Integer cgpId) {
		// TODO Auto-generated method stub
		List<Foods> list = foodsMapper.selectFoodByGroup(cgpId);
		//通过美食id -- 并循环获得店铺名称 赋值到美食店铺字段中  
		for (Foods foods : list) {
			Cate cate = cateMapper.selectCateByFoodsId(foods.getFoodId());
			foods.setCateShopname(cate.getCateShopname());
		}
		return list;
	}

	
	
	
	
	
}
