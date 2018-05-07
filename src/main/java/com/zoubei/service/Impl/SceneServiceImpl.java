package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.mapper.other.AreaMapper;
import com.zoubei.mapper.scene.SceneMapper;
import com.zoubei.service.SceneService;
/**
 * 
 * @项目名称：maven_travel 景点serviceImpl
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午2:15:46
 */
@Service
public class SceneServiceImpl implements SceneService {
	//景点表mapper注入
	@Autowired(required = false)
	private SceneMapper sceneMapper ;
	
	// 地址表Mapper 注入
	@Autowired(required = false)
	private AreaMapper areaMapper ;


	/**
	 * 根据景点地址ID 查询景点所在的地区
	 */
	@Override
	public Area selectAreaBySceneAreaId(Integer areaId) {
		// TODO Auto-generated method stub
		return areaMapper.selectByPrimaryKey(areaId);
	}

	//根据id查询景点详情
	@Override
	public Scene selectSceneById(Integer sceneId) {
		// TODO Auto-generated method stub
		return sceneMapper.selectSceneById(sceneId);
	}

	/**
	 * 查询地址所有地址的集合
	 */
	@Override
	public List<Area> selectAreaList() {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaList();
	}

	/**
	 * 查询所有景点
	 */
	@Override
	public List<Scene> selectSceneList() {
		// TODO Auto-generated method stub
		return sceneMapper.selectSceneList();
	}

	//获得景点排序 景点排名
	@Override
	public int selectSceneOrderBy(String sceneId) {
		// TODO Auto-generated method stub
		int sceneId1 = Integer.parseInt(sceneId);
		List<Scene> list = sceneMapper.selectSceneOrderBy(sceneId1);
		int count = 0 ;
		for (Scene scene : list) {
			count ++ ;
			if (Integer.parseInt(sceneId) == scene.getSceneId()) {
				return count ;
			}
		}
		return 0;
	}


}
