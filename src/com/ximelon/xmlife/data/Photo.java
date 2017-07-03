package com.ximelon.xmlife.data;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 照片
 * @author lijianfeng
 *
 */
@Entity
@Table(name="T_PHOTO")
public class Photo implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String path;	//照片存放路径
	
	private Album album;	//所属纪念册

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@ManyToOne
	@JoinColumn(name="ALBUM_ID")
	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}
}
