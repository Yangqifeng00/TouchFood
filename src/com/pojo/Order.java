package com.pojo;

public class Order {
    private Integer id;

    private String username;
    
    Userlist user; 

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
    
    public Userlist getUser() {
		return user;
	}

	public void setUser(Userlist user) {
		this.user = user;
	}
}