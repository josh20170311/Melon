package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.beans.Article;
import com.beans.Product;
import com.beans.User;
import com.model.UserDAO;

public class ArticleDAO extends DB{

	ArrayList<Article> titleList = new ArrayList<>();
	
	public void addArticle(Article article) throws SQLException {
		dbConnect();
		String sql = "Insert into article(" + "articleTitle," + "articleContent," + "articleUploadTime,"
				+ "articleAuthorId," + "articleProductId" + ") values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, article.getTitle());
		st.setString(2, article.getContent());
		st.setObject(3, article.getUploadTime());
		st.setInt(4, article.getAuthorId());
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
	public ArrayList<Article> fetchArticleInfos() throws SQLException {
		dbConnect();

		String sql = "Select articleId, articleTitle, articleUploadTime, articleProductId, articleAuthorId from article where audited=1;";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in fetchArticleInfos");

		while (rs.next()) {
			int id = rs.getInt("articleId");
			int authorid = rs.getInt("articleAuthorId");
			int productid = rs.getInt("articleProductId");
			Date t = (Date) rs.getObject("articleUploadTime");
			String title = rs.getString("articleTitle");

			Article article = new Article();
			article.setTitle(title);
			article.setId(id);
			article.setAuthorId(authorid);
			article.setProductId(productid);

			article.setUploadTime(t);
			System.out.println(article);

			titleList.add(article);
			t = null;
		}

		dbClose();
		return titleList;
	}

	/**
	 * 
	 * 使用者點擊文章標題後 顯示文章內容
	 * 
	 * 
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
			article.setAuthorId(rs.getInt("articleAuthorId"));
			article.setProductId(rs.getInt("articleProductId"));
			article.setContent(rs.getString("articleContent"));
			article.setTitle(rs.getString("articleTitle"));
			article.setUploadTime((Date) rs.getObject("articleUploadTime"));
			System.out.println(article.toInfoString());
		}
		dbClose();


		User u = new UserDAO().getUser(article.getAuthorId());
		Product p = new ProductDAO().getProduct(article.getProductId() + "");
		article.setAuthorName(u.getName());
		article.setProductName(p.getName());

		return article;
	}

	
}
