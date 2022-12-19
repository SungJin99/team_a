package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.CarAttachVO;

public interface CarAttachMapper {
	public void insert(CarAttachVO vo);
	
	public int delete(String uuid);
	
	public List<CarAttachVO> findByCarid(Long carid);
	
	public int deleteAll(Long carid);
	
	public List<CarAttachVO> getOldFiles();
}
