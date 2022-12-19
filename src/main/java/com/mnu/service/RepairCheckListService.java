package com.mnu.service;

import java.util.List;

import com.mnu.domain.RepairCheckListVO;
import com.mnu.domain.Criteria;

public interface RepairCheckListService {
	
	public int register(RepairCheckListVO vo);
	
	public RepairCheckListVO get(Long repairCheckList);
	
	public boolean modify(RepairCheckListVO vo);
	
	public boolean remove(Long repairCheckList);
	
	public List<RepairCheckListVO> getList();
	
	public List<RepairCheckListVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
