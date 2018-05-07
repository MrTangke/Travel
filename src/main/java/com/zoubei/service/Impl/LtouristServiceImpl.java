package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.mapper.scene.SceneMapper;
import com.zoubei.mapper.tourist.TouristMapper;
import com.zoubei.service.LtouristService;
@Service
public class LtouristServiceImpl implements LtouristService{
	@Autowired
	private TouristMapper touristMapper;
	
	@Autowired
	private SceneMapper sceneMapper;
	
	@Override
	public Tourist toUpdateTourist(Integer touristId) {
		
		return touristMapper.toUpdateTourist(touristId);
		
	}

	@Override
	public List<Tourist> selectTouristByList() {
		
		return touristMapper.selectTouristByList();
	}

	@Override
	public List<Tourist> selectSceneByimg() {
		
		return sceneMapper.selectSceneByimg();
	}

	@Override
	public Scene selectSi() {
		
		return sceneMapper.selectSi();
	}

	@Override
	public List<Scene> selectShounum() {
		
		return sceneMapper.selectShounum();
	}


}
