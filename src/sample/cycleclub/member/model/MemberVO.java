package sample.cycleclub.member.model;


public class MemberVO {

	private String mcode;
	private double mgpsx;
	private double mgpsy;
	private String mid;
	private int mjoin;
	private String mname;
	private String mphone;
	private String mpw;
	private String regid;
	
	public MemberVO() {
	
	}
	
	public MemberVO(String mcode, double mgpsx, double mgpsy, String mid, int mjoin, String mname, String mphone,
			String mpw,String regid) {
		super();
		this.mcode = mcode;
		this.mgpsx = mgpsx;
		this.mgpsy = mgpsy;
		this.mid = mid;
		this.mjoin = mjoin;
		this.mname = mname;
		this.mphone = mphone;
		this.mpw = mpw;
		this.regid = regid;
	}
	
	public String getRegid() {
		return regid;
	}

	public void setRegid(String regid) {
		this.regid = regid;
	}

	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
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

	@Override
	public String toString() {
		return "MemberVO [mcode=" + mcode + ", mgpsx=" + mgpsx + ", mgpsy=" + mgpsy + ", mid=" + mid + ", mjoin="
				+ mjoin + ", mname=" + mname + ", mphone=" + mphone + ", mpw=" + mpw + "]";
	}
	
}