package com.ry.ryapp.interceptors;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ry.core.entity.Actionlog;
import com.ry.core.entity.Org;
import com.ry.core.service.ActionlogService;
import com.ry.core.service.OrgService;
import com.ry.core.util.Constant;
import com.ry.util.HttpUtil;

/**
 * 
 * <p>Title: HandlerInterceptor1</p>
 * <p>Description:登陆认证拦截器 </p>
 * <p>Company: www.itcast.com</p> 
 */
@Controller
public class JizhangInterceptor implements HandlerInterceptor {

	@Resource
	private ActionlogService actionlogService;					
	@Resource
	private OrgService orgService;					

	//进入 Handler方法之前执行
	//用于身份认证、身份授权
	//比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		return true;
	}

	//进入Handler方法之后，返回modelAndView之前执行
	//应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {				
		
	}

	//执行Handler完成执行此方法
	//应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		String ipadr = HttpUtil.getIpAddr(request);
//		if (!"180.166.201.178".equals(ipadr)) {
//			String memberid = request.getParameter("memberid");		
//			Actionlog actionlog = new Actionlog();		
//			String from = request.getParameter("from");
//			if (from != null) {
//				actionlog.setFrom(from);
//			} else {
//				actionlog.setFrom("APP");
//			}			
//		    if (memberid != null) {
//		    	actionlog.setMemberId(Integer.parseInt(memberid));
//			}
//			
//			actionlog.setIpadr(ipadr);
//			actionlog.setActiontime(new Date());
//			actionlog.setCode(Constant.JIZHANG);
//			actionlogService.addActionlog(actionlog);
			
			String member_id = request.getParameter("memberid");
			Actionlog actionlog = new Actionlog();		
			if (StringUtils.isNotBlank(member_id)&&!"undefined".equals(member_id)) {
				Org org = orgService.getByMemberId(Integer.valueOf(member_id));
				if (org!=null && 0==org.getType()) {
					actionlog.setCode(Constant.JIZHANG);
					actionlog.setMemberId(Integer.valueOf(org.getMemberId()));
				}else  {
					actionlog.setCode(Constant.JIZHANG_ORG);
					actionlog.setMemberId(Integer.valueOf(org.getMemberId()));
				}
				actionlog.setMemberId(Integer.valueOf(member_id));
				String from = request.getParameter("from");
				if (from != null) {
					actionlog.setFrom(from);
				} else {
					actionlog.setFrom("APP");
				}			
			}
			actionlog.setIpadr(ipadr);
			actionlog.setActiontime(new Date());
			actionlogService.addActionlog(actionlog);
	}		
}

