package com.pojo;

public class Orderlist {
    private Integer id;

    private Integer pid;

    private String name;

    private String smImg;

    private Integer num;

    private String price;

    private String couprice;

    private Integer oid;
    
    private CommodityInfo commodity;
    
    private Order order;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSmImg() {
        return smImg;
    }

    public void setSmImg(String smImg) {
        this.smImg = smImg == null ? null : smImg.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getCouprice() {
        return couprice;
    }

    public void setCouprice(String couprice) {
        this.couprice = couprice == null ? null : couprice.trim();
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }
    
    public CommodityInfo getCommodity() {
		return commodity;
	}

	public void setCommodity(CommodityInfo commodity) {
		this.commodity = commodity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Orderlist [id=" + id + ", pid=" + pid + ", name=" + name + ", smImg=" + smImg + ", num=" + num
				+ ", price=" + price + ", couprice=" + couprice + ", oid=" + oid + ", commodity=" + commodity
				+ ", order=" + order + "]";
	}

	public Orderlist(Integer id, Integer pid, String name, String smImg, Integer num, String price, String couprice,
			Integer oid, CommodityInfo commodity, Order order) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.smImg = smImg;
		this.num = num;
		this.price = price;
		this.couprice = couprice;
		this.oid = oid;
		this.commodity = commodity;
		this.order = order;
	}

	public Orderlist(Integer pid, String name, String smImg, Integer num, String price, String couprice, Integer oid,
			CommodityInfo commodity, Order order) {
		super();
		this.pid = pid;
		this.name = name;
		this.smImg = smImg;
		this.num = num;
		this.price = price;
		this.couprice = couprice;
		this.oid = oid;
		this.commodity = commodity;
		this.order = order;
	}

	public Orderlist() {
		super();
	}
	
	
}