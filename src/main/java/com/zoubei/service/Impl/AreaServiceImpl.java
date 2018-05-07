package com.zoubei.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.other.Area;
import com.zoubei.mapper.other.AreaMapper;
import com.zoubei.service.AreaService;
import com.zoubei.utils.LogUtil;
/**
 * 
 * @项目名称：maven_travel 地区表 ServiceImpl
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午2:30:35
 */
@Service
public class AreaServiceImpl implements AreaService {

	@Autowired(required=false)
	private AreaMapper areaMapper ;

	//根据景点id 查询景点的 市一级地址
	@Override
	public Area selectAreaBySceneId(Integer sceneId) {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaBySceneId(sceneId);
	}

	/**
	 * 后台查询地址列表  log4j打印日志
	 */
	@Override
	public List<Area> selectAreaList() {
		// TODO Auto-generated method stub
		LogUtil.mdc( "余晓明");
		Logger logger = LogUtil.getLogger(AreaServiceImpl.class);
		
		try {
			//定义空集合 和 对象
			List<Area> listName = new ArrayList<Area>();
			//定义空字串
			String contentName = "" ;
			//获得地址集合
			List<Area> list = areaMapper.selectAreaList();
			for (Area area : list) {
				if (area.getAreaPid()==0) {
					for (Area area1 : list) {
						if (area.getAreaId() == area1.getAreaPid()) {
							contentName += "," + area1.getAreaName();
						}
					}
					if(contentName.length()>1){
						contentName = contentName.substring(1);
					}else{
						contentName = "" ;
					}
					Area areas = new Area();
					areas.setAreaId(area.getAreaId());
					areas.setAreaName(area.getAreaName());
					areas.setAreaListName(contentName);
					areas.setAreaPid(area.getAreaPid());
					listName.add(areas);
					contentName = "" ;
				}else{
					continue;
				}
			}
			logger.info( "地址名称集合获取成功");
			return listName;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error( "地址名称集合获取失败");
			e.printStackTrace();
			return null ;
		}
		
	}

	/**
	 * 添加地区城市 和 地区
	 */
	@Override
	public void InsertAreaInfo(String areaNamef, String areaNamez) {
		// TODO Auto-generated method stub
		LogUtil.mdc("余晓明");
		Logger logger = LogUtil.getLogger(AreaServiceImpl.class);
		Area area = new Area();
		try {
				area.setAreaName(areaNamef);
				area.setAreaPid(0);
				//添加返回主键
				areaMapper.insertAreaInfo(area);
				Area area1 = new Area();
				area1.setAreaName(areaNamez);
				area1.setAreaPid(area.getAreaId());
				areaMapper.insertAreaInfo(area1);
			logger.info("城市地区添加成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("城市地区添加失败");
		}
		
	}

	/**
	 * 添加地区
	 */
	@Override
	public void InsertAreaInfoCit(Integer areaId, String areaNamez) {
		// TODO Auto-generated method stub
		LogUtil.mdc("余晓明");
		Logger logger = LogUtil.getLogger(AreaServiceImpl.class);
		Area area = new Area();
		try {
			area.setAreaName(areaNamez);
			area.setAreaPid(areaId);
			//返回主键但是不调用
			areaMapper.insertAreaInfo(area);
			logger.info("地址表地区添加成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("地址表地区添加失败");
		}
		
	}

	/**
	 * 删除城市 + 地址
	 */
	@Override
	public Integer deleteAreaInfo(Integer areaId) {
		// TODO Auto-generated method stub
		LogUtil.mdc("余晓明");
		Logger logger = LogUtil.getLogger(AreaServiceImpl.class);
		try {
			//也需要批量删除地区通过 areaId
			Integer count = areaMapper.deleteAreaInfoByareaId(areaId);
			logger.info("删除城市+地区成功");
			return count ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("删除城市+地区成功");
			return 0;
		}
	}

	//批量删除
	@Override
	public Integer deleteAreaAll(Integer[] ids) {
		// TODO Auto-generated method stub
		LogUtil.mdc("余晓明");
		Logger logger = LogUtil.getLogger(AreaServiceImpl.class);
		try {
			//也需要批量删除地区通过 areaId
			Integer count = 0 ;
			for (Integer i : ids) {
				count += areaMapper.deleteAreaInfoByareaId(i);
			}
			logger.info("删除城市+地区成功");
			return count ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("删除城市+地区成功");
			return 0;
		}
	}

	/**
	 * 获得所有的父级地址
	 */
	@Override
	public List<Area> selectAreaListBySupperAll() {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaList();
	}

	@Override
	public List<Area> selectAreaByHotelId(Integer areaId) {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaByHotelId(areaId);
	}

	/**
	 * ajax二级城市联动
	 */
	@Override
	public List<Area> selectAreaListByPid(Integer areaId) {
		// TODO Auto-generated method stub
		int pid = areaId ;
		return areaMapper.selectAreaShiQuList(pid);
	}

	/**
	 * 获得酒店地址 通过酒店地址id
	 */
	@Override
	public Area selectHotelAreaByAreaId(Integer areaId) {
		// TODO Auto-generated method stub
		return areaMapper.selectHotelAreaByAreaId(areaId);
	}

	/**
	 * 获得所有的地区城市
	 */
	@Override
	public List<Area> selectAreaListAll() {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaList();
	}

	/**
	 * 通过酒店地址Id查询地址表信息
	 */
	@Override
	public Area selectAreaByHotelAreaId(Integer areaId) {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaByHotelAreaId(areaId);
	}

	/**
	 * 查询动态回显的美食地址下拉菜单回显
	 */
	@Override
	public Area selectFoodByAreaEcho(Integer areaPid, Integer areaId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaPid", areaPid);
		map.put("areaId", areaId);
		return areaMapper.selectFoodByAreaEcho(map);
	}

	/**
	 * 获得地区美食地址 通过店铺id
	 */
	@Override
	public Area selectAreaByFoodId(Integer cateId) {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaByFoodId( cateId);
	}
	
	
}
