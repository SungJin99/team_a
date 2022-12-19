package com.mnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mnu.domain.CarAttachVO;
import com.mnu.domain.CarVO;
import com.mnu.domain.Criteria;
import com.mnu.mapper.CarAttachMapper;
import com.mnu.mapper.CarMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CarServiceImpl implements CarService {

	@Setter(onMethod_ = {@Autowired})
	private CarMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private CarAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(CarVO vo) {
		// TODO Auto-generated method stub
		log.info("register........" + vo);
		
		mapper.insertSelectKey(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach ->{
			attach.setCarid(vo.getCarid());
			attachMapper.insert(attach);
		});
	}

	@Override
	public CarVO get(Long carid) {
		// TODO Auto-generated method stub
		
		log.info("get......." + carid);
		
		return mapper.read(carid);
	}
	

	@Override
	public boolean modify(CarVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.........." + vo);
		
		attachMapper.deleteAll(vo.getCarid());
		
		boolean modifyResult = mapper.update(vo) == 1;
		
		if(modifyResult && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach ->{
				attach.setCarid(vo.getCarid());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	@Override
	public boolean remove(Long carid) {
		// TODO Auto-generated method stub
		log.info("remove.........." + carid);
		
		attachMapper.deleteAll(carid);
		
		return mapper.delete(carid) == 1;
	}

	@Override
	public List<CarVO> getList(Criteria cri) {
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
	public List<CarAttachVO> getCarAttachList(Long carid) {
		// TODO Auto-generated method stub
		
		log.info("get Attach list by carid" + carid);
		
		return attachMapper.findByCarid(carid);
	}

//	@Override
//	public List<CarVO> getList() {
//		// TODO Auto-generated method stub
//		log.info("getList plain");
//		return mapper.getList();
//	}

}
