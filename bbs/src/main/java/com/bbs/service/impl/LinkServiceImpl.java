package com.bbs.service.impl;

import java.util.List;

import com.bbs.model.Link;
import com.bbs.service.LinkService;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.AR;
import com.blade.jdbc.QueryParam;

@Service
public class LinkServiceImpl implements LinkService {
	
	@Override
	public Link getLink(Integer id) {
		return AR.findById(Link.class, id);
	}
		
	@Override
	public List<Link> getLinkList(QueryParam queryParam) {
		if(null != queryParam){
			return AR.find(queryParam).list(Link.class);
		}
		return null;
	}
	
	@Override
	public boolean save(String title, String url) {
		return false;
	}
	
	@Override
	public boolean delete(Integer id) {
		if(null != id){
			AR.update("delete from t_link where id = ?", id).executeUpdate();
			return true;
		}
		return false;
	}
		
}
