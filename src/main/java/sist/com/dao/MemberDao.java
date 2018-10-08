package sist.com.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sist.com.bean.MemberBean;
import sist.com.bean.ZipCodeBean;

public class MemberDao extends SqlSessionDaoSupport {
	public MemberBean selectMember(String id) {
		return this.getSqlSession().selectOne("selectMember", id);
	}
	
	public MemberBean selectMemberByNo(int no) {
		return this.getSqlSession().selectOne("selectMemberByNo", no);
	}

	public boolean selectID(String id) {
		return this.getSqlSession().selectOne("selectID", id)!=null?false:true;
	}
	
	public List<ZipCodeBean> findAddressProcess(String data){
		return this.getSqlSession().selectList("findAddressProcess", data);
	}
	
	public void insertMember(MemberBean bean) {
		this.getSqlSession().insert("insertMember", bean);
	}
}
