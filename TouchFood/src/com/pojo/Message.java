package com.pojo;

import java.util.Date;

public class Message {
    private Integer id;

    private String username;

    private Integer pid;

    private String content;

    private Date messTime;

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getMessTime() {
        return messTime;
    }

    public void setMessTime(Date messTime) {
        this.messTime = messTime;
    }

	public Message(Integer id, String username, Integer pid, String content, Date messTime) {
		super();
		this.id = id;
		this.username = username;
		this.pid = pid;
		this.content = content;
		this.messTime = messTime;
	}

	public Message(String username, Integer pid, String content, Date messTime) {
		super();
		this.username = username;
		this.pid = pid;
		this.content = content;
		this.messTime = messTime;
	}

	public Message() {
		super();
	}
    
}