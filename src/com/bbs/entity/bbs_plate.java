package com.bbs.entity;
/**
 * 模块类
 * @author Kaop
 *
 */
public class bbs_plate {
	private int plantId;
	private String plantTitle;
	private String plantMessage;
	private int isEnable;
	public int getPlantId() {
		return plantId;
	}
	public void setPlantId(int plantId) {
		this.plantId = plantId;
	}
	public String getPlantTitle() {
		return plantTitle;
	}
	public void setPlantTitle(String plantTitle) {
		this.plantTitle = plantTitle;
	}
	public String getPlantMessage() {
		return plantMessage;
	}
	public void setPlantMessage(String plantMessage) {
		this.plantMessage = plantMessage;
	}
	public int getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
	}
	public bbs_plate(String plantTitle, String plantMessage) {
		super();
		this.plantTitle = plantTitle;
		this.plantMessage = plantMessage;
	}
	public bbs_plate(int plantId, String plantTitle, String plantMessage, int isEnable) {
		super();
		this.plantId = plantId;
		this.plantTitle = plantTitle;
		this.plantMessage = plantMessage;
		this.isEnable = isEnable;
	}
}
