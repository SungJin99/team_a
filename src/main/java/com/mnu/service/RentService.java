package com.mnu.service;

import java.util.List;

import com.mnu.domain.RentVO;
import com.mnu.domain.Criteria;

public interface RentService {
	
	public int register(RentVO vo);
	
	public RentVO get(Long rentid);
	
	public boolean modify(RentVO vo);
	
	public boolean remove(Long rentid);
	
	public List<RentVO> getCarList();
	
	public List<RentVO> getClientList();
	
	public List<RentVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
