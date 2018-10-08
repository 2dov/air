package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import sist.com.bean.AirScheduleBean;
import sist.com.bean.AirportBean;
import sist.com.bean.AppointmentBean;
import sist.com.bean.FellowBean;

public class AirLineDao extends SqlSessionDaoSupport {

	public List<AirportBean> airportSelect() {
		return this.getSqlSession().selectList("airportSelect");
	}

	public List<AirScheduleBean> airScheduleSearch(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("airScheduleSearch", map);
	}

	public int airScheduleTotalRow(HashMap<String, Object> map) {
		return this.getSqlSession().selectOne("airScheduleTotalRow", map);
	}

	@Transactional
	public String insertScheduleGetAno(AppointmentBean bean) {
		String a_no = this.getSqlSession().selectOne("getAppointmentSeq");
		bean.setA_no("A"+a_no);
		this.getSqlSession().insert("insertSchedule", bean);
		return "A"+a_no;
	}
	
	public void insertFellower(FellowBean bean) {
		this.getSqlSession().insert("insertFellower", bean);
	}
	
	public void updatePersons(HashMap<String, Object> map) {
		this.getSqlSession().update("updatePersons", map);
	}
}