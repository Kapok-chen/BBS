package com.bbs.dao.plant.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bbs.commons.DataUtils;
import com.bbs.dao.plant.bbs_plateServiceDao;
import com.bbs.entity.bbs_plate;

public class bbs_plateServiceDaoImpl implements bbs_plateServiceDao {
	private ResultSet rs;
	@Override
	public int savaPlant(bbs_plate plant) {
		// 创建SQL命令
		String sql = "insert into bbs_plate(plateTitle,plateMessage,isEnable) values(?,?,0)";
		Object[] params = {plant.getPlantTitle(),plant.getPlantMessage()};
		return DataUtils.executeUpdate(sql, params);
	}

	@Override
	public List<bbs_plate> getPlateList() {
		List<bbs_plate> list = new ArrayList<bbs_plate>();
		try {
			String sql = "select * from bbs_plate";
			rs = DataUtils.queryAll(sql, null);
			while (rs.next()) {
				list.add(new bbs_plate(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DataUtils.closeAll(null, null, rs);
		}
		return list;
	}

	@Override
	public int delAll(String[] pids) {
		// 创建SQL语句
		StringBuffer sql = new StringBuffer("delete from bbs_plate where plateId in(");
		// 根据传递的数组，进行占位符的拼接
		for (int i = 0; i < pids.length; i++) {
			sql.append("?");
			// 判断是否到了数组的末尾，没有到末尾就拼接,
			if(i != pids.length - 1) {
				sql.append(",");
			}
		}
		// 为字符串拼接最后一个小括号
		sql.append(")");
		return DataUtils.executeUpdate(sql.toString(), pids);
	}
	
}
