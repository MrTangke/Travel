package com.zoubei.mapper.tourist;

import com.zoubei.entity.tourist.TouristSceneCollecRel;

public interface TouristSceneCollecRelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_scene_collec_rel
     *
     * @mbggenerated Sun Apr 15 15:06:01 CST 2018
     */
    int insert(TouristSceneCollecRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tra_tourist_scene_collec_rel
     *
     * @mbggenerated Sun Apr 15 15:06:01 CST 2018
     */
    int insertSelective(TouristSceneCollecRel record);

    //按id删除收藏表
	void deleteSceneCollect(Integer sceneId);


	TouristSceneCollecRel selctRecordByTidSid(TouristSceneCollecRel tscr);

}