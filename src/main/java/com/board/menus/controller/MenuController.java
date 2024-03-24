package com.board.menus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;

@Controller
@RequestMapping("/Menus")
public class MenuController {
	
	@Autowired
	private  MenuMapper  menuMapper;
	
	// 메뉴 목록 조회  /Menus/List
	@RequestMapping("/List")   
	public   String   list( Model model ) {
		// 조회결과 -> ArrayList 로 돌려줌 
		List<MenuVo> menuList = menuMapper.getMenuList();
				
		// 조회 결과 넘겨줌 ( Model )
		model.addAttribute( "menuList", menuList );
		//System.out.println( "MenuController list() menuList:" + menuList );
		
		return "menus/list";
	}
	
	//-------------------------------
	
	// 메뉴 입력받는 화면  /Menus/WriteForm
	// @RequestMapping("/Menus/WriteForm")
	@RequestMapping("/WriteForm")   // /Menus/WriteForm
	public   String   writeForm() {
		return "menus/write";  // /WEB-INF/views/ + menus/write + .jsp
	}
			
	// Menu Commit
	// /Menus/Write?menu_id=MENU02&menu_name=JSP&menu_seq=2
	// @RequestMapping("/Menus/Write")
	@RequestMapping("/Write")  
	// public   String   write( 
	// String menu_id, String menu_name, int menu_seq) { 
	// 인식 error     menu_id 못 찾음
	public   String   write( MenuVo  menuVo, Model model ) {   // Vo 로 작업. 
		// 넘어온 데이터를 db 에 저장하고		
		menuMapper.insertMenu( menuVo );
		// menuMapper.insertMenu(menu_id, menu_name, menu_seq); // error
		
		return  "redirect:/Menus/List";
		
		//List<MenuVo>  menuList = menuMapper.getMenuList();
		//model.addAttribute("menuList", menuList);
		
	    //	return "menus/list";    // menus/list.jsp  
	}
	
	//--------------------------
	// /Menus/WriteForm2
	@RequestMapping("/WriteForm2")
	public  String  writeForm2() {
		
		return "menus/write2";
		
	}
	
	@RequestMapping("/Write2")
	public  String  write2(MenuVo menuVo) {
		// Commit
		menuMapper.insertMenuByName( menuVo  );
		
		// 조회로 이동 
		return  "redirect:/Menus/List";
	} 	
	
	//---------------------------------------	
	// Menu Delete /Menus/Delete?menu_id=MENU03	
	@RequestMapping("/Delete")
	@ResponseBody
	public  String   delete( MenuVo menuVo ) {
		
		menuMapper.deleteMenu( menuVo );
		
		String html  =  "<script>";
		html        +=  "alert('삭제되었습니다');";
		html        +=  "location.href='/Menus/List';";
		html        +=  "</script>";		
		return    html;
	}	
	
	/*
	// Menu Delete /Menus/Delete?menu_id=MENU03
	@RequestMapping("/Delete")
	public   String   delete( MenuVo menuVo, Model model ) {
		
		// MENU03 delete
		menuMapper.deleteMenu( menuVo );				
		
		return  "redirect:/Menus/List";
		
		// 재조회 후 model 에 담음 
		//List<MenuVo>  menuList  =  menuMapper.getMenuList();				
		//model.addAttribute("menuList", menuList );
		
		// 이동할 파일
		//return "menus/list";
		
	}
	*/
	
	//-----------------------------
	// MENU Update
	//-----------------------------
	// /Menus/UpdateForm?menu_id=MENU04
	@RequestMapping("/UpdateForm")
	public  String  updateForm(MenuVo menuVo, Model model) {
		System.out.println("menuVo:" + menuVo);
		String  menu_id = menuVo.getMenu_id();
		
		// 수정할 데이터를 menu_id 조회
		MenuVo  menu  = menuMapper.getMenu( menu_id );
		
		// 조회한 내용을 모델에 담음 
		model.addAttribute("menu", menu);
		
		return  "menus/update";
	}
	
	// /Menus/Update?menu_id=MENU01&menu_name=JAVA&menu_seq=1
	@RequestMapping("/Update")
	public  String   update( MenuVo menuVo  ) {
		
		// Update
		menuMapper.updateMenu( menuVo  );
				
		// Update 후 조회
		return  "redirect:/Menus/List";  		  
	}
	
}

