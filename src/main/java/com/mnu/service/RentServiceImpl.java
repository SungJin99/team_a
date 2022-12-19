package com.mnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnu.domain.RentVO;
import com.mnu.domain.Criteria;
import com.mnu.mapper.RentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RentServiceImpl implements RentService {

	@Setter(onMethod_ = {@Autowired})
	private RentMapper mapper;
	
	@Override
	public int register(RentVO vo) {
		// TODO Auto-generated method stub
		log.info("register........" + vo);
		
		return mapper.insertSelectKey(vo);
	}

	@Override
	public RentVO get(Long rentid) {
		// TODO Auto-generated method stub
		
		log.info("get......." + rentid);
		
		return mapper.read(rentid);
	}

	@Override
	public boolean modify(RentVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.........." + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long rentid) {
		// TODO Auto-generated method stub
		log.info("remove.........." + rentid);
		
		return mapper.delete(rentid) == 1;
	}

	@Override
	public List<RentVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get RENT List..........");
		
		return mapper.getListWithPaging(cri);

	}
	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<RentVO> getCarList() {
		// TODO Auto-generated method stub
		log.info("getList plain");
		return mapper.getCarList();
	}
	
	@Override
	public List<RentVO> getClientList() {
		// TODO Auto-generated method stub
		log.info("getList plain");
		return mapper.getClientList();
	}

}
