package com.ximelon.xmlife.data;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
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
	
	private Set<PhotoPath> paths;		//照片存放路径
	
	private String mood;		//此刻心情内容
	
	private String uploadTime;	//上传时间
	
	private Album album;		//所属纪念册

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="PHOTO_ID")
	public Set<PhotoPath> getPaths() {
		return paths;
	}

	public void setPaths(Set<PhotoPath> paths) {
		this.paths = paths;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	@Column(name="UPLOAD_TIME")
	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
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
