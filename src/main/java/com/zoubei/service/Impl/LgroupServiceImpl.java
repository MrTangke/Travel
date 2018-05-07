package com.zoubei.service.Impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.cate.CateGroup;
import com.zoubei.entity.hotel.HotelGroup;
import com.zoubei.entity.other.Area;
import com.zoubei.entity.other.SuperManager;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneGroup;
import com.zoubei.entity.scene.SceneType;
import com.zoubei.mapper.cate.CateGroupMapper;
import com.zoubei.mapper.hotel.HotelGroupMapper;
import com.zoubei.mapper.other.AreaMapper;
import com.zoubei.mapper.other.SuperManagerMapper;
import com.zoubei.mapper.scene.SceneGroupMapper;
import com.zoubei.mapper.scene.SceneMapper;
import com.zoubei.mapper.scene.SceneTypeMapper;
import com.zoubei.service.LgroupService;
import com.zoubei.utils.ExcelUtil;

@Service
public class LgroupServiceImpl implements LgroupService {

	/**
	 * Mapper层对象，进行后台判断
	 */
	@Autowired(required = false)
	private SuperManagerMapper superManagerMapper;
	
	@Autowired(required = false)
	private SceneGroupMapper sceneGroupMapper;
	
	@Autowired(required = false)
	private SceneMapper sceneMapper;
	
	@Autowired(required = false)
	private HotelGroupMapper hotelGroupMapper;
	
	@Autowired(required = false)
	private CateGroupMapper cateGroupMapper;
	
	@Autowired(required = false)
	private AreaMapper areaMapper;
	
	@Autowired(required = false)
	private SceneTypeMapper sceneTypeMapper;
	
	
	/**
	 * 进行判断商家类型
	 */
	@Override
	public String selectGroupByNnameSid(HttpServletRequest request, HashMap<String, Object> map) {
		Integer statusId = Integer.parseInt((map.get("statusId")).toString().trim());
		String flag = "0";
		switch (statusId) {		// 得到状态id， 进行判断是某种商家，继而进行判断
			case 1:{			// 超级管理员
				SuperManager superManager = superManagerMapper.selectSuperManagerByNnamePasd(map);
				if(superManager != null){
					request.getSession().setAttribute("superManager", superManager);
					flag = "1";
				}
				break;
			}
			case 2:{			// 景点商家
				SceneGroup sceneGroup = sceneGroupMapper.selectSceneGroupByNnamePasd(map);
				if(sceneGroup != null){
					request.getSession().setAttribute("sceneGroup", sceneGroup);
					flag = "1";
				}
				break;
			}
			case 3:{			// 酒店商家
				HotelGroup hotelGroup = hotelGroupMapper.selectHotelGroupByNnamePasd(map);
				if(hotelGroup != null){
					request.getSession().setAttribute("hotelGroup", hotelGroup);
					flag = "1";
				}
				break;
			}
			case 4:{			// 美食商家
				CateGroup cateGroup = cateGroupMapper.selectCateGroupByNnamePasd(map);
				if(cateGroup != null){
					request.getSession().setAttribute("cateGroup", cateGroup);
					flag = "1";
				}
				break;
			}
			default:{			// 其余情况
				break;
			}
		}
		
		return flag;
	}

	// 查询景点商家的集合
	@Override
	public List<SceneGroup> selectSceneGroupList() {
		return sceneGroupMapper.selectSceneGroupList();
	}
	// 通过id查询景点商家
	@Override
	public SceneGroup selectSceneGroupBySid(int sgpId) {
		return sceneGroupMapper.selectByPrimaryKey(sgpId);
	}
	// 通过景点商家所关联的地域id  进行查询所有的在该区域中的景点集合
	@Override
	public List<Scene> selectSceneByGid(Integer areaId) {
		return sceneMapper.selectSceneListByAreaId(areaId);
	}
	// 通过管理的区域进行查询所有区的集合
	@Override
	public List<Area> selectAreaListBySgpId(Integer sgpid) {
		return areaMapper.selectAreaListBySgpId(sgpid);
	}
	// 查询出所有的景点类型list集合
	@Override
	public List<SceneType> selectSceneType() {
		return sceneTypeMapper.selectSceneTypeList();
	}
	// 后台添加景点数据库
	@Override
	public String insertSceneBySgpid(Scene scene) {
		return ""+sceneMapper.insertSelective(scene);
	}

	//根据选择的ids进行导出相应的数据
	@Override
	public String exportExcel(HttpServletRequest request, HttpServletResponse response, String ids) {
		HashMap<Object, Object> hashMap = new HashMap<>();
		hashMap.put("ids", ids);
		//查询景点的相应信息
		List<Scene> listScenes = sceneMapper.selectSceneByIds(hashMap);
		String i = ExcelUtil.exportExcel_f(request, response, listScenes);
		
		return i;
	}

	//导入excel
	@Override
	public String SceneImportExcel(HttpServletRequest request, MultipartFile excelfile) {
		String flag = "0";
		try {
			@SuppressWarnings("rawtypes")
			List importExcel = ExcelUtil.importExcel(request, excelfile);
			for (Object object : importExcel) {
				System.out.println(object.toString());
				sceneMapper.insertSelective((Scene)object);

				flag = "1";
			}
		} catch (Exception e) {
			flag = "0";
			e.printStackTrace();
		}
		return flag;
	}
	

}
