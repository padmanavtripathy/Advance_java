package bean;

public class Orderdetails {
	private String Userid;
	private String pid;

	public String getUserid() {
		return Userid;
	}

	public void setUserid(String userid) {
		System.out.println("We are in orderdetails");
		Userid = userid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
}
