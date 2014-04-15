package com.wanzi.service;

import com.wanzi.dao.MemberDao;
import com.wanzi.domain.Member;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by meichao on 14-3-22.
 */
@Service("memberService")
public class MemberService {

    @Resource(name="memberDao")
    private MemberDao memberDao;


    public Member getMemberByOpenId(String openId) {
        return memberDao.getMemberByOpenId(openId);
    }

    public int getMemberCountByTel(String tel) {
        return memberDao.getMemberCountByTel(tel);
    }

    public void saveMember(Member member) {
         memberDao.saveMember(member);
    }
}
