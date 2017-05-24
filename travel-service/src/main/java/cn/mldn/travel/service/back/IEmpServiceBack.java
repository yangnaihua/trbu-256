package cn.mldn.travel.service.back;

import java.util.Map;
import java.util.Set;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;

import cn.mldn.travel.exception.DeptManagerExistException;
import cn.mldn.travel.vo.Emp;

public interface IEmpServiceBack {
	/**
	 * 实现雇员信息的追加，该方法要执行如下的操作：<br>
	 * 1、要判断当前追加的雇员编号信息是否存在，如果存在则无法添加；<br>
	 * 2、随后根据增加雇员级别，来判断所在的部门情况，如果是该部门已经存在有经理，那么将无法进行保存，应该抛出异常；<br>
	 * 3、判断当前操作者的级别是否为经理，如果为经理才可以进行经理相关处理；<br>
	 * 3、之后要求将雇员的雇佣日期设置为今天的日期；<br>
	 * 4、进行雇员信息的保存；
	 * @param vo 包含有新雇员的信息
	 * @return 增加成功返回true，如果重名或增加失败返回false
	 * @throws DeptManagerExistException 如果现在该部门存在有经理，则抛出此异常
	 */
	public boolean add(Emp vo) throws DeptManagerExistException ;
	
	/**
	 * 进行雇员数据追加前的信息查询处理，该方法要执行如下操作：<br/>
	 * 1、调用IDeptDAO.findAll()取得全部的部门信息；<br/>
	 * 2、调用ILevelDAO.findAll()取得全部的级别信息；<br/>
	 * @return 返回有如下的数据内容：<br>
	 * 1、key = allDepts、value = 全部部门信息；<br>
	 * 2、key = allLevels、value = 全部的级别信息；<br>
	 */
	public Map<String,Object> getAddPre() ;
	
	/**
	 * 查看一个雇员的完整信息，包括雇员的基本信息以及所在部门信息
	 * @param eid 雇员编号
	 * @return 返回的信息包含有如下内容：<br>
	 * 1、key = emp、value = 雇员的详细信息；<br>
	 * 2、key = dept、value = 部门的详细信息；<br>
	 * 3、key = level、value = 雇员级别信息；<br>
	 */
	@RequiresRoles(value = { "emp", "empshow" }, logical = Logical.OR)
	@RequiresPermissions(value = { "emp:edit", "empshow:get" }, logical = Logical.OR)
	public Map<String,Object> getDetails(String eid) ;
	
	
	/**
	 * 根据雇员id获得雇员完整信息
	 * @param eid 雇员编号
	 * @return 包括如下内容：<br>
	 * 1、key = emp、value = 雇员对象，如果该雇员不存在返回null<br>
	 * 2、如果雇员信息可以查询成功，则查询对应级别信息。key = level
	 */
	public Map<String,Object> get(String eid,String password) ;
	/**
	 * 根据雇员编号取得雇员对应的角色与权限数据信息，该操作主要执行如下功能：<br>
	 * 1、调用IRoleDAO.findAllIdByEmp()查询出所有的角色标记信息；<br>
	 * 2、调用IActionDAO.findAllIdByEmp()查询出所有的权限标记信息；<br>
	 * @param eid 要查询角色和权限的雇员编号
	 * @return 返回Map集合数据包含有如下内容：<br>
	 * 1、key = allRoles、value = 所有的角色标记信息；<br>
	 * 2、key = allActions、value = 所有的权限标记信息；<br>
	 */
	public Map<String,Set<String>> listRoleAndAction(String eid) ;
}
