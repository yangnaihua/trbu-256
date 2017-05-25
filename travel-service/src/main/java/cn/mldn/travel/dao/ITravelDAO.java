package cn.mldn.travel.dao;

import java.util.List;

import cn.mldn.travel.vo.Travel;
import cn.mldn.travel.vo.TravelCost;
import cn.mldn.travel.vo.TravelEmp;
import cn.mldn.util.dao.IBaseDAO;

public interface ITravelDAO extends IBaseDAO<Long, Travel> {
	
	/**
	 * 获得指定的费用项对应的差旅信息的详情
	 * @param tcid 费用项
	 * @return 差旅信息
	 */
	public Travel findTravelByCost(long tcid) ;
	
	/**
	 * 移除某一个支出费用项
	 * @param tcid 费用的编号
	 * @return 成功返回true
	 */
	public boolean doRemoveTraveCost(long tcid) ;
	
	/**
	 * 查询出指定出差费用的全部费用信息
	 * @param tid 出差编号
	 * @return 费用信息
	 */
	public List<Travel> findAllTravelCost(long tid) ;
	
	/**
	 * 增加出差花费的信息项，需要考虑增长后的id问题
	 * @param vo 费用信息
	 * @return 保存成功返回true
	 */
	public boolean doCreateTravelCost(TravelCost vo) ;
	
	/**
	 * 进行travel_emp表的删除处理，根据差旅编号和雇员编号删除
	 * @param vo 包含有差旅编号、出差待选编号
	 * @return 删除成功返回true
	 */
	public boolean doRemoveTravelEmp(TravelEmp vo) ;
	
	/**
	 * 进行travel_emp表的处理
	 * @param vo 包含有差旅编号、出差待选编号
	 * @return 追加成功返回true
	 */
	public boolean doCreateTravelEmp(TravelEmp vo) ;
	
	/**
	 * 要进行指定的差旅信息的删除操作
	 * @param vo 包含有要删除的差旅编号以及要处理的用户编号
	 * @return 删除成功返回true
	 */
	public boolean doRemoveSelf(Travel vo) ;
}
