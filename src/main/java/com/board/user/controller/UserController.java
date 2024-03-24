package com.board.user.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.user.domain.UserVo;
import com.board.user.mapper.UserMapper;

@Controller
@RequestMapping("/Users")
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	//  /Users/List
	@RequestMapping("/List")
	public ModelAndView list() {
		// 목록 조회
		List<UserVo> userList = userMapper.getUserList();
		
		ModelAndView  mv      = new ModelAndView();
		mv.addObject( "userList",  userList  );
		mv.setViewName("users/list");
		
		return mv;
	}
	
	//  /Users/WriteForm
	@RequestMapping("/WriteForm")
	public  ModelAndView   writeForm() {
		
		ModelAndView    mv    = new ModelAndView();
		LocalDateTime   today = LocalDateTime.now();
		String          now   = today.format(
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss:SSSS")); 
		DayOfWeek       wkday = today.getDayOfWeek();	
		now                  += " " + wkday; 
		mv.addObject("now", now);
		mv.setViewName("users/write");
		return  mv;
		
	}
	
	//  /Users/Write
	@RequestMapping("/Write")
	public  ModelAndView  write( UserVo  userVo ) {
		System.out.println();
		// Commit
		userMapper.insertUser( userVo );		
		
		// data 가지고 이동 
		ModelAndView   mv   =  new  ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return   mv;
	}
	
}
