package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.beans.*;

public class ArticleDAO extends DB{
	
	ArrayList<Article> titleList = new ArrayList<>();
	
	public void addArticle(Article article) throws SQLException {
		dbConnect();
		String sql = "Insert into article(Article_ID, Member_ID, Title, Content, Product_ID, Upload_Time ) values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, article.getId());
		st.setString(2, article.getMemberId());
		st.setString(3, article.getTitle());
		st.setString(4, article.getContent());
		st.setString(5, article.getProductId());
		st.setObject(6, article.getUploadTime());

		st.executeUpdate();
		dbClose();
	}

	
	
 
	/**
	 * 怕內容太大讀太久,先抓文章資訊做出列表, 之後再用getArticle(id)抓文章內容
	 * 
	 * @return ArrayList<Article>
	 * @throws SQLException
	 */
	public ArrayList<Article> getArticleInfos(Object memberId, Object audited) throws SQLException {
		System.out.println();
		System.out.println("in fetchArticleInfos");
		
		dbConnect();
		String sql;
		sql = "Select Article_ID, Title, Upload_Time, Product_ID, Member_ID, Audited from article where Audited LIKE ? and Member_ID LIKE ?;";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setObject(1, audited);
		st.setObject(2,memberId);
		
		//System.out.println(st); //檢查query 字串
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String id = rs.getString("Article_ID");
			String memberid = rs.getString("Member_ID");
			String productid = rs.getString("Product_ID");
			Date t = (Date) rs.getObject("Upload_Time");
			String title = rs.getString("Title");
			Boolean isaudited = rs.getBoolean("Audited");

			Article article = new Article();
			article.setTitle(title);
			article.setId(id);
			article.setMemberId(memberid);
			article.setProductId(productid);
			article.setAudited(isaudited);
			article.setUploadTime(t);
			
			System.out.println(article);

			titleList.add(article);
		}

		dbClose();
		return titleList;
	}
	
	/**
	 * 搜尋全部核准的文章
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<Article> getAuditedArticleInfos() throws SQLException {
		return this.getArticleInfos("%", 1);
	}

	/**
	 * 搜尋使用者全部的文章
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<Article> getMemberArticleInfos(String memberId) throws SQLException {
		return this.getArticleInfos(memberId, "%");
	}
	
	/**
	 * 搜尋資料庫全部的文章
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<Article> getAllArticleInfos() throws SQLException {
		return this.getArticleInfos("%", "%");
	}
	
	/**
	 * 搜尋文章內容
	 * @param id
	 * @return article
	 * @throws SQLException
	 */
	public Article getArticle(String id) throws SQLException {
		dbConnect();

		Article article = new Article();
		String sql = "SELECT * FROM article where Article_ID = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in getArticle");

		while (rs.next()) {
			article.setId(id);
			article.setMemberId(rs.getString("Member_ID"));
			article.setProductId(rs.getString("Product_ID"));
			article.setContent(rs.getString("Content"));
			article.setTitle(rs.getString("Title"));
			article.setUploadTime((Date) rs.getObject("Upload_Time"));
			article.setAudited(rs.getBoolean("Audited"));
			System.out.println(article.toInfoString());
		}
		dbClose();


		Member m = new MemberDAO().getMember(article.getMemberId());
		Product p = new ProductDAO().getProduct(article.getProductId() + "");
		article.setMemberName(m.getName());
		article.setProductName(p.getName());

		return article;
	}
	public void setAudited(String articleId, Boolean isAudited) {
		String sql = "update melon.Article set Audited=? where Article_ID = ?";
		try {
			dbConnect();
			PreparedStatement st = con.prepareStatement(sql);
			st.setBoolean(1, isAudited);
			st.setString(2, articleId);
			st.execute();
			dbClose();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
