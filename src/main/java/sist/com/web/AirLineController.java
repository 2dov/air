package sist.com.web;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.com.bean.AirScheduleBean;
import sist.com.bean.AirportBean;
import sist.com.bean.AppointmentBean;
import sist.com.bean.FellowBean;
import sist.com.dao.AirLineDao;
import sist.com.dao.MemberDao;

@Controller
public class AirLineController {
	@Inject
	AirLineDao dao;
	@Inject
	MemberDao mdao;

	@RequestMapping(value = "/customerView/airportLoad.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AirportBean> airportLoad() {
		return dao.airportSelect();
	}

	@RequestMapping(value = "/customerView/airScheduleSearch.do")
	public String airScheduleSearchList(Model model, AirScheduleBean bean,
			@RequestParam(value = "way", required = false) String way, String page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("map") != null) {
			map = (HashMap<String, Object>) session.getAttribute("map");
		} else {
			map.put("depart", bean.getAp_no());
			map.put("return", bean.getAp_no2());
			map.put("departtime", bean.getDeparttime());
			map.put("returntime", bean.getArrivaltime());
			map.put("persons", bean.getSeat());
		}

		if (session.getAttribute("way") != null) {
			way = (String) session.getAttribute("way");
		}

		int totalRow = dao.airScheduleTotalRow(map);

		int pageScale = 10;
		int currentPage = 1;
		int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
		if (totalRow == 0)
			totalPage = 1;
		try {
			currentPage = Integer.parseInt(page);
		} catch (Exception e) {
		}

		int end = currentPage * pageScale;
		int start = end - pageScale + 1;

		map.put("start", start);
		map.put("end", end);

		List<AirScheduleBean> departList = dao.airScheduleSearch(map);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("list", departList);

		session.setAttribute("map", map);
		session.setAttribute("way", way);
		session.setMaxInactiveInterval(180);

		return "/customerView/airSchedule_searchList";
	}

	@RequestMapping(value = "/customerView/checkRound.do")
	public String checkRound(Model model, HttpSession session, AirScheduleBean bean) {
		session.setAttribute("departList", bean);
		session.setMaxInactiveInterval(180);

		if (session.getAttribute("way").equals("roundtrip")) {
			return "redirect:airScheduleSearchReturn.do";
		}
		return "redirect:reservationPage.do";
	}

	@RequestMapping(value = "/customerView/reservationPage.do")
	public String reservationPageProcess(Model model, HttpSession session, AirScheduleBean bean) {
		AirScheduleBean departList = (AirScheduleBean) session.getAttribute("departList");
		model.addAttribute("departList", departList);
		model.addAttribute("departS_no", departList.getS_no());
		model.addAttribute("member", mdao.selectMemberByNo((Integer) session.getAttribute("no")));
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("map");
		model.addAttribute("persons", map.get("persons"));

		if (session.getAttribute("way").equals("roundtrip")) {
			model.addAttribute("way", "roundtrip");
			model.addAttribute("returnList", bean);
			model.addAttribute("returnS_no", bean.getS_no());
		}

		return "/customerView/airSchedule_reservation";
	}

	@RequestMapping(value = "/customerView/airScheduleSearchReturn.do")
	public String airScheduleSearchReturn(Model model, HttpSession session, String page) {

		model.addAttribute("departList", (AirScheduleBean) session.getAttribute("departList"));

		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("map");
		System.out.println(map);
		if (page == null) {
			String temp;
			temp = (String) map.get("depart");
			map.put("depart", map.get("return"));
			map.put("return", temp);
			map.put("departtime", (String) map.get("returntime"));
			map.put("returntime", null);
		}

		int totalRow = dao.airScheduleTotalRow(map);

		int pageScale = 10;
		int currentPage = 1;
		int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
		if (totalRow == 0)
			totalPage = 1;
		try {
			currentPage = Integer.parseInt(page);
		} catch (Exception e) {
		}

		int end = currentPage * pageScale;
		int start = end - pageScale + 1;

		map.put("start", start);
		map.put("end", end);

		List<AirScheduleBean> returnList = dao.airScheduleSearch(map);

		session.setAttribute("map", map);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("list", returnList);

		return "/customerView/airSchedule_searchList_round";
	}

	@RequestMapping(value = "/customerView/appointInsert.do")
	public String appointInsert(String departSchedule, String returnSchedule, String persons, String hanname1,
			String hanname2, String hanname3, String lastname1, String lastname2, String lastname3, String firstname1,
			String firstname2, String firstname3, String birth1, String birth2, String birth3, HttpSession session) {

		AppointmentBean departabean = new AppointmentBean();
		departabean.setS_no(departSchedule);
		departabean.setNo((Integer) session.getAttribute("no"));

		String a_no = dao.insertScheduleGetAno(departabean);
		
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("s_no", departSchedule);
		map.put("persons",persons);
		dao.updatePersons(map);
		
		for (int i = 0; i < Integer.parseInt(persons); i++) {
			FellowBean fbean = new FellowBean();
			fbean.setA_no(a_no);
			switch (i) {
			case 0:
				fbean.setFellower_firstname(firstname1);
				fbean.setFellower_lastname(lastname1);
				fbean.setFellower_name_han(hanname1);
				fbean.setFellower_birth(birth1);
				break;

			case 1:
				fbean.setFellower_firstname(firstname2);
				fbean.setFellower_lastname(lastname2);
				fbean.setFellower_name_han(hanname2);
				fbean.setFellower_birth(birth2);
				break;

			case 2:
				fbean.setFellower_firstname(firstname3);
				fbean.setFellower_lastname(lastname3);
				fbean.setFellower_name_han(hanname3);
				fbean.setFellower_birth(birth3);
				break;
			}
			dao.insertFellower(fbean);
		}

		if (session.getAttribute("way").equals("roundtrip")) {
			AppointmentBean returnBean = new AppointmentBean();
			returnBean.setS_no(returnSchedule);
			returnBean.setNo((Integer) session.getAttribute("no"));

			a_no = dao.insertScheduleGetAno(returnBean);
			
			map.put("s_no", returnSchedule);
			map.put("persons",persons);
			dao.updatePersons(map);
			
			for (int i = 0; i < Integer.parseInt(persons); i++) {
				FellowBean fbean = new FellowBean();
				fbean.setA_no(a_no);
				switch (i) {
				case 0:
					fbean.setFellower_firstname(firstname1);
					fbean.setFellower_lastname(lastname1);
					fbean.setFellower_name_han(hanname1);
					fbean.setFellower_birth(birth1);
					break;

				case 1:
					fbean.setFellower_firstname(firstname2);
					fbean.setFellower_lastname(lastname2);
					fbean.setFellower_name_han(hanname2);
					fbean.setFellower_birth(birth2);
					break;

				case 2:
					fbean.setFellower_firstname(firstname3);
					fbean.setFellower_lastname(lastname3);
					fbean.setFellower_name_han(hanname3);
					fbean.setFellower_birth(birth3);
					break;
				}
				dao.insertFellower(fbean);
			}
		}

		return "/customerView/airSchedule_success";
	}
}
