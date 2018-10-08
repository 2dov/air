package sist.com.bean;

public class AirportBean {
	private String ap_no;
	private String name;
	private String location;
	private String nation;
	
	public String getAp_no() {
		return ap_no;
	}
	public void setAp_no(String ap_no) {
		this.ap_no = ap_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	@Override
	public String toString() {
		return "Airport [ap_no=" + ap_no + ", name=" + name + ", location=" + location + ", nation=" + nation + "]";
	}
	
}
