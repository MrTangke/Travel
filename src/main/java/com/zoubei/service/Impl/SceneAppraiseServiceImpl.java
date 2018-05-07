package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristSceneAppraise;
import com.zoubei.mapper.tourist.TouristSceneAppraiseMapper;
import com.zoubei.service.SceneAppraiseService;
/**
 * 
 * @项目名称：maven_travel 景点评论表实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月27日 下午10:15:11
 */
@Service
public class SceneAppraiseServiceImpl implements SceneAppraiseService {
	
	@Autowired(required = false)
	private TouristSceneAppraiseMapper touristSceneAppraiseMapper ;

	//通过游客id获得游客评论
	@Override
	public List<TouristSceneAppraise> selectTouristAppraise(Integer touristId) {
		// TODO Auto-generated method stub
		List<TouristSceneAppraise> tsa = touristSceneAppraiseMapper.selectTouristAppraise(touristId);
		for (TouristSceneAppraise s : tsa) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(s.getAppraiseDate());
			s.setAppraiseDates(format2);
		}
		return tsa;
	}

	/**
	 * 添加用户评论
	 */
	@Override
	public int insertTouristAppraise(TouristSceneAppraise touristSceneAppraise) {
		// TODO Auto-generated method stub
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(new Date());
			touristSceneAppraise.setAppraiseDates(format2);
			int count = touristSceneAppraiseMapper.insertSelective(touristSceneAppraise);
			return count ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0 ;
		}
		
		
	}

	//获得景点评论记录条数通过景点id
	@Override
	public Integer selectSceneAppraiseRecord(Integer sceneId) {
		// TODO Auto-generated method stub
		return touristSceneAppraiseMapper.selectSceneAppraiseRecord(sceneId);
	}

}
