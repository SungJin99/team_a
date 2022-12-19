package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.RentVO;
import com.mnu.domain.Criteria;

public interface RentMapper {
	public int insert(RentVO rent);
	
	public int insertSelectKey(RentVO rent);
	
	public RentVO read(Long rentid);
	
	public int delete(Long rentid);
	
	public int update(RentVO rent);
	
	public List<RentVO> getCarList();
	
	public List<RentVO> getClientList();
	
	public List<RentVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
