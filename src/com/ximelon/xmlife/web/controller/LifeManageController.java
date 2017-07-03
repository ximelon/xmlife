package com.ximelon.xmlife.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ximelon.xmlife.bean.OperationResult;
import com.ximelon.xmlife.data.Album;
import com.ximelon.xmlife.web.service.ILifeManageService;

/**
 * 传记管理
 * 管理传记，传记载体包括：纪念册、文本、视频等类别
 * @author lijianfeng
 *
 */
@Controller
@RequestMapping("lifeManage")
public class LifeManageController {
	
	@Autowired
	private ILifeManageService lifeManageService;
	
	@RequestMapping("addLife.do")
	public ModelAndView addLife(){
		ModelAndView mav = new ModelAndView("life/addLife");
		return mav;
	}
	
	/**
	 * 首页加载
	 * @param request
	 * @return
	 */
	@RequestMapping("loadLifeList.do")
	public ModelAndView loadLifeList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("life/lifeList");
		List<Album> albumList = lifeManageService.getAllAlbum();
		mav.addObject("albumList", albumList);
		
//		String filePath = request.getSession().getServletContext().getRealPath("/") + "/upload/lifeImages/";  
//        File uploadDest = new File(filePath);  
//        String[] fileNames = uploadDest.list();  
////        for (int i = 0; i < fileNames.length; i++) {
////            fileNames[i] = filePath + fileNames[i];
////        }
//        mav.addObject("fileNames", fileNames);
		return mav;
	}
	
	@RequestMapping("saveLifeImages.do")
	@ResponseBody
	public OperationResult saveLifeImages(@RequestParam("imageFiles")MultipartFile[] imageFiles, HttpServletRequest request, Album album){
		if(null!=imageFiles && imageFiles.length>0){
			/*创建纪念册文件夹*/
			if(StringUtils.isBlank(album.getAlbumTitle())){
				return OperationResult.ERROR("");
			}
			
			File albumFolder = new File(request.getSession().getServletContext().getRealPath("/") + "/lifeAlbum/" + album.getAlbumTitle());
			if(!albumFolder.exists()){
				albumFolder.mkdirs();
			}
			
			for(MultipartFile file: imageFiles){
//				String fileName = file.getOriginalFilename();
//				String postfix = fileName.substring(fileName.lastIndexOf("."));
//				String uuidName = UUID.randomUUID().toString().replace("-","");
//				String filePath = albumFolder + File.separator + uuidName + postfix; 
				String filePath = albumFolder + File.separator + "background.jpg"; 
				album.setBackgroundImagePath(filePath);
				try {
					file.transferTo(new File(filePath));
				} catch (IOException e) {
					e.printStackTrace();
					return OperationResult.ERROR("");
				}
			}
			lifeManageService.saveLife(album);
			return OperationResult.OK(album.getId().toString());
		}
		return OperationResult.ERROR("");
	}
	
	@RequestMapping("toAlbumIndex.do")
	public ModelAndView toAlbumIndex(Long albumId){
		Album album = lifeManageService.getAlbumById(albumId);
		ModelAndView mav = new ModelAndView("album/albumIndex");
		return mav;
	}

}
