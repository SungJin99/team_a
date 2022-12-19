package com.mnu.service;

import static org.junit.Assert.assertNotNull;

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
public class CarServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private CarService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		CarVO car =  new CarVO();
		car.setCarNumber("41하7521");
		car.setSeries("G80");
		car.setCarColor("검정");
		
		service.register(car);
		
		log.info("생성된 차량id, 차량번호:" + car.getCarNumber() + car.getCarid());
	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(car -> log.info(car));
//	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2, 5)).forEach(car -> log.info(car));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(11L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(3L));
	}
	
	@Test
	public void testUpdate(){
		CarVO car = service.get(4L);
		
		if(car == null) {
			return;
		}
		
		car.setSeries("K5");
		log.info("MODEFY RESULT: " + service.modify(car));
	}
}
