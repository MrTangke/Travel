package com.zoubei.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.scene.SceneImg;
import com.zoubei.mapper.scene.SceneImgMapper;
import com.zoubei.service.SceneImgService;
/**
 * 
 * @项目名称：maven_travel 景点图片表
 *
 * @author ： YXM
 *
 * @date : 2018年4月18日 上午10:12:36
 */
@Service
public class SceneImgServiceImpl implements SceneImgService {
	
	@Autowired(required=false)
	private SceneImgMapper sceneImgMapper ;

	/**
	 * 根据景点Id 查询景点图片
	 */
	@Override
	public List<SceneImg> selectSceneImgBySceneId(Integer sceneId) {
		// TODO Auto-generated method stub
		//新建一个null集合 保持每个景点轮播图片只有5张
		List<SceneImg> listImg = new ArrayList<SceneImg>();
		List<SceneImg> listImg1 = sceneImgMapper.selectSceneImgBySceneId(sceneId);
		//循环判断让每个轮播的景点图片 保持在5张左右    可以使用sql解决，参考美食商家店铺mapper
		for (int i = 0; i < listImg1.size(); i++) {
			if (i<5) {
				listImg.add(listImg1.get(i));
			}
		}
		return listImg;
	}

	
}
