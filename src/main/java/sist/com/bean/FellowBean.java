package sist.com.bean;

public class FellowBean {

	private String a_no;
	private String fellower_name_han;
	private String fellower_lastname;
	private String fellower_firstname;
	private String fellower_birth;
	
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public String getFellower_name_han() {
		return fellower_name_han;
	}
	public void setFellower_name_han(String fellower_name_han) {
		this.fellower_name_han = fellower_name_han;
	}
	public String getFellower_lastname() {
		return fellower_lastname;
	}
	public void setFellower_lastname(String fellower_lastname) {
		this.fellower_lastname = fellower_lastname;
	}
	public String getFellower_firstname() {
		return fellower_firstname;
	}
	public void setFellower_firstname(String fellower_firstname) {
		this.fellower_firstname = fellower_firstname;
	}
	
	public String getFellower_birth() {
		return fellower_birth;
	}
	public void setFellower_birth(String fellower_birth) {
		this.fellower_birth = fellower_birth;
	}
	
	@Override
	public String toString() {
		return "FellowBean [a_no=" + a_no + ", fellower_name_han=" + fellower_name_han + ", fellower_lastname="
				+ fellower_lastname + ", fellower_firstname=" + fellower_firstname + ", fellower_birth="
				+ fellower_birth + "]";
	}
	
	
	
}
