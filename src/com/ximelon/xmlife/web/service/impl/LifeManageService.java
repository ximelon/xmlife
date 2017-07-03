package com.ximelon.xmlife.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ximelon.xmlife.dao.IGenericDao;
import com.ximelon.xmlife.data.Album;
import com.ximelon.xmlife.web.service.ILifeManageService;

@Service
public class LifeManageService implements ILifeManageService {

	@Autowired
	private IGenericDao genericDao;
	
	@Override
	public void saveLife(Album album) {
		genericDao.saveObject(album);
	}

	@Override
	public List<Album> getAllAlbum() {
		return genericDao.getAllObject(Album.class);
	}

	@Override
	public Album getAlbumById(Long id) {
		return genericDao.getObject(Album.class, id);
	}

}
