package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.cate.CateFoodRel;
import com.zoubei.entity.cate.CateGroupRel;
import com.zoubei.mapper.cate.CateFoodRelMapper;
import com.zoubei.mapper.cate.CateGroupRelMapper;
import com.zoubei.mapper.cate.CateMapper;
import com.zoubei.service.CateService;
/**
 * 
 * @项目名称：maven_travel 美食店铺表service实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 上午8:36:43
 */
@Service
public class CateServiceImpl implements CateService {
	
	@Autowired(required = false)
	private CateMapper cateMapper ;
	
	//店铺 美食 中间表
	@Autowired(required = false)
	private CateFoodRelMapper cateFoodRelMapper ;

	//商家店铺中间表
	@Autowired(required = false)
	private CateGroupRelMapper cateGroupRelMapper;
	
	/**
	 * 根据景点区域id 查询该区域美食商家 排行优先推荐销量高的美食商家 order by
	 */
	@Override
	public List<Cate> selectCateBySceneAreaId(Integer areaId) {
		// TODO Auto-generated method stub
		return cateMapper.selectCateBySceneAreaId(areaId);
	}

	//通过城市id获得该城市美食
	@Override
	public List<Cate> selectCateList(Integer areaId) {
		// TODO Auto-generated method stub
		return cateMapper.selectCateList(areaId);
	}

	//添加美食店铺
	@Override
	public void insertCate(Cate cate) {
		// TODO Auto-generated method stub
		cateMapper.insertSelective(cate);
	}

	//ajax回显店铺
	@Override
	public Cate selectCateEchoByHotelId(Integer cateId) {
		// TODO Auto-generated method stub
		return cateMapper.selectByPrimaryKey(cateId);
	}

	// 修改美食店鋪表
	@Override
	public void updateCateBy(Cate cate) {
		// TODO Auto-generated method stub
		cateMapper.updateByPrimaryKeySelective(cate);
	}

	//批量刪除美食店鋪
	@Override
	public Integer deleteCate(Integer[] ids) {
		// TODO Auto-generated method stub
		Integer count = 0 ;
		try {
			
			for (Integer cateId : ids) {
				count += cateMapper.deleteByPrimaryKey(cateId);
				cateGroupRelMapper.deleteByzhongjianCateId(cateId);
			}
			return count ;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return count ;
		}
		
	}

	/**
	 * 获得所有的美食商家
	 */
	@Override
	public List<Cate> selectCateListAll() {
		// TODO Auto-generated method stub
		return cateMapper.selectCateListAll();
	}

	//通过食物id获得店铺id
	@Override
	public Cate selectCateByzhongjian(Integer foodId) {
		// TODO Auto-generated method stub
		CateFoodRel cate = cateFoodRelMapper.selectCateByzhongjian(foodId);
		Cate cate2 = cateMapper.selectByPrimaryKey(cate.getCateId());
		return cate2;
	}

	//商家管理登录查询店铺
	@Override
	public List<Cate> selectCateByGroup(Integer cgpId) {
		// TODO Auto-generated method stub
		return cateMapper.selectCateByGroup( cgpId);
	}

	//商家添加店铺和中间表
	@Override
	public void insertCate(Cate cate, Integer cgpId) {
		// TODO Auto-generated method stub
		cateMapper.insertSelective(cate);
		CateGroupRel cateGroupRel = new CateGroupRel();
		cateGroupRel.setCateId(cate.getCateId());
		cateGroupRel.setCgpId(cgpId);
		cateGroupRelMapper.insertSelective(cateGroupRel);
	}

	//查询商家所有的店铺
	@Override
	public List<Cate> selectCateListAlls(Integer cgpId) {
		// TODO Auto-generated method stub
		return cateMapper.selectCateListAlls(cgpId);
	}

}
