package com.mnu.service;

import java.util.List;

import com.mnu.domain.RepairVO;
import com.mnu.domain.Criteria;

public interface RepairService {
	
	public int register(RepairVO vo);
	
	public RepairVO get(Long repairid);
	
	public boolean modify(RepairVO vo);
	
	public boolean remove(Long repairid);
	
	public List<RepairVO> getCarList();
	
	public List<RepairVO> getCheckList();
	
	public List<RepairVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
