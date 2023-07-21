package org.zerock.controller;


import static org.hamcrest.CoreMatchers.is;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.service.PriceService;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
@Log4j
@ExtendWith
public class PriceControllerTests {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Mock
	private PriceService service;
	
	@Before
	public void setup() {
		this.mockMvc= MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
    @Test
    @DisplayName("가격 반환 테스트")
    public void getPrice() throws Exception {
        if (this.service == null || this.mockMvc == null) {
            System.out.println("null");
        }
        int result = 30000;
        given(service.calcPrice(100,300).willReturn(result));

        mockMvc.perform(get("/api/some/" + this.someDto.getId().toString()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id", is(this.someDto.getId().toString())))
            .andExpect(jsonPath("$.someName", is("Some1")));
    }

}
