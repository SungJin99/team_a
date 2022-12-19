package com.mnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnu.domain.RepairVO;
import com.mnu.domain.Criteria;
import com.mnu.mapper.RepairMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RepairServiceImpl implements RepairService {

	@Setter(onMethod_ = {@Autowired})
	private RepairMapper mapper;
	
	@Override
	public int register(RepairVO vo) {
		// TODO Auto-generated method stub
		log.info("register........" + vo);
		
		return mapper.insertSelectKey(vo);
	}

	@Override
	public RepairVO get(Long repairid) {
		// TODO Auto-generated method stub
		
		log.info("get......." + repairid);
		
		return mapper.read(repairid);
	}

	@Override
	public boolean modify(RepairVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.........." + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long repairid) {
		// TODO Auto-generated method stub
		log.info("remove.........." + repairid);
		
		return mapper.delete(repairid) == 1;
	}

	@Override
	public List<RepairVO> getList(Criteria cri) {
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
	public List<RepairVO> getCarList() {
		// TODO Auto-generated method stub
		log.info("getList plain");
		return mapper.getCarList();
	}
	
	@Override
	public List<RepairVO> getCheckList() {
		// TODO Auto-generated method stub
		log.info("getList plain");
		return mapper.getCheckList();
	}

}
