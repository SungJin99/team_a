package com.mnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnu.domain.ClientVO;
import com.mnu.domain.Criteria;
import com.mnu.mapper.ClientMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ClientServiceImpl implements ClientService {

	@Setter(onMethod_ = {@Autowired})
	private ClientMapper mapper;
	
	@Override
	public int register(ClientVO vo) {
		// TODO Auto-generated method stub
		log.info("register........" + vo);
		
		return mapper.insertSelectKey(vo);
	}

	@Override
	public ClientVO get(Long clientid) {
		// TODO Auto-generated method stub
		
		log.info("get......." + clientid);
		
		return mapper.read(clientid);
	}

	@Override
	public boolean modify(ClientVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.........." + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long clientid) {
		// TODO Auto-generated method stub
		log.info("remove.........." + clientid);
		
		return mapper.delete(clientid) == 1;
	}

	@Override
	public List<ClientVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get Client List..........");
		
		return mapper.getListWithPaging(cri);

	}
	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

//	@Override
//	public List<ClientVO> getList() {
//		// TODO Auto-generated method stub
//		log.info("getList plain");
//		return mapper.getList();
//	}

}
