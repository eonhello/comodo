package db.board.qna;

import java.sql.Date;

public class QBoardBean {
	private int q_board_num;
	private String haknum;
	private String q_pass;
	private String q_subject;
	private String q_content;
	private String q_file;
	private int q_re_ref;
	private int q_re_lev;
	private int q_re_seq;
	private int q_readcount;
	private Date q_reg_date;
	private Date q_regupdate_date;
	private int Qboard_chack;
	
	private String search;
	private int page;
	private String find_field;
	
	
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getQ_board_num() {
		return q_board_num;
	}
	public void setQ_board_num(int q_board_num) {
		this.q_board_num = q_board_num;
	}
	public String getHaknum() {
		return haknum;
	}
	public void setHaknum(String haknum) {
		this.haknum = haknum;
	}
	public String getQ_pass() {
		return q_pass;
	}
	public void setQ_pass(String q_pass) {
		this.q_pass = q_pass;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_file() {
		return q_file;
	}
	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}
	public int getQ_re_ref() {
		return q_re_ref;
	}
	public void setQ_re_ref(int q_re_ref) {
		this.q_re_ref = q_re_ref;
	}
	public int getQ_re_lev() {
		return q_re_lev;
	}
	public void setQ_re_lev(int q_re_lev) {
		this.q_re_lev = q_re_lev;
	}
	public int getQ_re_seq() {
		return q_re_seq;
	}
	public void setQ_re_seq(int q_re_seq) {
		this.q_re_seq = q_re_seq;
	}
	public int getQ_readcount() {
		return q_readcount;
	}
	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}
	public Date getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Date q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	public Date getQ_regupdate_date() {
		return q_regupdate_date;
	}
	public void setQ_regupdate_date(Date q_regupdate_date) {
		this.q_regupdate_date = q_regupdate_date;
	}
	public int getQboard_chack() {
		return Qboard_chack;
	}
	public void setQboard_chack(int qboard_chack) {
		Qboard_chack = qboard_chack;
	}


}