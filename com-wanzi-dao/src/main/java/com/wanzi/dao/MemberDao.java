package com.wanzi.dao;

import com.wanzi.domain.Member;
import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Component;

/**
 * Created by meichao on 14-3-22.
 */
@Component("memberDao")
public class MemberDao extends BaseDao{

    public Member getMemberByOpenId(String openId) {
            return this.readSqlSession.selectOne("com.wanzi.dao.MemberDao.getMemberByOpenId",openId);
    }

    public int getMemberCountByTel(String tel) {
        return (Integer)this.readSqlSession.selectOne("com.wanzi.dao.MemberDao.getMemberCountByTel", tel);
    }

    public void saveMember(Member member) {
         this.writerSqlSession.insert("com.wanzi.dao.MemberDao.saveMember",member);
    }
}
