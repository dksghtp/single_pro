<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
</head>
<body>

	<header class="header">
		<h1>관리자 페이지</h1>
		<ul>
			<li><a href="/">뒤로가기</a></li>
		</ul>
	</header>

	<aside class="sidebar">
		<ul>
			<li><a href="insert">상품 등록</a></li>
		</ul>
	</aside>
	<h2>등록된 상품</h2>
	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>설명</th>
				<th>수량</th>
				<th>분류</th>
				<th>이미지
				<th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${admingoodsList}" var="admin">
				<tr>
					<td><a href="getgoods?goods_id=${admin.goods_id}">${admin.goods_id}</a></td>
					<td>${admin.goods_name}</td>
					<td>${admin.goods_price}</td>
					<td>${admin.goods_detail}</td>
					<td>${admin.goods_count}</td>
					<td>${admin.goods_category}</td>
					<td>${admin.goods_image}</td>
					<td><a href="deletegoods?goods_id=${admin.goods_id}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>