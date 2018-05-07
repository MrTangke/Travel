package com.zoubei.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.scene.SceneType;
import com.zoubei.mapper.scene.SceneTypeMapper;
import com.zoubei.service.SceneTypeService;
/**
 * 
 * @项目名称：maven_travel 景点类型表
 *
 * @author ： YXM
 *
 * @date : 2018年4月18日 上午9:27:13
 */
@Service
public class SceneTypeServiceImpl implements SceneTypeService {
	
	@Autowired(required=false)
	private SceneTypeMapper sceneTypeMapper ;

	/**
	 * 根据景点类型id 查询景点类型
	 */
	@Override
	public SceneType selectSceneTypeBySceneId(Integer typeId) {
		// TODO Auto-generated method stub
		return sceneTypeMapper.selectByPrimaryKey(typeId);
	}
	
	

}
