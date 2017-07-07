package com.ximelon.xmlife.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ximelon.xmlife.dao.IGenericDao;
import com.ximelon.xmlife.data.Photo;
import com.ximelon.xmlife.web.service.IAlbumManageService;

@Service
public class AlbumManageService implements IAlbumManageService {
	
	@Autowired
	private IGenericDao genericDao;

	@Override
	public void savePhotos(Photo photo) {
		genericDao.saveObject(photo);
	}

}
