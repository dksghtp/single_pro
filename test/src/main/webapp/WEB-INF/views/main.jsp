<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>키오스크 메인 주문화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    <%@ include file="header.jsp" %>
</style>
</head>
<body>
    
    <div class="container-fluid pt-5 pb-3">
	    <div class="row justify-content-center mb-4">
	        <div class="col-lg-6">
	            <div class="category-buttons d-flex justify-content-between">
	                <a class="btn btn-outline-primary category-button" href="/main?category=버거">버거</a>
	                <a class="btn btn-outline-primary category-button" href="/main?category=김밥">김밥</a>
	                <a class="btn btn-outline-primary category-button" href="/main?category=분식">분식</a>
	                <a class="btn btn-outline-primary category-button" href="/main?category=음료">음료</a>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="container-fluid pt-5 pb-3 main-content">
	    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
	        <span class="pr-3">전체 상품</span>
	    </h2>
	    <a href="/">뒤로가기</a>
	    <div class="row pb-3 justify-content-center">
	        <c:forEach var="item" items="${mainItems}">
	            <div class="col-lg-3 col-md-6 col-sm-6 col-6 pb-1">
	                <div class="goods-item bg-light mb-4 border">
	                    <div class="goods-img position-relative overflow-hidden">
	                        <img src="<c:url value='/resources/images/${item.goods_image}'/> " width="100%" alt="상품 이미지">
	                    </div>
	                    <div class="text-center py-4">
	                        <h5>${item.goods_name}</h5>
	                        <p>
	                            가격: <fmt:formatNumber value="${item.goods_price}" pattern="#,##0 원" />
	                        </p>
	                        <p>상세 정보: ${item.goods_detail}</p>
	                        <p>수량: ${item.goods_count}</p>
	                        <p>분류: ${item.goods_category}</p>
	                        <button class="btn btn-primary add-to-cart-btn" data-goods-id="${item.goods_id}">장바구니 추가</button>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

    <div class="row pb-3 justify-content-center">
	    <div class="col-lg-6">
	        <div class="card">
	            <h5 class="card-header bg-secondary text-white">장바구니</h5>
	            <div class="card-body">
	                <ul class="list-group" id="cartItemsList">
	                    <!-- 장바구니에 추가된 각 상품 목록 -->
	                    <c:forEach var="cartmain" items="${addcart}">
	                        <li class="list-group-item d-flex justify-content-between align-items-center">
	                            ${cartmain.goods_name} - 가격: 
	                            <fmt:formatNumber value="${cartmain.goods_price}" pattern="#,##0 원" /> 
	                            <!-- 수량 조절 버튼 -->
	                            <button class="btn btn-outline-primary btn-sm decrease-quantity-btn" data-goods-id="${cartmain.goods_id}">-</button> 
	                            <span class="mx-2">${cartmain.quantity}</span>
	                            <button class="btn btn-outline-primary btn-sm increase-quantity-btn" data-goods-id="${cartmain.goods_id}">+</button>
	                            <button class="btn btn-danger remove-from-cart-btn" data-goods-id="${cartmain.goods_id}">삭제</button>
	                        </li>
	                    </c:forEach>
	                </ul>
	                <button class="btn btn-success order-btn col-md-12" data-goods-id="${cartmain.goods_id}">주문하기</button>
	            </div>
	        </div>
	    </div>
	</div>
    
    <!-- 모달 창 -->
    <div class="modal fade" id="addToCartModal" tabindex="-1" role="dialog" aria-labelledby="addToCartModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addToCartModalLabel">장바구니 추가</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            장바구니에 상품이 추가되었습니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
	    $(document).ready(function() {
	        $(".add-to-cart-btn").click(function(){
	            var goods_id = $(this).data("goods-id");
	            var productItem = $(this).closest(".goods-item");
	            var goods_name = productItem.find("h5").text();
	            var goods_price = productItem.find("p").eq(0).text().replace("가격: ", "");
	            
	            var cartItemHTML = 
	                '<li class="list-group-item d-flex justify-content-between align-items-center">' +
	                goods_name + goods_price +
	                '<button class="btn btn-outline-primary btn-sm decrease-quantity-btn" data-goods-id="' + goods_id + '">-</button>' + 
	                '<span class="mx-2">1</span>' +
	                '<button class="btn btn-outline-primary btn-sm increase-quantity-btn" data-goods-id="' + goods_id + '">+</button>' +
	                '<button class="btn btn-danger remove-from-cart-btn" data-goods-id="' + goods_id + '">삭제</button>' +
	                '</li>';
	            
	            $("#cartItemsList").append(cartItemHTML);
	            
	            console.log("Add to cart button clicked");
	            $('#addToCartModal').modal('show');
	            
	         	// 주문하기 버튼의 data-goods-id 속성 설정
	            $(".order-btn").data("goods-id", goods_id);
	            
	        });
	    });
	    
	 // 수량 감소 버튼 클릭 시
	    $(document).on("click", ".decrease-quantity-btn", function() {
	        var goods_id = $(this).data("goods-id");
	        var quantitySpan = $(this).siblings("span");
	        var quantity = parseInt(quantitySpan.text());
	        if (quantity > 1) {
	            quantity--;
	            quantitySpan.text(quantity);
	            // 여기에 수량 감소 로직을 추가
	        }
	    });
	 
	 // 수량 증가 버튼 클릭 시
	    $(document).on("click", ".increase-quantity-btn", function() {
	        var goods_id = $(this).data("goods-id");
	        var quantitySpan = $(this).siblings("span");
	        var quantity = parseInt(quantitySpan.text());
	        quantity++;
	        quantitySpan.text(quantity);
	        // 여기에 수량 증가 로직을 추가
	    });

	    // 상품 삭제 버튼 클릭 시
	    $(document).on("click", ".remove-from-cart-btn", function() {
	        var goods_id = $(this).data("goods-id");
	        $(this).closest("li").remove();
	        // 여기에 상품 삭제 로직을 추가
	    });
	    
         $(document).ready(function() {
            $(".order-btn").click(function() {
                var goods_id = $(this).data("goods-id");
                console.log(goods_id);
                $.ajax({
                    url: "/addcart", // 장바구니 추가 요청을 처리할 URL
                    method: "GET",
                    data: { goods_id: goods_id }, // 선택한 상품의 ID를 서버로 전송
                    success: function(response) {
                        // 추가 성공 시의 동작
                        console.log("상품이 장바구니에 추가되었습니다.");
                    },
                    error: function(xhr, status, error) {
                        // 오류 발생 시의 동작
                        console.error("장바구니 추가 중 오류가 발생했습니다:", error);
                    }
                });
            });
        }); 
         function addToCart(goods_id, goods_name, goods_price) {
        	    // 이전에 저장된 장바구니 정보 가져오기
        	    var cartItems = JSON.parse(sessionStorage.getItem('cartItems')) || [];

        	    // 새로운 상품 정보 추가
        	    var newItem = {
        	        goods_id: goods_id,
        	        goods_name: goods_name,
        	        goods_price: goods_price
        	    };
        	    cartItems.push(newItem);

        	    // 장바구니 정보를 세션에 저장
        	    sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
        	}
      // 페이지 로드 시 장바구니 정보를 화면에 표시
         function renderCart() {
             var cartItems = JSON.parse(sessionStorage.getItem('cartItems')) || [];
             // 장바구니 정보를 화면에 표시하는 코드 작성
         }

         $(document).ready(function() {
             renderCart();
         });
    </script>
    
</body>
</html>