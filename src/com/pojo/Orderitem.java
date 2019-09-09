package com.pojo;

public class Orderitem {
    private Integer id;

    private Integer pid;

    private Integer num;

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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
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
}