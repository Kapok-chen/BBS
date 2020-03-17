package com.bbs.dao.plant;

import java.util.List;

import com.bbs.entity.bbs_plate;
/**
 * 操作模块的接口
 * @author Kaop
 *
 */
public interface bbs_plateServiceDao {
	int savaPlant(bbs_plate plant);

	List<bbs_plate> getPlateList();

	int delAll(String[] pids);
}
