package com.ry.core.dao;

import java.util.List;

import com.ry.core.entity.OrgExtendInfo;

public interface OrgExtendInfoDao {
	/**
	 * 通过org_InfoId获取
	 * @author ZWD
	 * @param orgExtendInfo 对象
	 */
	OrgExtendInfo getOrgExtendInfoByInfoId(Integer orgInfoId);
	
	/**
	 * 修改并保存对象
	 * @author MH
	 * @param orgExtendInfo 对象
	 */
	public void updateOrgExtendInfo(OrgExtendInfo orgExtendInfo);
	
	/**
	 * 保存对象
	 * @author MH
	 * @param orgExtendInfo
	 */
	public void saveOrgExtendInfo(OrgExtendInfo orgExtendInfo);
	
	/**
	 * 获取不是平台用户的所有用户
	 * @author MH
	 * @return
	 */
	public List<OrgExtendInfo> getOrgExtendInfoByInfo();
}
