package com.zoubei.entity.tourist;
/**
 * 
 * @项目名称：maven_travel  景点订单支付表
 *
 * @author ： YXM
 *
 * @date : 2018年4月26日 下午6:38:46
 */
public class TouristSceneOrderPriceRel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.tourist_order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private Integer touristOrderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private Integer orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.order_uuid
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private String orderUuid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.order_status
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private Integer orderStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.order_paydate
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private String orderPaydate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist_scene_orderprice_rel.order_prices
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    private Double orderPrices;
    
    /**
     * 
     * 
     * 此为添加个人需要所以添加的字段  用于前台订单展示  和 订单支付的方便   勿动！！1
     * 
     *                                        余晓明     2018年4月26日18:43:03  
     * 
     * 
     */
    
    //景点图片  单查
    private String imgUrl ;

    //计算总价   单价*数量      sql不查
    private Double orderCount ;
    
    //景点id
    private Integer sceneId ;
    
    //景点名称
    private String sceneName ;

    //景点单价
    private Integer scenePrice ;
    
    //订单时间
    private String orderDate ;
    
    //订单的购买数量
    private Integer orderNum ;
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.tourist_order_id
     *
     * @return the value of tra_tourist_scene_orderprice_rel.tourist_order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public Integer getTouristOrderId() {
        return touristOrderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.tourist_order_id
     *
     * @param touristOrderId the value for tra_tourist_scene_orderprice_rel.tourist_order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setTouristOrderId(Integer touristOrderId) {
        this.touristOrderId = touristOrderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.order_id
     *
     * @return the value of tra_tourist_scene_orderprice_rel.order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.order_id
     *
     * @param orderId the value for tra_tourist_scene_orderprice_rel.order_id
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.order_uuid
     *
     * @return the value of tra_tourist_scene_orderprice_rel.order_uuid
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public String getOrderUuid() {
        return orderUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.order_uuid
     *
     * @param orderUuid the value for tra_tourist_scene_orderprice_rel.order_uuid
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setOrderUuid(String orderUuid) {
        this.orderUuid = orderUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.order_status
     *
     * @return the value of tra_tourist_scene_orderprice_rel.order_status
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public Integer getOrderStatus() {
        return orderStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.order_status
     *
     * @param orderStatus the value for tra_tourist_scene_orderprice_rel.order_status
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.order_paydate
     *
     * @return the value of tra_tourist_scene_orderprice_rel.order_paydate
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public String getOrderPaydate() {
        return orderPaydate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.order_paydate
     *
     * @param orderPaydate the value for tra_tourist_scene_orderprice_rel.order_paydate
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setOrderPaydate(String orderPaydate) {
        this.orderPaydate = orderPaydate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist_scene_orderprice_rel.order_prices
     *
     * @return the value of tra_tourist_scene_orderprice_rel.order_prices
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public Double getOrderPrices() {
        return orderPrices;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist_scene_orderprice_rel.order_prices
     *
     * @param orderPrices the value for tra_tourist_scene_orderprice_rel.order_prices
     *
     * @mbggenerated Thu Apr 26 18:37:49 CST 2018
     */
    public void setOrderPrices(Double orderPrices) {
        this.orderPrices = orderPrices;
    }

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Double getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Double orderCount) {
		this.orderCount = orderCount;
	}

	public Integer getSceneId() {
		return sceneId;
	}

	public void setSceneId(Integer sceneId) {
		this.sceneId = sceneId;
	}

	public String getSceneName() {
		return sceneName;
	}

	public void setSceneName(String sceneName) {
		this.sceneName = sceneName;
	}

	public Integer getScenePrice() {
		return scenePrice;
	}

	public void setScenePrice(Integer scenePrice) {
		this.scenePrice = scenePrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
    
}