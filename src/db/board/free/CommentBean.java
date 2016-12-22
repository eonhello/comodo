package db.board.free;

import java.sql.Date;

public class CommentBean {
    
	private String brdno;
	private String reno;
    private String rewriter;
    private String rememo;
    private String redate;
    private int hak_num;
    
    
	public String getBrdno() {
		return brdno;
	}
	public void setBrdno(String brdno) {
		this.brdno = brdno;
	}
	public int getHak_num() {
		return hak_num;
	}
	public void setHak_num(int hak_num) {
		this.hak_num = hak_num;
	}
	public String getReno() {
		return reno;
	}
	public void setReno(String reno) {
		this.reno = reno;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public String getRememo() {
		return rememo;
	}
	public void setRememo(String rememo) {
		this.rememo = rememo;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
    


}
