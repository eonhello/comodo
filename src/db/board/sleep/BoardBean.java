package db.board.sleep;

import java.sql.Date;

public class BoardBean {
	private int s_board_num;
	private int s_haknum;
	private String s_name;
	private String s_subject;
	private String s_content;
	private Date s_date;
	private int s_confirm;
	private Date s_confirm_date;
	private int s_cancel;
	
	public int getS_board_num() {
		return s_board_num;
	}
	public void setS_board_num(int s_board_num) {
		this.s_board_num = s_board_num;
	}
	public int getS_haknum() {
		return s_haknum;
	}
	public void setS_haknum(int s_haknum) {
		this.s_haknum = s_haknum;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_subject() {
		return s_subject;
	}
	public void setS_subject(String s_subject) {
		this.s_subject = s_subject;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public int getS_confirm() {
		return s_confirm;
	}
	public void setS_confirm(int s_confirm) {
		this.s_confirm = s_confirm;
	}
	public Date getS_confirm_date() {
		return s_confirm_date;
	}
	public void setS_confirm_date(Date s_confirm_date) {
		this.s_confirm_date = s_confirm_date;
	}
	public int getS_cancel() {
		return s_cancel;
	}
	public void setS_cancel(int s_cancel) {
		this.s_cancel = s_cancel;
	}
	
}