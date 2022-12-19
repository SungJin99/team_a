package com.mnu.mapper;

import java.util.List;

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
public class ClientMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ClientMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(client -> log.info(client));
//	}
	
//	@Test
//	public void testInsert(){
//		ClientVO client =  new ClientVO();
//		client.setClientName("45하3517");
//		client.setDriverLiense("G80");
//		client.setPhoneNumber("검정");
//		
//		mapper.insert(client);
//		
//		log.info(client);
//	}
//
//	@Test
//	public void testInsertSelectKey() {
//		ClientVO client =  new ClientVO();
//		client.setClientName("55하2317");
//		client.setDriverLiense("G80");
//		client.setPhoneNumber("검정");
//		
//		mapper.insertSelectKey(client);
//		
//		log.info(client);
//	}
	
//	@Test
//	public void testRead() {
//		ClientVO client = mapper.read(3L);
//		
//		log.info(client);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete(2L));
//	}
	
//	@Test
//	public void testUpdate() {
//		ClientVO client = new ClientVO();
//		client.setClientid(4L);
//		client.setClientName("45허3328");
//		client.setDriverLiense("K3");
//		client.setPhoneNumber("검정");
//		int count = mapper.update(client);
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		List<ClientVO> list = mapper.getListWithPaging(cri);
//		list.forEach(client -> log.info(client));
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(1);
//		cri.setAmount(5);
//		
//		List<ClientVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(client -> log.info(client.getClientid()));
//	}
//	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("K");
		cri.setType("SN");
		
		List<ClientVO> list = mapper.getListWithPaging(cri);
		list.forEach(client -> log.info(client));
	}

}
