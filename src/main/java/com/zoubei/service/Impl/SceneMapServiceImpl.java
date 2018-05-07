package com.zoubei.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.scene.SceneMap;
import com.zoubei.mapper.scene.SceneMapMapper;
import com.zoubei.service.SceneMapService;
/**
 * 
 * @项目名称：maven_travel 景点位置坐标 Service 实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 下午3:27:26
 */
@Service
public class SceneMapServiceImpl implements SceneMapService {
	
	@Autowired(required = false)
	private SceneMapMapper sceneMapMapper ;

	/**
	 * 根据景点Id查询景点坐标轴位置 -X -Y
	 */
	@Override
	public SceneMap selectSceneMapBySceneId(Integer sceneId) {
		// TODO Auto-generated method stub
		return sceneMapMapper.selectSceneMapBySceneId(sceneId);
	}

}
