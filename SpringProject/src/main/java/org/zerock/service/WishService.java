package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Wish;

@Service
public class WishService {
	
	public int addWish(String memid, int gno) {
		return 1;
	};
	
	public int removeWish(String memid, int gno) {
		return 0;
	}
	
	public List<Wish> showMyWishes(String memid){
		return null;
	}

}
