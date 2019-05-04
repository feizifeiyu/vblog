package com.feizifeiyu.vblog;

import com.feizifeiyu.vblog.admin.entity.User;
import com.feizifeiyu.vblog.admin.service.UserService;
import com.feizifeiyu.vblog.admin.utils.PasswordHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


/**
 * @author 非子非鱼
 * @date 2018/10/23
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class PasswordHelperTest {

    @Autowired
    private PasswordHelper passwordHelper;
    @Autowired
    private UserService userService;

    @Test
    public void encryptPassword() {
        User user = new User();
        user.setId(1L);
        user.setUsername("feizifeiyu");
        user.setPassword("123456");
        user.setSalt("536a51359841754df6bbab57d24d2128");
        passwordHelper.encryptPassword(user);
        userService.updateNotNull(user);
        System.out.println(user.getPassword()); // c0daa18ce0c74153ce060325cb4d1a04
    }
}