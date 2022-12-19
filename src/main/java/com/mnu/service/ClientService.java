package com.mnu.service;

import java.util.List;

import com.mnu.domain.ClientVO;
import com.mnu.domain.Criteria;

public interface ClientService {
	
	public int register(ClientVO vo);
	
	public ClientVO get(Long clientid);
	
	public boolean modify(ClientVO vo);
	
	public boolean remove(Long clientid);
	
	// public List<ClientVO> getList();
	public List<ClientVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
