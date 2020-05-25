<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
		<h1>
			Melon
		</h1>
		<nav>
			<ul>
				<li><input type="text"  name="search"  placeHolder="Search"/></li>
				<li><a href="Home"			>Home</a></li>
				<li><a href="Articles"		>Articles</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Home?page=login"	>Login</a></li>
						<li><a href="Home?page=sign-up"	>Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Home?page=logout" 	>Logout</a></li>
						<li><a href="#"					>My Account(<c:out value="${username }"></c:out>)</a></li>
						<li><a href=MyArticles>My Articles</a></li>
					</c:when>
				</c:choose>
				<li><a href="Home?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
</header >