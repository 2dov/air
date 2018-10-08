package sist.com.bean;

public class AppointmentBean {
	private String a_no;
	private String s_no;
	private int no;
	
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "AppointmentBean [a_no=" + a_no + ", s_no=" + s_no + ", no=" + no + "]";
	}
}
