package com.wanzi.dao;

import com.wanzi.domain.AdminReply;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by meichao on 14-3-8.
 */
@Component("adminReplyDao")
public class AdminReplyDao extends BaseDao{
    public List<AdminReply> getAdminReplyByText(String token,int type) {
        Map map = new HashMap();
        map.put("token",token);
        map.put("type",type);
        return this.readSqlSession.selectList("com.wanzi.dao.AdminReplyDao.getAdminReplyByText",map);
    }

    public void saveAdminReply(AdminReply adminReply) {
        this.writerSqlSession.insert("com.wanzi.dao.AdminReplyDao.saveAdminReply",adminReply);
    }

    public AdminReply getTextById(int id) {
        return this.readSqlSession.selectOne("com.wanzi.dao.AdminReplyDao.getTextById",id);
    }

    public void updateTextStatusById(int id,String token) {
        Map map = new HashMap();
        map.put("id",id);
        map.put("token",token);
        this.writerSqlSession.update("com.wanzi.dao.AdminReplyDao.updateTextStatusById",map);
    }

    public void updateTextReply(AdminReply adminReply) {
        this.writerSqlSession.update("com.wanzi.dao.AdminReplyDao.updateTextReply",adminReply);
    }

    public List<AdminReply> getAdminReplyByKeyWord(String keyword, String token) {
        Map map = new HashMap();
        map.put("token",token);
        map.put("keyword",keyword);
        return this.readSqlSession.selectList("com.wanzi.dao.AdminReplyDao.getAdminReplyByKeyWord",map);
    }
}
