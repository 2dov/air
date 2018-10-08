package sist.com.dao;

import java.util.HashMap;
import java.util.List;


import org.mybatis.spring.support.SqlSessionDaoSupport;

import sist.com.bean.AirScheduleBean;



public class AirAdFilDao extends SqlSessionDaoSupport {

	public List<AirScheduleBean>selectScheduleFil(HashMap<String,String>map){
		return this.getSqlSession().selectList("selectScheduleFil",map);
	}
	// 검색할 때
	
	public  void insertScheduleFil(AirScheduleBean airScheduleBean) {
	
		this.getSqlSession().insert("insertScheduleFil",airScheduleBean);		
	}
	// 추가할 때 
		
	public  Object selectScheduleInfo(String sNo) {
		return this.getSqlSession().selectOne("selectScheduleInfo",sNo);
	}
	// 상세정보일 때
	public List<AirScheduleBean> editScheduleBean(){
		return this.getSqlSession().selectList("editScheduleBean");
	}
	// 검색어 뜨게할 때 
	
	
	
	/*public static void modifySchedule(String modifysNo,AirSchedule schedule ) {
		int modifyNo = Integer.parseInt(modifysNo);
		//System.out.println("MAPPER=> MODIFY");	
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("modifySchedule", schedule);
			sqlSession.commit();
		} catch (Exception e) {	
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
	}
	
	public static void deleteSchedule(String mm) {
			String m=mm;
			//System.out.println("deletedao:"+m);
			SqlSession sqlSession= null;
		try {
			sqlSession=sqlSessionFactory.openSession();
			sqlSession.delete("deleteSchedule",m);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}	
	
	public static Object getList() {
		return sqlSessionFactory.openSession().selectList("getList");
	}// 검색어 뜨게하는 기능의 DB를 가져올려고 쓰는것이고 벨류는 검색어의 기준이 괴는 컬럼명이다.
*/}
