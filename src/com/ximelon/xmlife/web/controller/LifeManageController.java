package com.ximelon.xmlife.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ximelon.xmlife.data.Album;

/**
 * 传记管理
 * 管理传记，传记载体包括：纪念册、文本、视频等类别
 * @author lijianfeng
 *
 */
@Controller
@RequestMapping("lifeManage")
public class LifeManageController {
	
	@RequestMapping("addLife.do")
	public ModelAndView addLife(){
		ModelAndView mav = new ModelAndView("addLife");
		return mav;
	}
	
	/**
	 * 首页加载
	 * @param request
	 * @return
	 */
	@RequestMapping("loadLifeList.do")
	public ModelAndView loadLifeList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("lifeList");
		String filePath = request.getSession().getServletContext().getRealPath("/") + "/upload/lifeImages/";  
        File uploadDest = new File(filePath);  
        String[] fileNames = uploadDest.list();  
//        for (int i = 0; i < fileNames.length; i++) {
//            fileNames[i] = filePath + fileNames[i];
//        }
        mav.addObject("fileNames", fileNames);
		return mav;
	}
	
	@RequestMapping("saveLifeImages.do")
	@ResponseBody
	public String saveLifeImages(@RequestParam("imageFiles")MultipartFile[] imageFiles, HttpServletRequest request, Album album){
		if(null!=imageFiles && imageFiles.length>0){
			/*创建纪念册文件夹*/
			if(StringUtils.isBlank(album.getAlbumTitle())){
				return null;
			}
			
			File albumFolder = new File(request.getSession().getServletContext().getRealPath("/") + "/lifeAlbum/" + album.getAlbumTitle());
			if(!albumFolder.exists()){
				albumFolder.mkdirs();
			}
			
			for(MultipartFile file: imageFiles){
				String fileName = file.getOriginalFilename();
				String postfix = fileName.substring(fileName.lastIndexOf("."));
				String uuidName = UUID.randomUUID().toString().replace("-","");
				String filePath = albumFolder + File.separator + uuidName + postfix; 
				try {
					file.transferTo(new File(filePath));
				} catch (IOException e) {
					e.printStackTrace();
					return "ERROR";
				}
			}
			return "OK";
		}
		return "ERROR";
	}
	
	@RequestMapping("toAlbumIndex.do")
	public ModelAndView toAlbumIndex(){
		ModelAndView mav = new ModelAndView("albumIndex");
		return mav;
	}

}
