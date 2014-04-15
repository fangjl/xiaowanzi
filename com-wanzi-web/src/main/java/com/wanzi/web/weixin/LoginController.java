package com.wanzi.web.weixin;


import com.wanzi.domain.User;
import com.wanzi.service.UserService;
import com.wanzi.util.StringUtil;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {


    private final static Logger log = LogManager.getLogger(LoginController.class);

    @Resource(name="userService")
    private UserService userService;

	@RequestMapping("/")
	public String index(){
		return "login";
	}

    @RequestMapping(value = "/req",method = RequestMethod.POST)
    public ModelAndView req(@ModelAttribute("user") User user,HttpServletRequest request){
        ModelAndView  mv = new ModelAndView("");
        int count = userService.findUserByEmail(user.getEmail());
        if(count > 0){
           /*email已注册*/
            mv.setViewName("forward:/");
            mv.addObject("username",user.getUserName());
            mv.addObject("message", "邮件已被注册！");
        }else{
            int id = userService.saveUser(user);
            if(id != 0){
                log.error("id:---------------> "+id);
                mv.addObject("message", "注册成功，请登录 ");
                mv.setViewName("forward:/");
            } else {
                mv.setViewName("forward:/");
                mv.addObject("username",user.getUserName());
                mv.addObject("message", "注册失败，请重新注册 ");
            }
        }

        return mv;
    }

    @RequestMapping("/article")
    public String article(){
        return "article";
    }



    @RequestMapping("/memberMain")
    public String memberMain(){
        return "member_main";
    }



    @RequestMapping("/index")
    public String main(){
        return "index";
    }
	
	
	@RequestMapping(value="/login",method= RequestMethod.POST)
	public ModelAndView login(String email,String password,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("");
        User user = userService.findUser(email,password);
		if(user != null && StringUtil.isNotBlank(user.getUserName())){
			request.getSession().setAttribute("user", user.getUserName());
			request.getSession().setAttribute("userId", user.getId());
            request.getSession().setAttribute("currentUser",user);
            mv.addObject("currentUser",user);
			mv.setViewName("redirect:/admin/main");
		}else{
			mv.setViewName("forward:/");
			mv.addObject("email",email);
			mv.addObject("message", "email or password error ");
		}
		return mv;
	}

    @RequestMapping("/exit")
    public ModelAndView exit(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("login");
        HttpSession session = request.getSession(false);
        if(session != null){
            session.removeAttribute("currentUser");
        }
        return mv;
    }
	
	
	@RequestMapping(value="/loginout",method= RequestMethod.POST)
	public ModelAndView loginOut(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/");
		request.getSession().removeAttribute("user");
		return mv;
	}

}
