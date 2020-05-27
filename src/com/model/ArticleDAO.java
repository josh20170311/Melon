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
		String sql = "Insert into article(articleTitle, articleContent, articleUploadTime, articleAuthorId, articleProductId ) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, article.getTitle());
		st.setString(2, article.getContent());
		st.setObject(3, article.getUploadTime());
		st.setString(4, article.getAuthorId());
		st.setInt(5, article.getProductId());

		st.executeUpdate();
		dbClose();
	}

	
	

	/**
	 * 怕內容太大讀太久,先抓文章資訊做出列表, 之後再用getArticle(id)抓文章內容
	 * 
	 * @return ArrayList<Article>
	 * @throws SQLException
	 */
	public ArrayList<Article> getArticleInfos(Object userId, Object audited) throws SQLException {
		System.out.println();
		System.out.println("in fetchArticleInfos");
		
		dbConnect();
		String sql;
		sql = "Select articleId, articleTitle, articleUploadTime, articleProductId, articleAuthorId, audited from article where audited LIKE ? and articleAuthorId LIKE ?;";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setObject(1, audited);
		st.setObject(2,userId);
		
		//System.out.println(st); //檢查query 字串
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("articleId");
			String authorid = rs.getString("articleAuthorId");
			int productid = rs.getInt("articleProductId");
			Date t = (Date) rs.getObject("articleUploadTime");
			String title = rs.getString("articleTitle");
			Boolean isaudited = rs.getBoolean("audited");

			Article article = new Article();
			article.setTitle(title);
			article.setId(id);
			article.setAuthorId(authorid);
			article.setProductId(productid);
			article.setAudited(isaudited);

			article.setUploadTime(t);
			System.out.println(article);

			titleList.add(article);
			t = null;
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
	public ArrayList<Article> getUserArticleInfos(int userId) throws SQLException {
		return this.getArticleInfos(userId, "%");
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
	public Article getArticle(int id) throws SQLException {
		dbConnect();

		Article article = new Article();
		String sql = "SELECT * FROM article where articleId = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in getArticle");

		while (rs.next()) {
			article.setId(id);
			article.setAuthorId(rs.getString("articleAuthorId"));
			article.setProductId(rs.getInt("articleProductId"));
			article.setContent(rs.getString("articleContent"));
			article.setTitle(rs.getString("articleTitle"));
			article.setUploadTime((Date) rs.getObject("articleUploadTime"));
			article.setAudited((Boolean)rs.getObject("audited"));
			System.out.println(article.toInfoString());
		}
		dbClose();


		Member m = new MemberDAO().getMember(article.getAuthorId());
		Product p = new ProductDAO().getProduct(article.getProductId() + "");
		article.setAuthorName(m.getName());
		article.setProductName(p.getName());

		return article;
	}

	
}
