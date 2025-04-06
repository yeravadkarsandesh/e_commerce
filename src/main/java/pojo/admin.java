package pojo;

public class admin {
	private static int id;
private String name;
private static String email;
private String pass;
private static String rname;
private static String remail;

public int add() {
	return id;
}

public admin(int id){
	super();
	admin.id = id;
}

public static String getRname() {
	return rname;
}

public static void setRname(String rname) {
	admin.rname = rname;
}

public static String getRemail() {
	return remail;
}

public static void setRemail(String remail) {
	admin.remail = remail;
}
public admin(String rname, String remail) {
	super();
	this.name = rname;
	this.email = remail;

}

public static int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public admin(String name, String email, String pass) {
	super();
	this.name = name;
	this.email = email;
	this.pass = pass;
}
public admin() {
	// TODO Auto-generated constructor stub
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public static String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}

}
