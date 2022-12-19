package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.CarVO;
import com.mnu.domain.Criteria;

public interface CarMapper {
	public int insert(CarVO car);
	
	public int insertSelectKey(CarVO car);
	
	public CarVO read(Long carid);
	
	public int delete(Long carid);
	
	public int update(CarVO car);
	
	public List<CarVO> getList();
	
	public List<CarVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
