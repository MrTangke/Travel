package com.zoubei.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.Tourist;
import com.zoubei.mapper.tourist.TouristMapper;
import com.zoubei.service.BloginService;
@Service("blogin")
public class BloginServiceImpl implements BloginService{
	@Autowired 
	private TouristMapper touristMapper;

	@Override
	public Tourist selectTourist(String touristNickname) {
		
		return touristMapper.selectTourist(touristNickname);
	}

	@Override
	public void insertRegister(Tourist tourist) {
		touristMapper.insertRegister(tourist);
		
	}

	
	
}
