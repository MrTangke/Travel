package com.zoubei.mapper.cate;

import com.zoubei.entity.cate.CateFoodRel;

public interface CateFoodRelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_cate_food_rel
     *
     * @mbggenerated Sun Apr 15 15:12:40 CST 2018
     */
    int insert(CateFoodRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_cate_food_rel
     *
     * @mbggenerated Sun Apr 15 15:12:40 CST 2018
     */
    int insertSelective(CateFoodRel record);

	CateFoodRel selectCateByzhongjian(Integer foodId);

	//删除美食中间白
	void deleteByFoodId(Integer foodId);
}