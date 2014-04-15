package com.wanzi.dao;

import com.wanzi.domain.Account;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: meichao
 * Date: 14-3-3
 * Time: 下午5:34
 */
@Component("accountDao")
public class AccountDao extends BaseDao {

    public int saveAccount(Account account) {
        return this.writerSqlSession.insert("com.wanzi.dao.AccountDao.saveAccount",account);
    }

    public List<Account> getAccountList(int userId) {
        return this.readSqlSession.selectList("com.wanzi.dao.AccountDao.getAccountList",userId);
    }

    public Account getAccountById(int id,int userId) {
        Map map = new HashMap();
        map.put("id",id);
        map.put("userId",userId);
        return this.readSqlSession.selectOne("com.wanzi.dao.AccountDao.getAccountById",map);
    }

    public void updateAccountStatus(int id, int userId) {
        Map map = new HashMap();
        map.put("id",id);
        map.put("userId",userId);
        this.writerSqlSession.update("com.wanzi.dao.AccountDao.updateAccountStatus",map);
    }

    public int getTokenCount(String token) {
        return (Integer)this.readSqlSession.selectOne("com.wanzi.dao.AccountDao.getTokenCount",token);
    }
}
