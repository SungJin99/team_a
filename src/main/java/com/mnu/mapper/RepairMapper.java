package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.Criteria;
import com.mnu.domain.RepairVO;

public interface RepairMapper {
	public int insert(RepairVO repair);
	
	public int insertSelectKey(RepairVO repair);
	
	public RepairVO read(Long repairid);
	
	public int delete(Long repairid);
	
	public int update(RepairVO repair);
	
	public List<RepairVO> getCarList();
	
	public List<RepairVO> getCheckList();
	
	public List<RepairVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
