package db.board.fac;

import java.sql.Date;

public class BoardBean {
	private int fac_board_num;
	private String fac_board_name; 
	private String fac_board_email; 
	private String fac_board_subject;
	private Date fac_board_regdate;
	private int fac_board_readcount; 
	private int fac_board_ref; 
	private int fac_board_re_level; 
	private int fac_board_re_step; 
	private String fac_board_content;
	private String fac_board_filename;
	
	public int getFac_board_num() {
		return fac_board_num;
	}
	public void setFac_board_num(int fac_board_num) {
		this.fac_board_num = fac_board_num;
	}
	public String getFac_board_name() {
		return fac_board_name;
	}
	public void setFac_board_name(String fac_board_name) {
		this.fac_board_name = fac_board_name;
	}
	public String getFac_board_email() {
		return fac_board_email;
	}
	public void setFac_board_email(String fac_board_email) {
		this.fac_board_email = fac_board_email;
	}
	public String getFac_board_subject() {
		return fac_board_subject;
	}
	public void setFac_board_subject(String fac_board_subject) {
		this.fac_board_subject = fac_board_subject;
	}
	public Date getFac_board_regdate() {
		return fac_board_regdate;
	}
	public void setFac_board_regdate(Date fac_board_regdate) {
		this.fac_board_regdate = fac_board_regdate;
	}
	public int getFac_board_readcount() {
		return fac_board_readcount;
	}
	public void setFac_board_readcount(int fac_board_readcount) {
		this.fac_board_readcount = fac_board_readcount;
	}
	public int getFac_board_ref() {
		return fac_board_ref;
	}
	public void setFac_board_ref(int fac_board_ref) {
		this.fac_board_ref = fac_board_ref;
	}
	public int getFac_board_re_level() {
		return fac_board_re_level;
	}
	public void setFac_board_re_level(int fac_board_re_level) {
		this.fac_board_re_level = fac_board_re_level;
	}
	public int getFac_board_re_step() {
		return fac_board_re_step;
	}
	public void setFac_board_re_step(int fac_board_re_step) {
		this.fac_board_re_step = fac_board_re_step;
	}
	public String getFac_board_content() {
		return fac_board_content;
	}
	public void setFac_board_content(String fac_board_content) {
		this.fac_board_content = fac_board_content;
	}
	public String getFac_board_filename() {
		return fac_board_filename;
	}
	public void setFac_board_filename(String fac_board_filename) {
		this.fac_board_filename = fac_board_filename;
	} 
	
	

}