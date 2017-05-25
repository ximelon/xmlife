package com.ximelon.xmlife.web.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("index")
public class HomeController {
	
	@RequestMapping(method=GET)
	public String home() {
		return "home";
	}
	
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
	public String saveLifeImages(@RequestParam("imageFiles")MultipartFile[] imageFiles, HttpServletRequest request){
		if(null!=imageFiles && imageFiles.length>0){
			for(MultipartFile file: imageFiles){
				String filePath = request.getSession().getServletContext().getRealPath("/") + "/upload/lifeImages/"  
		                + file.getOriginalFilename(); 
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

}
