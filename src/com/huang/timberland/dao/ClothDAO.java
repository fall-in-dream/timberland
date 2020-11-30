package com.huang.timberland.dao;

import com.huang.timberland.domain.Cloth;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import java.util.Collection;
import java.util.List;


public interface ClothDAO{

	/**
	 * 根据 id 获取指定 Cloth 对象
	 * @param id
	 * @return
	 */
	public abstract Cloth getCloth(int id);

	/**
	 * 根据传入的 CriteriaComputer 对象返回对应的 Page 对象
	 * @param cc
	 * @return
	 */
	public abstract Page<Cloth> getPage(CriteriaCloth cc);

	/**
	 * 根据传入的 CriteriaComputer 对象返回其对应的记录数
	 * @param cc
	 * @return
	 */
	public abstract long getTotalClothNumber(CriteriaCloth cc);

	/**
	 * 根据传入的 CriteriaComputer 和 pageSize 返回当前页对应的 List
	 * @param cc
	 * @param pageSize
	 * @return
	 */
	public abstract List<Cloth> getPageList(CriteriaCloth cc, int pageSize);

}
