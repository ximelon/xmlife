package com.ximelon.xmlife.test;

import static org.junit.Assert.assertEquals;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;

import com.ximelon.xmlife.web.controller.HomeController;

public class HomeControllerTest {
	
	@Test
	public void testHomePage() throws Exception {
		HomeController controller = new HomeController();
		MockMvc mockMvc = standaloneSetup(controller).build();
//		assertEquals("home", controller.home());
		mockMvc.perform(get("/")).andExpect(view().name("home"));
	}

}
