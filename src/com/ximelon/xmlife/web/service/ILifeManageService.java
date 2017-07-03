package com.ximelon.xmlife.web.service;

import java.util.List;

import com.ximelon.xmlife.data.Album;

public interface ILifeManageService {
	
	/**
	 * 保存纪念册
	 * @param album
	 */
	public void saveLife(Album album);
	
	/**
	 * 获取所有纪念册
	 * @return
	 */
	public List<Album> getAllAlbum();
	
	/**
	 * 根据ID获取单个纪念册
	 * @param id
	 * @return
	 */
	public Album getAlbumById(Long id);

}
