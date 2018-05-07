package com.zoubei.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.entity.tourist.TouristSceneCollecRel;
import com.zoubei.mapper.other.AreaMapper;
import com.zoubei.mapper.scene.SceneImgMapper;
import com.zoubei.mapper.scene.SceneMapper;
import com.zoubei.mapper.tourist.TouristMapper;
import com.zoubei.mapper.tourist.TouristSceneCollecRelMapper;
import com.zoubei.service.BindexService;
@Service("bindex")
public class BindexServiceImpl implements BindexService{
	
	//景点
	@Autowired
	private SceneMapper sceneMapper;
	
	//景点图片
	@Autowired
	private SceneImgMapper sceneImgMapper;
	
	//游客
	@Autowired
	private TouristMapper touristMapper;
	
	@Autowired
	private AreaMapper areaMapper;
	
	//收藏
	@Autowired
	private TouristSceneCollecRelMapper touristSceneCollecRelMapper;
	
	
	
	@Override
	public List<Scene> selectScene() {
		
		return sceneMapper.selectScene();
	}

	@Override
	public List<SceneImg> selectSceneImg(Integer sceneId) {
		
		return sceneImgMapper.selectSceneImgBySceneId(sceneId);
	}

	@Override
	public Tourist selectToutistList(Integer touristId) {
		
		return touristMapper.selectToutistList(touristId);
	}

	// 查询相应的市  对应区集合
	@Override
	public List<Area> selectAreaShiQuList() {
		//查看所有的市
		List<Area> list = areaMapper.selectAreaShiQuList(0);
		// 查看区对应的市
		// 将至放入对应的list中
		List<Area> listNew = new ArrayList<>();
		for (int i=0; i<3; i++) {
			List<Area> areaQuList = new ArrayList<>();
			areaQuList = areaMapper.selectAreaShiQuList(list.get(i).getAreaId());
			list.get(i).setAreas(areaQuList);
			// 将该对象放入新的集合中
			listNew.add(list.get(i));
		}
		
		return listNew;
	}

	// 查询该区下面对应的景点
	@Override
	public List<Scene> selectSceneByAreaId(Integer areaId) {
		List<Scene> scenes = sceneMapper.selectScenesByAreaId(areaId);
		// 得到该进的景点的全部图片
		for (Scene scene : scenes) {
			List<SceneImg> sceneImgs = new ArrayList<>();
			sceneImgs = sceneImgMapper.selectSceneImgBySceneId(scene.getSceneId());
			scene.setListSceneImg(sceneImgs);
		}
		return scenes;
		
	}

	

	@Override
	public void updateTour(Tourist tourist) {
		touristMapper.updateTour(tourist);
		
	}
	//修改个人中心图片
	@Override
	public void updateTuPian(Tourist tourist) {
		touristMapper.updateTuPian(tourist);
		
	}
	//按id查询景点
	@Override
	public Tourist selectTouristListById(Integer touristId) {
		
		return touristMapper.selectTouristListById(touristId);
	}

	//按id删除收藏表
	@Override
	public void deleteSceneCollect(Integer sceneId) {
		
		touristSceneCollecRelMapper.deleteSceneCollect(sceneId);
	}

	
}
