package com.pojo;

public class CommodityInfo {
    private Integer id;

    private String name;

    private Integer type;

    private String price;

    private String lgImg;

    private String smImg;

    private String desc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getLgImg() {
        return lgImg;
    }

    public void setLgImg(String lgImg) {
        this.lgImg = lgImg == null ? null : lgImg.trim();
    }

    public String getSmImg() {
        return smImg;
    }

    public void setSmImg(String smImg) {
        this.smImg = smImg == null ? null : smImg.trim();
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }
}