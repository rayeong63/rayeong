package domain;

import java.sql.Timestamp;

public class MyMember1 {
	private String id;
	private String passwd;
	private String name;
	private Integer age;
	private String gender;
	private String email;
	private Timestamp reg_date;
	private String address;
	private String tel;
	private String mtel;
	
	public MyMember1() {} // 지우기
	
	public MyMember1(String id, String passwd, String name) { // 지우기
		this.id = id;
		this.passwd = passwd;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyMember1 [id=");
		builder.append(id);
		builder.append(", passwd=");
		builder.append(passwd);
		builder.append(", name=");
		builder.append(name);
		builder.append(", age=");
		builder.append(age);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", email=");
		builder.append(email);
		builder.append(", reg_date=");
		builder.append(reg_date);
		builder.append(", address=");
		builder.append(address);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", mtel=");
		builder.append(mtel);
		builder.append("]");
		return builder.toString();
	}
	
	
}
