package com.zoubei.entity.tourist;

import java.util.Date;
import java.util.List;

import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;

public class Tourist {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private Integer touristId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_nickname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristNickname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_password
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristPassword;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_realname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristRealname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_sex
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristSex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_birth
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristBirth;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_cardid
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristCardid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_phone
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristPhone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.area_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private Integer areaId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_address
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristAddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_image
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristImage;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tra_tourist.tourist_content
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    private String touristContent;
    
    private List<Scene> scenes;
    
    private List<SceneImg> senceImgs;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_id
     *
     * @return the value of tra_tourist.tourist_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public Integer getTouristId() {
        return touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_id
     *
     * @param touristId the value for tra_tourist.tourist_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_nickname
     *
     * @return the value of tra_tourist.tourist_nickname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristNickname() {
        return touristNickname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_nickname
     *
     * @param touristNickname the value for tra_tourist.tourist_nickname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristNickname(String touristNickname) {
        this.touristNickname = touristNickname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_password
     *
     * @return the value of tra_tourist.tourist_password
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristPassword() {
        return touristPassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_password
     *
     * @param touristPassword the value for tra_tourist.tourist_password
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristPassword(String touristPassword) {
        this.touristPassword = touristPassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_realname
     *
     * @return the value of tra_tourist.tourist_realname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristRealname() {
        return touristRealname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_realname
     *
     * @param touristRealname the value for tra_tourist.tourist_realname
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristRealname(String touristRealname) {
        this.touristRealname = touristRealname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_sex
     *
     * @return the value of tra_tourist.tourist_sex
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristSex() {
        return touristSex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_sex
     *
     * @param touristSex the value for tra_tourist.tourist_sex
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristSex(String touristSex) {
        this.touristSex = touristSex;
    }    

    
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_birth
     *
     * @return the value of tra_tourist.tourist_birth
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_cardid
     *
     * @return the value of tra_tourist.tourist_cardid
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristCardid() {
        return touristCardid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_cardid
     *
     * @param touristCardid the value for tra_tourist.tourist_cardid
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristCardid(String touristCardid) {
        this.touristCardid = touristCardid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_phone
     *
     * @return the value of tra_tourist.tourist_phone
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristPhone() {
        return touristPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_phone
     *
     * @param touristPhone the value for tra_tourist.tourist_phone
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristPhone(String touristPhone) {
        this.touristPhone = touristPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.area_id
     *
     * @return the value of tra_tourist.area_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public Integer getAreaId() {
        return areaId;
    }
    
    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.area_id
     *
     * @param areaId the value for tra_tourist.area_id
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_address
     *
     * @return the value of tra_tourist.tourist_address
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristAddress() {
        return touristAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_address
     *
     * @param touristAddress the value for tra_tourist.tourist_address
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristAddress(String touristAddress) {
        this.touristAddress = touristAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_image
     *
     * @return the value of tra_tourist.tourist_image
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristImage() {
        return touristImage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_image
     *
     * @param touristImage the value for tra_tourist.tourist_image
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristImage(String touristImage) {
        this.touristImage = touristImage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tra_tourist.tourist_content
     *
     * @return the value of tra_tourist.tourist_content
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public String getTouristContent() {
        return touristContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tra_tourist.tourist_content
     *
     * @param touristContent the value for tra_tourist.tourist_content
     *
     * @mbggenerated Sun Apr 15 11:14:47 CST 2018
     */
    public void setTouristContent(String touristContent) {
        this.touristContent = touristContent;
    }

	public String getTouristBirth() {
		return touristBirth;
	}

	public void setTouristBirth(String touristBirth) {
		this.touristBirth = touristBirth;
	}

	public List<Scene> getScenes() {
		return scenes;
	}

	public void setScenes(List<Scene> scenes) {
		this.scenes = scenes;
	}

	public List<SceneImg> getSenceImgs() {
		return senceImgs;
	}

	public void setSenceImgs(List<SceneImg> senceImgs) {
		this.senceImgs = senceImgs;
	}
	
}