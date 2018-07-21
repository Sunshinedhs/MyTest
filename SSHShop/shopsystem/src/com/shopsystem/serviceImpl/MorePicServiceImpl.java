package com.shopsystem.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.daoImpl.MorePicDaoImpl;
import com.shopsystem.domain.MorePic;

@Transactional
public class MorePicServiceImpl {
	private MorePicDaoImpl morePicDaoImpl;

	public void setMorePicDaoImpl(MorePicDaoImpl morePicDaoImpl) {
		this.morePicDaoImpl = morePicDaoImpl;
	}
	public void add(MorePic morePic){
		morePicDaoImpl.add(morePic);
	}
}
