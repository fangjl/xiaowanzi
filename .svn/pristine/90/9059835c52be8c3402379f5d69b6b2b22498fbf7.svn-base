package com.wanzi.service;

import com.wanzi.dao.UserDao;
import com.wanzi.domain.User;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * User: meichao
 * Date: 14-3-3
 * Time: 下午2:09
 */
@Service("userService")
public class UserService {

    private final static Logger log = LogManager.getLogger(UserService.class);

    @Resource(name="userDao")
    private UserDao userDao;


    /**
     * 保存用户
     * @param user
     * @return
     */
    public int saveUser(User user) {
        int id = 0;
        try {
            id = userDao.saveUser(user);
        } catch (Exception e) {
            log.error("保存用户失败",e);
        }
        return id;
    }

    /**
     * 查找用户
     * @param email
     * @param password
     * @return
     */
    public User findUser(String email, String password) {
        User user = new User();
        try {
            user = userDao.findUser(email,password);
        } catch (Exception e) {
            log.error("查找用户失败：",e);
        }
        return user;
    }

    /**
     * email是否已注册
     * @param email
     * @return
     */
    public int findUserByEmail(String email) {
        int count = 0;
        try {
            count = userDao.findUserCountByEmail(email);
        } catch (Exception e) {
            count = 1; //重新注册
            log.error("email是否已注册出错",e);
        }
        return count;
    }
}
