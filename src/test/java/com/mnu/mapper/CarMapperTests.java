package com.mnu.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mnu.domain.CarVO;
import com.mnu.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CarMapperTests {
	@Setter(onMethod_ = @Autowired)
	private CarMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(car -> log.info(car));
//	}
	
//	@Test
//	public void testInsert(){
//		CarVO car =  new CarVO();
//		car.setCarNumber("45하3517");
//		car.setSeries("G80");
//		car.setCarColor("검정");
//		
//		mapper.insert(car);
//		
//		log.info(car);
//	}
//
//	@Test
//	public void testInsertSelectKey() {
//		CarVO car =  new CarVO();
//		car.setCarNumber("55하2317");
//		car.setSeries("G80");
//		car.setCarColor("검정");
//		
//		mapper.insertSelectKey(car);
//		
//		log.info(car);
//	}
	
//	@Test
//	public void testRead() {
//		CarVO car = mapper.read(3L);
//		
//		log.info(car);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete(2L));
//	}
	
//	@Test
//	public void testUpdate() {
//		CarVO car = new CarVO();
//		car.setCarid(4L);
//		car.setSeries("K3");
//		car.setCarColor("검정");
//		car.setCarNumber("45허3328");
//		int count = mapper.update(car);
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		List<CarVO> list = mapper.getListWithPaging(cri);
//		list.forEach(car -> log.info(car));
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(1);
//		cri.setAmount(5);
//		
//		List<CarVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(car -> log.info(car.getCarid()));
//	}
//	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("K");
		cri.setType("SN");
		
		List<CarVO> list = mapper.getListWithPaging(cri);
		list.forEach(car -> log.info(car));
	}

}
