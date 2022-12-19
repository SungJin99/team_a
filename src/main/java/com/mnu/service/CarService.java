package com.mnu.service;

import java.util.List;

import com.mnu.domain.CarAttachVO;
import com.mnu.domain.CarVO;
import com.mnu.domain.Criteria;

public interface CarService {
	
	public void register(CarVO vo);
	
	public CarVO get(Long carid);
	
	public boolean modify(CarVO vo);
	
	public boolean remove(Long carid);
	
	// public List<CarVO> getList();
	public List<CarVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<CarAttachVO> getCarAttachList(Long carid);
}
