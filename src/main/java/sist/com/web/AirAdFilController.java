package sist.com.web;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.com.bean.AirScheduleBean;
import sist.com.dao.AirAdFilDao;

@Controller
public class AirAdFilController {
	@Inject 
	AirAdFilDao adFilDao;
	
	
	@RequestMapping(value="/managerView/AirAdFli.do")
	
	public String selectAirAdFilTable(Model model, HttpServletRequest request) {
		String searchOption= request.getParameter("searchOption");
		String searchText= request.getParameter("searchText");
		HashMap<String,String>map= new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchText", searchText);
				
		model.addAttribute("adFilList",adFilDao.selectScheduleFil(map));
		
		return "/managerView/AirAdFli";
	}
	
	@RequestMapping(value="/managerView/AirAdFliInfo.do")
	public String AirAdFliInfoPro(Model model,String S_NO) {
		AirScheduleBean scheduleBean= new AirScheduleBean();
		scheduleBean=(AirScheduleBean)adFilDao.selectScheduleInfo(S_NO);
		model.addAttribute("adFilInfoData",scheduleBean);	
		return "/managerView/AirAdFliInfo";
	}
	
	@RequestMapping(value="/managerView/editScheduleLoad.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AirScheduleBean> editScheduleLoad(){
		return adFilDao.editScheduleBean();
	}
	
	@RequestMapping(value="/managerView/insertScheduleList.do")
	public String AirAdFliInsertPro(AirScheduleBean airScheduleBean) {
		adFilDao.insertScheduleFil(airScheduleBean);
		
		return "redirect:AirAdFli.do";
	}
	
		
}
