package com.bbs.service.plant.impl;

import java.util.List;

import com.bbs.dao.plant.bbs_plateServiceDao;
import com.bbs.dao.plant.impl.bbs_plateServiceDaoImpl;
import com.bbs.entity.bbs_plate;
import com.bbs.service.plant.bbs_plateService;

public class bbs_plateServiceImpl implements bbs_plateService {
	// 创建一个数据访问层的对象
	private bbs_plateServiceDao pd = new bbs_plateServiceDaoImpl();
	@Override
	public boolean savePlant(bbs_plate plant) {
		int result = pd.savaPlant(plant);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<bbs_plate> getPlateList() {
		// TODO Auto-generated method stub
		return pd.getPlateList();
	}
	@Override
	public boolean delAll(String ids) {
		// 因为ids是我们组合成一个字符串，现在需要对这个字符串进行处理
		// 第一个去除所有的引号
		ids = ids.replaceAll("\"","");
		// 取中括号中的数据
		ids = ids.substring(1, ids.lastIndexOf("]"));
		// 按照,进行拆分成一个字符串数组
		String[] pids = ids.split(",");
		// 调用数据访问层中根据多个id删除数据的方法
		int result = pd.delAll(pids);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
}
