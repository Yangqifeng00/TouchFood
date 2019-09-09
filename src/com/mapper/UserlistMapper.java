package com.mapper;

import com.pojo.Userlist;
import com.pojo.UserlistExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserlistMapper {
    int countByExample(UserlistExample example);

    int deleteByExample(UserlistExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Userlist userlist);

    int insertSelective(Userlist record);

    List<Userlist> selectByExample(UserlistExample example);

    Userlist selectByPrimaryKey(Integer id);
    
    Userlist selectBynameP(String username, String password);
    
    Userlist selectByname(String username);

    int updateByExampleSelective(@Param("record") Userlist record, @Param("example") UserlistExample example);

    int updateByExample(@Param("record") Userlist record, @Param("example") UserlistExample example);

    int updateByPrimaryKeySelective(Userlist record);

    int updateByPrimaryKey(Userlist userlist);
}