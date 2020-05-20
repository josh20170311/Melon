package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.*;
import java.util.Date;

public class DB {

	private String username = "root";
	private String password = "1234";
	private String dbName = "myproject";
	private String url = "jdbc:mysql://localhost:3306/" + dbName
			+ "?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String driver = "com.mysql.cj.jdbc.Driver";

	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	ArrayList<Article> titleList = new ArrayList<>();

	private Connection con;

	private void dbConnect() {

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void addUser(User user) throws SQLException {
		dbConnect();
		String sql = "Insert into user(name,email,username,address,password) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getAddress());
		st.setString(5, user.getPassword());

		st.executeUpdate();
		dbClose();
	}

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

	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, username);
		st.setString(2, password);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			count = 1;
		}

		dbClose();
		if (count == 0)
			return false;// �d�L���H �^��false

		return true;// �b���K�X���T �^��true
	}

	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String category = rs.getString("category");
			String price = rs.getString("price");
			String featured = rs.getString("featured");
			String image = rs.getString("image");

			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			list.add(p);
			p = null;

		}

		dbClose();
		return list;
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String address = rs.getString("address");
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			int id = rs.getInt("id");
			String password = rs.getString("password");

			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setId(id);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u = null;

		}

		dbClose();
		return userList;
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
			Date javaDate = new Date(t.getTime());

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

		User u = getUser(article.getAuthorId());
		Product p = getProduct(article.getProductId() + "");
		article.setAuthorName(u.getName());
		article.setProductName(p.getName());

		return article;
	}

	public User getUser(int id) throws SQLException {
		dbConnect();
		User u = new User();

		String sql = "SELECT * FROM user where id = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in getUser");

		while (rs.next()) {
			u.setId(id);
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setAddress(rs.getString("address"));
			u.setUsername("username");
			u.setPassword("password");
			System.out.println(u);
		}
		dbClose();
		return u;
	}

	public void deleteProduct(String id) throws SQLException {

		dbConnect();
		String sql = "Delete from product where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();

	}

	public Product getProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while (rst.next()) {

			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set name=?,price=?,category=?,featured=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setInt(5, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,featured,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setString(5, p.getImage());

		st.executeUpdate();
		dbClose();
	}

}
