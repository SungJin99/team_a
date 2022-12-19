package com.mnu.mapper;

import java.util.List;

import com.mnu.domain.ClientVO;
import com.mnu.domain.Criteria;

public interface ClientMapper {
	public int insert(ClientVO client);
	
	public int insertSelectKey(ClientVO client);
	
	public ClientVO read(Long clientid);
	
	public int delete(Long clientid);
	
	public int update(ClientVO client);
	
	public List<ClientVO> getList();
	
	public List<ClientVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
