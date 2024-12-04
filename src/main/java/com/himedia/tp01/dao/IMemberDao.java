package com.himedia.tp01.dao;

import com.himedia.tp01.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
}
