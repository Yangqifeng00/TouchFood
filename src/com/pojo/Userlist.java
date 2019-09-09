package com.pojo;

public class Userlist {
    private Integer id;

    private String username;

    private String password;

    private String touImg;

    private String sex;

    private Integer age;

    private String qq;

    private String eMail;

    private String uaddress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTouImg() {
        return touImg;
    }

    public void setTouImg(String touImg) {
        this.touImg = touImg == null ? null : touImg.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail == null ? null : eMail.trim();
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress == null ? null : uaddress.trim();
    }

	public Userlist(String username, String password, String touImg, String sex, Integer age, String qq, String eMail,
			String uaddress) {
		super();
		this.username = username;
		this.password = password;
		this.touImg = touImg;
		this.sex = sex;
		this.age = age;
		this.qq = qq;
		this.eMail = eMail;
		this.uaddress = uaddress;
	}

	public Userlist() {
		super();
	}

	public Userlist(Integer id, String username, String password, String touImg, String sex, Integer age, String qq,
			String eMail, String uaddress) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.touImg = touImg;
		this.sex = sex;
		this.age = age;
		this.qq = qq;
		this.eMail = eMail;
		this.uaddress = uaddress;
	}

	
    
    
}