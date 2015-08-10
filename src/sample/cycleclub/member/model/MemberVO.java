package sample.cycleclub.member.model;


/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:58
 */
public class MemberVO {

	private int mcode;
	private double mgpsx;
	private double mgpsy;
	private String mid;
	private int mjoin;
	private String mname;
	private String mphone;
	private String mpw;
	
	public MemberVO() {
	
	}
	
	public MemberVO(int mcode, double mgpsx, double mgpsy, String mid, int mjoin, String mname, String mphone,
			String mpw) {
		super();
		this.mcode = mcode;
		this.mgpsx = mgpsx;
		this.mgpsy = mgpsy;
		this.mid = mid;
		this.mjoin = mjoin;
		this.mname = mname;
		this.mphone = mphone;
		this.mpw = mpw;
	}
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public double getMgpsx() {
		return mgpsx;
	}
	public void setMgpsx(double mgpsx) {
		this.mgpsx = mgpsx;
	}
	public double getMgpsy() {
		return mgpsy;
	}
	public void setMgpsy(double mgpsy) {
		this.mgpsy = mgpsy;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMjoin() {
		return mjoin;
	}
	public void setMjoin(int mjoin) {
		this.mjoin = mjoin;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	
}