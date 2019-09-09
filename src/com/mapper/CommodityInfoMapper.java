package com.mapper;

import com.pojo.CommodityInfo;
import com.pojo.CommodityInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityInfoMapper {
    int countByExample(CommodityInfoExample example);

    int deleteByExample(CommodityInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommodityInfo record);

    int insertSelective(CommodityInfo record);

    List<CommodityInfo> selectByExample(CommodityInfoExample example);
    
    List<CommodityInfo> selectListCommodity();//��ѯ���ݿ�ȫ����Ʒ��Ϣ

    CommodityInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommodityInfo record, @Param("example") CommodityInfoExample example);

    int updateByExample(@Param("record") CommodityInfo record, @Param("example") CommodityInfoExample example);

    int updateByPrimaryKeySelective(CommodityInfo record);

    int updateByPrimaryKey(CommodityInfo record);
}