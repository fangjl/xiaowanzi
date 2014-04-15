package com.wanzi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wanzi.domain.Article;
import com.wanzi.domain.Reply;
import org.springframework.stereotype.Component;


@Component("replyDao")
public class ReplyDao extends BaseDao {

	public void addReply(Reply reply) {
		this.writerSqlSession.insert("com.wanzi.dao.ReplyDao.addReply", reply);
	}
	
	public void addArticle(Article article){
		this.writerSqlSession.insert("com.wanzi.dao.ReplyDao.addArticle", article);
	}
	
	public List<Reply> findReply(int start,int size) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("size", size);
		return this.readSqlSession.selectList("com.wanzi.dao.ReplyDao.selectReply",map);
	}
	
}
