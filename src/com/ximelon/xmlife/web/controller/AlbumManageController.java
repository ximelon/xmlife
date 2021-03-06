package com.ximelon.xmlife.web.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ximelon.xmlife.bean.OperationResult;
import com.ximelon.xmlife.data.Album;
import com.ximelon.xmlife.data.Photo;
import com.ximelon.xmlife.data.PhotoPath;
import com.ximelon.xmlife.web.service.IAlbumManageService;
import com.ximelon.xmlife.web.service.ILifeManageService;
import com.ximelon.xmlife.web.util.Constant;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("albumManage")
public class AlbumManageController {
	
	private Logger logger = LoggerFactory.getLogger(AlbumManageController.class);
	
	@Autowired
	private ILifeManageService lifeManageService;
	
	@Autowired
	private IAlbumManageService albumManageService;
	
	@RequestMapping("toAlbumIndex.do")
	public ModelAndView toAlbumIndex(Long albumId){
		Album album = lifeManageService.getAlbumById(albumId);
		ModelAndView mav = new ModelAndView("album/albumIndex");
		mav.addObject("album", album);
		return mav;
	}
	
	@RequestMapping("addPhoto.do")
	public ModelAndView addPhoto(Long albumId){
		ModelAndView mav = new ModelAndView("album/addPhoto");
		mav.addObject("albumId", albumId);
		return mav;
	}
	
	/*
	 * 压缩图片上传
	 */
	@RequestMapping("savePhoto.do")
	@ResponseBody
	public OperationResult savePhoto(String dataUrls, String mood, Long albumId){
		try {
			Album album = lifeManageService.getAlbumById(albumId);
			Photo photo = new Photo();
			photo.setMood(mood);
			Date now = new Date();
			photo.setUploadTime(Constant.SDF_YMDHMS.format(now));
			Set<PhotoPath> paths = new HashSet<PhotoPath>();
			JSONArray jsonArray = JSONArray.fromObject(dataUrls);
			Object[] dataUrlList = jsonArray.toArray();
			for (Object dataUrl : dataUrlList) {
				PhotoPath path = new PhotoPath();
				path.setPath(dataUrl.toString());
				paths.add(path);
			}
			photo.setPaths(paths);
			photo.setAlbum(album);
			albumManageService.savePhotos(photo);
			logger.info("图片保存成功，{}", photo.getId());
			return OperationResult.OK(album.getId().toString());
		} catch (Exception e) {
			logger.error("图片保存失败！{}", e.getMessage());
			return OperationResult.ERROR("");
		}
	}
	
	//使用bootstrap inputfile插件上传，不能压缩图片
//	@RequestMapping("savePhotos.do")
//	@ResponseBody
//	public OperationResult savePhotos(@RequestParam("imageFiles")MultipartFile[] imageFiles, HttpServletRequest request, Photo photo, Long albumId){
//		if(null!=imageFiles && imageFiles.length>0){
//			Album album = lifeManageService.getAlbumById(albumId);
//			Date now = new Date();
//			photo.setUploadTime(Constant.SDF_YMDHMS.format(now));
//			String date = Constant.SDF_YMD.format(now);
//			
//			/*按日期创建目录*/
//			File dateFolder = new File(request.getSession().getServletContext().getRealPath("/") + Constant.LIFE_ALBUM_PATH + album.getAlbumTitle() + File.separator + date);
//			if(!dateFolder.exists()){
//				dateFolder.mkdirs();
//			}
//			
//			Set<PhotoPath> paths = new HashSet<PhotoPath>();
//			
//			for(MultipartFile file: imageFiles){
//				String fileName = file.getOriginalFilename();
//				String postfix = fileName.substring(fileName.lastIndexOf("."));
//				String uuidName = UUID.randomUUID().toString().replace("-","");
//				String filePath = dateFolder + File.separator + uuidName + postfix;
//				
//				PhotoPath path = new PhotoPath();
//				path.setPath(Constant.LIFE_ALBUM_PATH + album.getAlbumTitle() + File.separator + date + File.separator + uuidName + postfix);
////				String filePath = dateFolder + File.separator + "background.jpg";
//				try {
//					file.transferTo(new File(filePath));
//					paths.add(path);
//				} catch (IOException e) {
//					e.printStackTrace();
//					return OperationResult.ERROR("");
//				}
//			}
//			photo.setPaths(paths);
//			photo.setAlbum(album);
//			albumManageService.savePhotos(photo);
//			return OperationResult.OK(album.getId().toString());
//		}
//		return OperationResult.ERROR("");
//	}

}
