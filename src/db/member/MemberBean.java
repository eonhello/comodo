package db.member;

public class MemberBean {
	
	private int haknum;
	private String password;
	private String name;
	private String major;
	private String address;
	private int call_num;
	private String mail;
	private int room_num;
	private int permission;
	
	public int getHaknum() {
		return haknum;
	}
	public void setHaknum(int haknum) {
		this.haknum = haknum;
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCall_num() {
		return call_num;
	}
	public void setCall_num(int call_num) {
		this.call_num = call_num;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	
}