package sist.com.bean;

public class MemberBean {
	private int no;
	private String zipcode;
	private String id;
	private String password;
	private String name;
	private String address;
	private String email;
	private String birthday;
	private String tel;
	private String cp;// ÇÚµåÆù
	private String admin;

	public MemberBean() {
		super();
	}

	public MemberBean(int no, String zipcode, String id, String password, String name, String address, String email,
			String birthday, String tel, String cp, String admin) {
		super();
		this.no = no;
		this.zipcode = zipcode;
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.birthday = birthday;
		this.tel = tel;
		this.cp = cp;
		this.admin = admin;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", zipcode=" + zipcode + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", email=" + email + ", birthday=" + birthday + ", tel=" + tel + ", cp=" + cp
				+ ", admin=" + admin + "]";
	}

}