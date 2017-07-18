package com.ximelon.xmlife.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	private Logger logger = LoggerFactory.getLogger(LifeManageController.class);
	
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
	
	@RequestMapping("saveLife.do")
	@ResponseBody
	public OperationResult saveLife(Album album){
		
		try {
			lifeManageService.saveLife(album);
			logger.info("相册保存成功");
			return OperationResult.OK(album.getId().toString());
		} catch (Exception e) {
			logger.error("相册保存失败,{}", e.getMessage());
			return OperationResult.ERROR("");
		}
	}
	
	//使用bootstrap inputfile插件上传，不能压缩图片
//	@RequestMapping("saveLifeImages.do")
//	@ResponseBody
//	public OperationResult saveLifeImages(@RequestParam("imageFiles")MultipartFile[] imageFiles, HttpServletRequest request, Album album){
//		if(null!=imageFiles && imageFiles.length>0){
//			/*创建纪念册文件夹*/
//			if(StringUtils.isBlank(album.getAlbumTitle())){
//				return OperationResult.ERROR("");
//			}
//			
//			File albumFolder = new File(request.getSession().getServletContext().getRealPath("/") + Constant.LIFE_ALBUM_PATH + album.getAlbumTitle());
//			if(!albumFolder.exists()){
//				albumFolder.mkdirs();
//			}
//			
//			for(MultipartFile file: imageFiles){
////				String fileName = file.getOriginalFilename();
////				String postfix = fileName.substring(fileName.lastIndexOf("."));
////				String uuidName = UUID.randomUUID().toString().replace("-","");
////				String filePath = albumFolder + File.separator + uuidName + postfix; 
//				String filePath = albumFolder + File.separator + "background.jpg"; 
//				album.setBackgroundImagePath(Constant.LIFE_ALBUM_PATH + album.getAlbumTitle() + File.separator + "background.jpg");
//				try {
//					file.transferTo(new File(filePath));
//				} catch (IOException e) {
//					e.printStackTrace();
//					return OperationResult.ERROR("");
//				}
//			}
//			lifeManageService.saveLife(album);
//			return OperationResult.OK(album.getId().toString());
//		}
//		return OperationResult.ERROR("");
//	}
	

}
