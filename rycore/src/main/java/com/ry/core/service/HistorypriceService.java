package com.ry.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ry.core.entity.Historyprice;
@Repository
public interface HistorypriceService {
	
	List<Historyprice> getList(Float allmoney,Historyprice historyprice);

	void updateAllHistoryprice(List<Historyprice> historypriceList);
	
	/**
	 * 根据承兑行和大小票和时间区间
	 * @author WKX
	 * @param start
	 * @param end
	 * @param type1
	 * @param type2
	 * @param type4
	 * @param index
	 * @param size
	 * @since 2016年1月29日 下午3:40:30
	 */
	public List<Historyprice> findPriceList(String start,String end,Integer type1,Integer type2,Integer type4,Integer index, Integer size);
	
	/**
	 * 根据日期获取当天的historyprice
	 * @param day
	 * @author BKY
	 */
	public List<Historyprice> findbyDay(String day);
	
	/**
	 * 上面的updateAllHistotyprice是老版本用的，不敢动
	 * 重写保存或修改当天的数据
	 * @author BKY
	 */
	public void saveOrUpdateHistoryprice(List<Historyprice> historypriceList);
	
	/**
	 * 根据时间查询当天的大票 和 小票的纸票或电票
	 * @param day 时间
	 * @param type 纸票1 电票2
	 */
	public List<Historyprice> findbyDayAndType(String day, String type, Integer cityId);
	
	/**
	 * 增加或更新记录（定时任务）
	 * @author GXW
	 * @param h
	 * @since 2016年5月26日
	 */
	public void saveOrUpdate(Historyprice h);
	
	/**
	 * 获取某个时间的最新交易城市列表
	 * @param day 时间
	 * @since 2016年6月7日
	 * @author BKY
	 */
	public List<Map<String, Object>> getCityListByDay(String day);
	
	/**
	 * 根据多报价条件查询（按照报价从小到大排序）
	 * @author WKX
	 * @param historyprice
	 * @since 2016年6月15日 下午7:27:43
	 */
	public List<Historyprice> getListOrderByPriceAsc(Historyprice historyprice);
	
	/**
	 * 查询orgcity
	 * @author GXW
	 * @since 2016年6月17日
	 */
	public List<Map<String, Object>> getCityList();
	
	/**
	 * 查询historyprice报价的城市,用于询价
	 * @author ZY
	 * @since 2016年6月17日
	 */
	public List<Map<String, Object>> getCity();
}