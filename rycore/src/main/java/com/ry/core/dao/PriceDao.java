package com.ry.core.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ry.core.entity.Price;
import com.ry.core.entity.PriceType;
import com.ry.core.form.PriceForm;

public interface PriceDao {
	
	/**
	 * 根据主键派单表及贴现单基本信息
	 * @author WKX
	 * @param dtboId
	 * @since 2016年3月15日 下午4:22:53
	 */
	public List<Map<String,Object>> getDtboDcrdById(Integer dtboId);
	
	/**
	 * 根据主键获取报价（含报价类型）
	 * @param id
	 * @author WKX
	 */
	public List<Map<String,Object>> getPriceById(Integer id);
	
	/**
	 * 根据机构ID获取报价(所有)
	 * @param orgId 机构ID
	 * @param createTime 创建日期
	 * @author BKY
	 */
	public List<Price> getByOrgId(Integer orgId, String createTime, Integer priceTypeId, Integer cityId);
	
	/**
	 * 根据机构ID获取报价(id和priceTypeId)
	 * @param orgId 机构ID
	 * @param date 创建日期
	 * @author BKY
	 */
	public List<Map<String, Object>> getPtid(Integer orgId, String date);

	/**
	 * 根据机构ID获取报价(id和priceTypeId和day)
	 * @param orgId 机构ID
	 * @param date 创建日期
	 * @param cityId 交易城市
	 * @author BKY
	 */
	public List<Map<String, Object>> getPtidAndDay(Integer orgId, String date, Integer cityId);
	
	/**
	 * 报价保存信息
	 * @author BKY
	 */
	public Integer saveByEntity(Price price);
	
	/**
	 * 根据报价ID查询：获取报价的创建时间和所属报价类型的信息
	 * @param id	报价id
	 * @author BKY
	 */
	public List<Map<String, Object>> getByPriceTypeId(Integer id);
	
	/**
	 * 根据机构ID和价格类型ID获取信息
	 * @param orgId	机构id
	 * @param priceTypeId 报价类型id
	 * @author BKY
	 */
	public List<Price> infoById(Integer orgId, Integer priceTypeId, Integer cityId);
	
	/**
	 * 根据报价类型获取该机构当天报价
	 * @author WKX
	 * @param priceType
	 * @param orgId
	 * @since 2016年4月7日 下午1:09:41
	 */
	public List<Map<String, Object>> getByPriceTypeAndOrgId(PriceType priceType,Integer orgId);
	
	/**
	 * 根据认证主键获取报价（该方法更多应用于查询该用户报价过多少天）
	 * @author WKX
	 * @param orgId
	 * @since 2016年4月8日 下午8:23:35
	 */
	public List<Map<String, Object>> getByOrgId(Integer orgId);
	
	/**
	 * 根据orgId获取某个时间的报价和报价类型
	 * @param orgId 机构主键
	 * @param createTime 创建时间
	 * @author BKY
	 */
	public List<Map<String, Object>> getPriceAndTypeByOrgId(Integer orgId, String createTime, Integer cityId,Integer memberId);
	
	/**
	 * 根据日期，PriceType获取指定日期所有报价
	 * @author GXW
	 * @param date,pt,cityId
	 * @since 2016年5月13日 
	 */
	public List<Map<String, Object>> getAllPrice(String date,PriceType pt, Integer cityId);
	
	/**
	 * 根据票据属性匹配  机构报价（各个机构）
	 * @author WKX
	 * @param priceType
	 * @param cityId 报价机构
	 * @since 2016年5月13日
	 */
	public List<Map<String, Object>> getPriceGroupByOrgId(PriceType priceType,Integer cityId);
	
	/**
	 * 获取某段时间内所有机构的报价和额度以及机构名称
	 * @param createTime 时间
	 * @author BKY
	 */
	public List<Map<String, Object>> getAllPriceAndOrgName(String createTime);
	
	/**
	 * 获取给定日期已报价的所有city_id
	 * @author GXW
	 * @param date 日期
	 * @return list 所有city_id
	 * @since 2016年6月3日
	 */
	public List<Integer> getCityIdListByDate(Date date);
	
	/**
	 * 根据承兑行类型 排序，获取报价最低的 各个机构的数据
	 * @author WKX
	 * @param priceType
	 * @param type
	 * @since 2016年6月15日 下午7:36:25
	 */
	public List<Map<String, Object>> getPriceOrderByTypeGroupByOrgId(PriceType priceType,String type);
	
	/**
	 * 根据日期和城市 获取符合条件的 报价和报价类型
	 * @author GXW
	 * @param createTime
	 * @param cityId
	 * @since 2016年6月22日
	 */
	public List<Map<String, Object>> getPriceNTypeByDateNCity(String createTime,Integer cityId);
	
	/**
	 * 根据报价类型和机构，获取有报价的城市
	 * @author WKX
	 * @param priceType
	 * @param orgId
	 * @since 2016年6月30日 下午3:51:06
	 */
	public List<Map<String, Object>> getByPriceTypeAndOrgIdGroupByCityId(PriceType priceType,Integer orgId);
	
	/**
	 * 根据主键获取对象
	 * @author WKX
	 * @param id
	 * @since 2016年7月1日 下午1:26:11
	 */
	public Price getById(Integer id);
	
	/**
	 * 获取相同报价（作用：查询出相同的报价，替换掉）
	 * @author WKX
	 * @param orgId
	 * @param priceTypeId
	 * @param cityId
	 * @param day
	 * @since 2016年7月1日 下午4:01:57
	 */
	public List<Price> getSameByOrgId(Integer orgId, Integer priceTypeId, Integer cityId, String day);
	
	/**
	 * 根据日期获取当天的最低价格
	 * @author ZY
	 * @param day
	 * @since 2016年8月23日 下午4:38:27
	 */
	public List<Map<String, Object>> getMinPrice(String name,String day,Integer priceTypeId,String cityId);
	
	/**
	 * 分享里根据orgId和date获取其报价的最早报价城市
	 * @author ZY
	 * @param orgId
	 * @param date
	 * 2016年9月26日下午2:32:53
	 */
	public List<Map<String, Object>> getCityIdByOrgIdAndDate(Integer orgId, String date);
	
	/**
	 * 根据日期获取报价城市
	 * @author ZY
	 * @param date 
	 * 2016年10月17日下午2:05:22
	 */
	public List<Map<String, Object>> getCityListByDate(String date);
	
	/**
	 * @author MH
	 * 			 根据城市Id,orgId,判断城市是否可以修改或者删除（查看某人今天某个城市是否报价）
	 * @param map 参数
	 * @return
	 */
	public List<Map<String, Object>> judgeUpdateCity(Map<String,Object> map);
	
	/**
	 * 获取所有认证通过的机构-在该段时间内报价情况（非线上推广渠道注册的用户）
	 * @author WKX
	 * @param start 开始日期
	 * @param end 结束日期
	 * @since 2017年4月24日 下午5:01:53
	 */
	public List<Map<String, Object>> getPriceByOrgNoHezuo(Date start,Date end);
	
	/**
	 * 查询某段时间内报价天数总和
	 * @author MH
	 * @param from 参数
	 * @return
	 */
	public List<Map<String,Object>> getPriceSvmDay(PriceForm from);
}