package com.wanzi.web.weixin;

import com.wanzi.domain.Member;
import com.wanzi.service.MemberService;
import com.wanzi.util.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * 会员卡相关信息
 * Created by meichao on 14-3-22.
 */
@Controller
public class MemberController {


    private final static Logger log = LogManager.getLogger(MemberController.class);

    @Resource(name="memberService")
    private MemberService memberService;

    @RequestMapping("/member")
    public ModelAndView member(HttpServletRequest request){

        ModelAndView mv = new ModelAndView();

        String User_Agent = request.getHeader("User-Agent");

        if(StringUtils.isNotBlank(User_Agent) && User_Agent.toLowerCase().indexOf("micromessenger") != -1){
            log.error("手机版微信打开。");
        } else{
            mv.setViewName("member/memError");
            log.error("非手机版微信打开。");
            return mv;
        }




        String openId = request.getParameter("openId");
        String token = request.getParameter("token");
        if(StringUtil.isBlank(openId) || StringUtil.isBlank((token))){
            openId = (String)request.getSession().getAttribute("currentOpenId");
            token = (String)request.getSession().getAttribute("currentToken");
        }
        request.getSession().setAttribute("currentOpenId",openId);
        request.getSession().setAttribute("currentToken", token);
        if(StringUtil.isNotBlank(openId)){
            Member member = memberService.getMemberByOpenId(openId);
            if(member == null){
                mv.setViewName("member/newMember");
            }else {
                mv.addObject("member",member);
                mv.setViewName("member/member");
            }
        }
        return mv;
    }

    @RequestMapping("/addmember")
    public String addmember(){
        return "member/addmember";
    }
    @RequestMapping(value = "/saveMember",method= RequestMethod.POST)
    @ResponseBody
    public String saveMember(HttpServletRequest request,@ModelAttribute("Member")Member member){
        System.out.println("进入controller-------" );
        //手机号是否已经注册
        if(member != null){
            if(StringUtil.isNotBlank(member.getTel())){
                int count = memberService.getMemberCountByTel(member.getTel());
                if(count > 0){
                    return "inValidPhone";
                }
                //保存
                String openId = (String)request.getSession().getAttribute("currentOpenId");
                String token = (String)request.getSession().getAttribute("currentToken");
                member.setToken(token);
                member.setOpenId(openId);
                memberService.saveMember(member);
            }
        }
        return "success";
    }

}
