package cn.mldn.travel.service.back;

import java.util.Map;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;

import cn.mldn.travel.vo.Dept;

public interface IDeptServiceBack {
	@RequiresRoles(value = {"emp"}, logical = Logical.OR)
	@RequiresPermissions(value = {"dept:edit"}, logical = Logical.OR)
	public boolean edit(Dept vo);
	/**
	 * 列出全部的部门的完整信息
	 * @return 返回的集合包含有如下数据：<br>
	 *         1、key = allDepts、value = 所有的部门信息集合；<br>
	 *         2、key = allEmps、value = 部门的所有领导信息集合。<br>
	 */
	@RequiresRoles(value = {"emp", "empshow"}, logical = Logical.OR)
	@RequiresPermissions(value = {"dept:list",
			"deptshow:list"}, logical = Logical.OR)
	public Map<String, Object> list();
}
