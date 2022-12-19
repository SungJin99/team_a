package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.Criteria;
import com.mnu.domain.RepairCheckListVO;

public interface RepairCheckListMapper {
	public int insert(RepairCheckListVO checkListid);
	
	public int insertSelectKey(RepairCheckListVO vo);
	
	public RepairCheckListVO read(Long checkListidid);
	
	public int delete(Long checkListidid);
	
	public int update(RepairCheckListVO vo);
	
	public List<RepairCheckListVO> getList();
	
	public List<RepairCheckListVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
