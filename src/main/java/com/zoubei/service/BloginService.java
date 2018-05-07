package com.zoubei.service;

import com.zoubei.entity.tourist.Tourist;

public interface BloginService {

	Tourist selectTourist(String touristNickname);

	void insertRegister(Tourist tourist);

	



}
