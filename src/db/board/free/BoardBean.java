package db.board.free;

import java.sql.Date;

public class BoardBean {
	private int Fboard_num;
	private String Fboard_name;
	private String Fboard_pass;
	private String Fboard_title;
	private String Fboard_content;
	private String Fboard_file;
	private int Fboard_re_ref;
	private int Fboard_re_lev;
	private int Fboard_re_seq;
	private int Fboard_readcount;
	private Date Fboard_date;
	
	
	public int getFboard_num() {
		return Fboard_num;
	}
	public void setFboard_num(int fboard_num) {
		Fboard_num = fboard_num;
	}
	public String getFboard_name() {
		return Fboard_name;
	}
	public void setFboard_name(String fboard_name) {
		Fboard_name = fboard_name;
	}
	public String getFboard_pass() {
		return Fboard_pass;
	}
	public void setFboard_pass(String fboard_pass) {
		Fboard_pass = fboard_pass;
	}
	public String getFboard_title() {
		return Fboard_title;
	}
	public void setFboard_title(String fboard_title) {
		Fboard_title = fboard_title;
	}
	public String getFboard_content() {
		return Fboard_content;
	}
	public void setFboard_content(String fboard_content) {
		Fboard_content = fboard_content;
	}
	public String getFboard_file() {
		return Fboard_file;
	}
	public void setFboard_file(String fboard_file) {
		Fboard_file = fboard_file;
	}
	public int getFboard_re_ref() {
		return Fboard_re_ref;
	}
	public void setFboard_re_ref(int fboard_re_ref) {
		Fboard_re_ref = fboard_re_ref;
	}
	public int getFboard_re_lev() {
		return Fboard_re_lev;
	}
	public void setFboard_re_lev(int fboard_re_lev) {
		Fboard_re_lev = fboard_re_lev;
	}
	public int getFboard_re_seq() {
		return Fboard_re_seq;
	}
	public void setFboard_re_seq(int fboard_re_seq) {
		Fboard_re_seq = fboard_re_seq;
	}
	public int getFboard_readcount() {
		return Fboard_readcount;
	}
	public void setFboard_readcount(int fboard_readcount) {
		Fboard_readcount = fboard_readcount;
	}
	public Date getFboard_date() {
		return Fboard_date;
	}
	public void setFboard_date(Date fboard_date) {
		Fboard_date = fboard_date;
	}
	
	
	

}