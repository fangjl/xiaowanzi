package com.wanzi.web.weixin;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.wanzi.dao.MemberDao;
import com.wanzi.domain.Article;
import com.wanzi.domain.Member;
import com.wanzi.domain.Message;
import com.wanzi.domain.Reply;
import com.wanzi.service.AccountService;
import com.wanzi.service.MemberService;
import com.wanzi.service.WeixinService;
import com.wanzi.util.RegexMatcherUtil;
import com.wanzi.util.WeixinUtil;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller()
public class WeixinController {

    private final static Logger log = LogManager.getLogger(WeixinController.class);
	
	public static int pagesize = 10;
	
	@Resource(name="weixinService")
	private WeixinService weixinService;

    @Resource(name="accountService")
    private AccountService accountService;


	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	@ResponseBody
	public List<Message> test(HttpServletRequest request){
        Message message = new Message();
        message.setMsgType(Message.TEXT);
        message.setToUserName("tmaic");
        message.setFromUserName("face");
        message.setContent("9");
        message.setCreateTime(new Date());

        Reply reply = new Reply();
        reply.setToUserName(message.getFromUserName());
        reply.setFromUserName(message.getToUserName());
        reply.setCreateTime(new Date());
        weixinService.applyRequest(message,reply,request);

        return weixinService.listMessage(0,2);
	}
	
	
	//接收微信公众号接收的消息，处理后再做相应的回复
	@RequestMapping(value="/weixin",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String replyMessage(HttpServletRequest request){
		//仅处理微信服务端发的请求
        if (!checkWeixinRequest(request)) {
            return "error";
        }
        String result = weixinService.processRequest(request);
        log.error("返回xml:"+result);
        return result;
    }
	
	
	//微信公众平台验证url是否有效使用的接口
	@RequestMapping(value="/weixin",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String initWeixinURL(HttpServletRequest request){
		String echostr = request.getParameter("echostr");
		if (checkWeixinRequest(request) && echostr != null) {
			return echostr;
		}else{
			return "error";
		}
	}
	
	
	/**
	 * 根据token计算signature验证是否为weixin服务端发送的消息
	 */
	private boolean checkWeixinRequest(HttpServletRequest request){
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
        String token = request.getParameter("t");

        //验证token是否为本系统token
        int count = accountService.getTokenCount(token);
        if(count != 1){
            return false;
        }

		if (signature != null && timestamp != null && nonce != null ) {
			String[] strSet = new String[] { token, timestamp, nonce };
			java.util.Arrays.sort(strSet);
			String key = "";
			for (String string : strSet) {
				key = key + string;
			}
			String pwd = WeixinUtil.sha1(key);
			return pwd.equals(signature);
		}else {
			return false;
		}
	}
	
	/**
	 * 收到消息列表页面
	 */
	@RequestMapping(value="/admin/messages",method=RequestMethod.GET)
	public ModelAndView listMessage(String pagenum){

		ModelAndView mv=new ModelAndView();
		mv.addObject("sidebar","messages");
		mv.setViewName("messages");
		int num = 1;
		if(null!=pagenum){
			num = Integer.parseInt(pagenum);
		}
		List<Message> list = weixinService.listMessage((num-1)*pagesize, pagesize);
		mv.addObject("messageList", list);
		mv.addObject("pagenum", num);
		mv.addObject("length", list.size());
		return mv;
	}


	/**
	 * 回复消息列表页面
	 */
	@RequestMapping(value="/admin/replys",method=RequestMethod.GET)
	public ModelAndView listReply(String pagenum){
		ModelAndView mv=new ModelAndView();
		mv.addObject("sidebar","replys");
		mv.setViewName("replys");
		int num = 1;
		if(null!=pagenum){
			num = Integer.parseInt(pagenum);
		}
		List<Reply> list = weixinService.listReply((num-1)*pagesize, pagesize);
		mv.addObject("replyList", list);
		mv.addObject("pagenum", num);
		mv.addObject("length", list.size());
		return mv;
	}
	
	
	
}
