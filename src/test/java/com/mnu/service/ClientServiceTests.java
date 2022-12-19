package com.mnu.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mnu.domain.ClientVO;
import com.mnu.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ClientServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private ClientService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		ClientVO car =  new ClientVO();
		car.setClientName("41하7521");
		car.setDriverLicense("G80");
		car.setPhoneNumber("검정");
		
		service.register(car);
		
		log.info("생성된 차량id, 차량번호:" + car.getClientName() + car.getClientid());
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
		ClientVO car = service.get(4L);
		
		if(car == null) {
			return;
		}
		
		car.setDriverLicense("K5");
		log.info("MODEFY RESULT: " + service.modify(car));
	}
}
