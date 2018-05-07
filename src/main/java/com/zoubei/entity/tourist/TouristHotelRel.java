package com.zoubei.entity.tourist;

import java.util.Date;
/**
 * 
 * @项目名称：maven_travel 酒店订单实体类
 *
 * @author ： YXM
 *
 * @date : 2018年4月25日 上午7:46:47
 */
public class TouristHotelRel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.thr_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private Integer thrId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private Integer touristId;
    private String touristNickname ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.hotel_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private Integer hotelId;
    private String hotelHotelname ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.thr_goaddress
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private String thrGoaddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.thr_date
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private Date thrDate;
    private String thrDates ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.thr_num
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private Integer thrNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_hotel_rel.thr_other
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    private String thrOther;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.thr_id
     *
     * @return the value of tra_tourist_hotel_rel.thr_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public Integer getThrId() {
        return thrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.thr_id
     *
     * @param thrId the value for tra_tourist_hotel_rel.thr_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setThrId(Integer thrId) {
        this.thrId = thrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.tourist_id
     *
     * @return the value of tra_tourist_hotel_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public Integer getTouristId() {
        return touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.tourist_id
     *
     * @param touristId the value for tra_tourist_hotel_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.hotel_id
     *
     * @return the value of tra_tourist_hotel_rel.hotel_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public Integer getHotelId() {
        return hotelId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.hotel_id
     *
     * @param hotelId the value for tra_tourist_hotel_rel.hotel_id
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.thr_goaddress
     *
     * @return the value of tra_tourist_hotel_rel.thr_goaddress
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public String getThrGoaddress() {
        return thrGoaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.thr_goaddress
     *
     * @param thrGoaddress the value for tra_tourist_hotel_rel.thr_goaddress
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setThrGoaddress(String thrGoaddress) {
        this.thrGoaddress = thrGoaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.thr_date
     *
     * @return the value of tra_tourist_hotel_rel.thr_date
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public Date getThrDate() {
        return thrDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.thr_date
     *
     * @param thrDate the value for tra_tourist_hotel_rel.thr_date
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setThrDate(Date thrDate) {
        this.thrDate = thrDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.thr_num
     *
     * @return the value of tra_tourist_hotel_rel.thr_num
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public Integer getThrNum() {
        return thrNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.thr_num
     *
     * @param thrNum the value for tra_tourist_hotel_rel.thr_num
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setThrNum(Integer thrNum) {
        this.thrNum = thrNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_hotel_rel.thr_other
     *
     * @return the value of tra_tourist_hotel_rel.thr_other
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public String getThrOther() {
        return thrOther;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_hotel_rel.thr_other
     *
     * @param thrOther the value for tra_tourist_hotel_rel.thr_other
     *
     * @mbggenerated Sun Apr 15 15:18:03 CST 2018
     */
    public void setThrOther(String thrOther) {
        this.thrOther = thrOther;
    }

	public String getTouristNickname() {
		return touristNickname;
	}

	public void setTouristNickname(String touristNickname) {
		this.touristNickname = touristNickname;
	}

	public String getHotelHotelname() {
		return hotelHotelname;
	}

	public void setHotelHotelname(String hotelHotelname) {
		this.hotelHotelname = hotelHotelname;
	}

	public String getThrDates() {
		return thrDates;
	}

	public void setThrDates(String thrDates) {
		this.thrDates = thrDates;
	}
}