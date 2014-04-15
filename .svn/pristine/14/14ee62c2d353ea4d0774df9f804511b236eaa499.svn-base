package com.wanzi.dao;

import com.wanzi.domain.User;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * User: meichao
 * Date: 14-3-3
 * Time: 下午2:10
 */
@Component("userDao")
public class UserDao extends BaseDao{

    public int saveUser(User user) {
        return this.writerSqlSession.insert("com.wanzi.dao.UserDao.saveUser", user);
    }

    public User findUser(String email, String password) {
        Map map = new HashMap();
        map.put("email",email);
        map.put("password",password);
        return this.readSqlSession.selectOne("com.wanzi.dao.UserDao.findUser", map);
    }

    public int findUserCountByEmail(String email) {
        return (Integer)this.readSqlSession.selectOne("com.wanzi.dao.UserDao.findUserCountByEmail",email);
    }
}
