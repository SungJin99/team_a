package com.mnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnu.domain.Criteria;
import com.mnu.domain.RepairCheckListVO;
import com.mnu.mapper.RepairCheckListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RepairCheckListServiceImpl implements RepairCheckListService {

	@Setter(onMethod_ = {@Autowired})
	private RepairCheckListMapper mapper;
	
	@Override
	public int register(RepairCheckListVO vo) {
		// TODO Auto-generated method stub
		log.info("register........" + vo);
		
		return mapper.insertSelectKey(vo);
	}

	@Override
	public RepairCheckListVO get(Long repairCheckList) {
		// TODO Auto-generated method stub
		
		log.info("get......." + repairCheckList);
		
		return mapper.read(repairCheckList);
	}

	@Override
	public boolean modify(RepairCheckListVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.........." + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long repairCheckList) {
		// TODO Auto-generated method stub
		log.info("remove.........." + repairCheckList);
		
		return mapper.delete(repairCheckList) == 1;
	}

	@Override
	public List<RepairCheckListVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get RENTCAR List..........");
		
		return mapper.getListWithPaging(cri);

	}
	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<RepairCheckListVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
}
