package com.zoubei.mapper.cate;

import com.zoubei.entity.cate.CateGroupRel;

public interface CateGroupRelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_cate_group_rel
     *
     * @mbggenerated Sun Apr 15 15:04:41 CST 2018
     */
    int insert(CateGroupRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_cate_group_rel
     *
     * @mbggenerated Sun Apr 15 15:04:41 CST 2018
     */
    int insertSelective(CateGroupRel record);

    //删除商家关联中间表
	void deleteByzhongjianCateId(Integer cateId);
}