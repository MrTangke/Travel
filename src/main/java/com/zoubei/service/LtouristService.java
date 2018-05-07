package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.tourist.Tourist;

public interface LtouristService {

	Tourist toUpdateTourist(Integer touristId);

	List<Tourist> selectTouristByList();

	List<Tourist> selectSceneByimg();

	Scene selectSi();

	List<Scene> selectShounum();


}
