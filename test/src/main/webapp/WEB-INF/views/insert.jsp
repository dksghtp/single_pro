<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
</head>
<body>

	<header class="header">
		<h1>관리자 페이지</h1>
	</header>

	<aside class="sidebar">
		<ul>
			<li><a href="admin">뒤로가기</a></li>
			
		</ul>
	</aside>

	<h2>상품 등록</h2>

	<form action="insertgoods" method="post">
		<label for="goods_name">상품명:</label> 
		<input type="text" id="goods_name" name="goods_name"><br> 
		
		<label for="goods_price">가격:</label> 
		<input type="text" id="goods_price" name="goods_price"><br> 
		
		<label for="goods_detail">설명:</label>
		<textarea id="goods_detail" name="goods_detail"></textarea><br>
		 
		<label for="goods_count">수량:</label> 
		<input type="text" id="goods_count" name="goods_count"><br> 
		
		<label for="goods_category">분류:</label> 
		<select id="goods_category" name="goods_category">
			<option value="버거">버거</option>
			<option value="김밥">김밥</option>
			<option value="분식">분식</option>
			<option value="음료">음료</option>
			<!-- 필요한 만큼 옵션을 추가하세요 -->
		</select><br> <label for="goods_image">이미지:</label> 
		<input type="file" id="goods_image" name="goods_image"><br>

		<button type="submit">등록</button>
	</form>

</body>
</html>