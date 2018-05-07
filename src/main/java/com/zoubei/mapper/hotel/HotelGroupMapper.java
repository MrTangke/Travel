package com.zoubei.mapper.hotel;

import java.util.HashMap;

import com.zoubei.entity.hotel.HotelGroup;

public interface HotelGroupMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    int deleteByPrimaryKey(Integer hgpId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    int insert(HotelGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    int insertSelective(HotelGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    HotelGroup selectByPrimaryKey(Integer hgpId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    int updateByPrimaryKeySelective(HotelGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_hotel_group
     *
     * @mbggenerated Sun Apr 15 15:09:56 CST 2018
     */
    int updateByPrimaryKey(HotelGroup record);

    
    
    //方法
	HotelGroup selectHotelGroupByNnamePasd(HashMap<String, Object> map);
}