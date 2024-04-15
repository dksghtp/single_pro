<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
@import "compass";

@import "compass/reset";

body {
	font-family: "Raleway", Arial, sans-serif;
	font-size: 1.5em;
}

.example-1 {
	position: relative;
	overflow: hidden;
	text-align: center;
	margin: 0 auto;
	padding: 4em 0;
	background: #EEE;
	h1
	,
	h2,
	h3,
	h4,
	h5,
	h6
	{
	margin
	:
	0;
}

.heading-line--container {
	padding: 0 2em;
	width: auto;
	float: none;
	position: relative;
	display: inline-block;
	top: 0;
	bottom: 0;
	margin: 0;
	line-height: 1;
}

.heading-line--left, .heading-line--right {
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	width: 250px; /* customize */
	height: 2px; /* customize */
	background: #999; /* customize */
}

.heading-line--left {
	right: 100%;
}

.heading-line--right {
	left: 100%;
}

.goods-item {
	margin-bottom: 20px;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.goods-img {
	max-width: 100%;
	height: auto;
}
}
</style>
</head>
<body>

	<div class="example-1">
		<span class="heading-line--container"> <span
			class="heading-line--left"></span>
			<h2>맛 집</h2> <span class="heading-line--right"></span>
		</span>
	</div>

</body>
</html>