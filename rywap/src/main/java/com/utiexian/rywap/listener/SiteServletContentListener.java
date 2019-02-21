package com.utiexian.rywap.listener;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.ry.core.util.Constant;
import com.ry.util.PropertiesUtil;

/**
 * @ClassName: SiteServletContentListener
 * @Description: TODO
 */
public class SiteServletContentListener implements ServletContextListener{

	/* (non-Javadoc)
	 * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	/* (non-Javadoc)
	 * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		try {
			//初始化存放项目真实路径
			PropertiesUtil.wwwroot = arg0.getServletContext().getRealPath("/");
			
			Constant.properties = PropertiesUtil.loadProperties(arg0.getServletContext().getRealPath("WEB-INF/classes/config.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}