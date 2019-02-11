package user;

import java.util.Date;

public class User {

	private int sabun;
	private String name;
	private String title;
	private int cnt=0;
	private String content;
	private String phone;
	private String pwd;
	private Date wdate;
	private String juso1;
	private String juso2;
	private String email;
	private int no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getJuso1() {
		return juso1;
	}
	public void setJuso1(String juso1) {
		this.juso1 = juso1;
	}
	public String getJuso2() {
		return juso2;
	}
	public void setJuso2(String juso2) {
		this.juso2 = juso2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	//db 필드 확인 후 get set 생성
	
	
}
