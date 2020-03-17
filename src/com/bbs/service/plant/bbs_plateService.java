package com.bbs.service.plant;

import java.util.List;

import com.bbs.entity.bbs_plate;

public interface bbs_plateService {
	boolean savePlant(bbs_plate plant);

	List<bbs_plate> getPlateList();

	boolean delAll(String ids);
}
