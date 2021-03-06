package com.zoubei.entity.tourist;

import java.util.Date;

public class TouristSceneOrderRel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.order_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Integer orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Integer touristId;
    //游客昵称
    private String touristNickname ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.scene_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Integer sceneId;
    private String sceneName ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.order_goaddress
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private String orderGoaddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.order_date
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Date orderDate;
    private String orderDates ;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.order_num
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Integer orderNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.status_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private Integer statusId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_scene_order_rel.order_other
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    private String orderOther;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.order_id
     *
     * @return the value of tra_scene_order_rel.order_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.order_id
     *
     * @param orderId the value for tra_scene_order_rel.order_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.tourist_id
     *
     * @return the value of tra_scene_order_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Integer getTouristId() {
        return touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.tourist_id
     *
     * @param touristId the value for tra_scene_order_rel.tourist_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.scene_id
     *
     * @return the value of tra_scene_order_rel.scene_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Integer getSceneId() {
        return sceneId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.scene_id
     *
     * @param sceneId the value for tra_scene_order_rel.scene_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setSceneId(Integer sceneId) {
        this.sceneId = sceneId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.order_goaddress
     *
     * @return the value of tra_scene_order_rel.order_goaddress
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public String getOrderGoaddress() {
        return orderGoaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.order_goaddress
     *
     * @param orderGoaddress the value for tra_scene_order_rel.order_goaddress
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setOrderGoaddress(String orderGoaddress) {
        this.orderGoaddress = orderGoaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.order_date
     *
     * @return the value of tra_scene_order_rel.order_date
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Date getOrderDate() {
        return orderDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.order_date
     *
     * @param orderDate the value for tra_scene_order_rel.order_date
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.order_num
     *
     * @return the value of tra_scene_order_rel.order_num
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Integer getOrderNum() {
        return orderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.order_num
     *
     * @param orderNum the value for tra_scene_order_rel.order_num
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.status_id
     *
     * @return the value of tra_scene_order_rel.status_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public Integer getStatusId() {
        return statusId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.status_id
     *
     * @param statusId the value for tra_scene_order_rel.status_id
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_scene_order_rel.order_other
     *
     * @return the value of tra_scene_order_rel.order_other
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public String getOrderOther() {
        return orderOther;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_scene_order_rel.order_other
     *
     * @param orderOther the value for tra_scene_order_rel.order_other
     *
     * @mbggenerated Sun Apr 15 15:06:34 CST 2018
     */
    public void setOrderOther(String orderOther) {
        this.orderOther = orderOther;
    }

	public String getTouristNickname() {
		return touristNickname;
	}

	public void setTouristNickname(String touristNickname) {
		this.touristNickname = touristNickname;
	}

	public String getSceneName() {
		return sceneName;
	}

	public void setSceneName(String sceneName) {
		this.sceneName = sceneName;
	}

	public String getOrderDates() {
		return orderDates;
	}

	public void setOrderDates(String orderDates) {
		this.orderDates = orderDates;
	}
}