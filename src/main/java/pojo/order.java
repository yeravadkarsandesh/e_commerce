package pojo;

public class order{
	public static int O_id;
	
	public static int getO_id() {
		return O_id;
	}


	public static void setO_id(int o_id) {
		O_id = o_id;
	}
	public int contact;
	public  String saddress;
	public  int pcode;
	public  String distric;
	public  String state;
	public  int Curren_date;
public  int Arriving_date;
public  int price;
public   String payment_type;


public order(int contact, String saddress, int pcode, String distric, String state, int curren_date, int arriving_date,
		int price, String payment_type) {
	super();
	this.contact = contact;
	this.saddress = saddress;
	this.pcode = pcode;
	this.distric = distric;
	this.state = state;
	Curren_date = curren_date;
	Arriving_date = arriving_date;
	this.price = price;
	this.payment_type = payment_type;
}


public int getContact() {
	return contact;
}
public void setContact(int contact) {
	this.contact = contact;
}
public String getSaddress() {
	return saddress;
}
public void setSaddress(String saddress) {
	this.saddress = saddress;
}
public int getPcode() {
	return pcode;
}
public void setPcode(int pcode) {
	this.pcode = pcode;
}
public String getDistric() {
	return distric;
}
public void setDistric(String distric) {
	this.distric = distric;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getCurren_date() {
	return Curren_date;
}
public void setCurren_date(int curren_date) {
	Curren_date = curren_date;
}
public int getArriving_date() {
	return Arriving_date;
}
public void setArriving_date(int arriving_date) {
	Arriving_date = arriving_date;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getPayment_type() {
	return payment_type;
}
public void setPayment_type(String payment_type) {
	this.payment_type = payment_type;
}

}
