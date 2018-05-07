package com.zoubei.mapper.tourist;

import java.util.List;

import com.zoubei.entity.tourist.TouristHotelEvaluateRel;

public interface TouristHotelEvaluateRelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    int deleteByPrimaryKey(Integer appraiseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    int insert(TouristHotelEvaluateRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    int insertSelective(TouristHotelEvaluateRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    TouristHotelEvaluateRel selectByPrimaryKey(Integer appraiseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    int updateByPrimaryKeySelective(TouristHotelEvaluateRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_hotel_evaluate_rel
     *
     * @mbggenerated Sun Apr 15 15:17:45 CST 2018
     */
    int updateByPrimaryKey(TouristHotelEvaluateRel record);

    //通过用户的id查询用户酒店评论
	List<TouristHotelEvaluateRel> selectHotelEvaluateByTouristId(
			Integer touristId);
}