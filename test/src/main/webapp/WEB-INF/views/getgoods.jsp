<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세보기</title>

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

	<div class="container mt-5">
		<h2>상품 상세보기</h2>
		<div class="row">
			<div class="col-md-6">
				<form action="updategoods" method="POST">
					<input type="hidden" name="goods_id" value="${goods.goods_id}">
					<p>
						<strong>상품번호:</strong> ${goods.goods_id}
					</p>
					<p>
						<strong>상품명:</strong> 
						<input type="text" name="goods_name"	value="${goods.goods_name}">
					</p>
					<p>
						<strong>가격:</strong> 
						<input type="number" name="goods_price"	value="${goods.goods_price}">
					</p>
					<p>
						<strong>설명:</strong>
						<textarea name="goods_detail">${goods.goods_detail}</textarea>
					</p>
					<p>
						<strong>수량:</strong> 
						<input type="number" name="goods_count" value="${goods.goods_count}">
					</p>
					<p>
						<strong>분류:</strong> 
						<input type="text" name="goods_category" value="${goods.goods_category}">
						<img src="<c:url value='/resources/images/${goods.goods_image}'/>" alt="상품 이미지"></p>
					</p>
					<p>
						<strong>이미지:</strong> <input type="file" name="goods_image">
					</p>
					<button type="submit">수정하기</button>
				</form>
				<form action="deletegoods" method="POST">
	                <input type="hidden" name="goods_id" value="${goods.goods_id}">
	                <button type="submit">상품 삭제</button>
            </form>
			</div>
		</div>
	</div>

</body>
</html>