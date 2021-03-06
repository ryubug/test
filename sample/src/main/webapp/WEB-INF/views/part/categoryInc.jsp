<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <link rel="stylesheet" href="/css/reset.css">
    
    <style>
     
    /* categories */

        .categories-wrap {
            display: flex;
            justify-content: space-between;
     		
        }

        .categories-left {
            flex-basis: 20%;
        }

        .categories-main {
            flex-basis: 80%;
        }


        /* featured */

        .featured-wrap {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .featured-item {
            flex-basis: 32.5%;
            height: auto;
            border: 1px solid #eee;
        }

        .featured-img img {
            display: inline-block;
            width: 100%;
            cursor: pointer;
        }

        .cart-icon {
            display: none;

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            background-color: tomato;
            padding: 10px 14px;
            border-radius: 3px;
        }

        .featured-img:hover .cart-icon {
            display: inline-block;
        }

        .featured-img:hover i {
            color:#fff;
        }
    
    </style>
<main class="margin-t20">
        <div class="container">
            <div class="categories-area bg-white padding-tb50">
                <div class="categories-title align">
                    <p class="font-12">Home | ${majorName}</p>
                    <h2 class="margin-t10 margin-b30">${minorName}</h2>
                </div>
                <div class="categories-wrap padding-lr40">
                    <div class="categories-left">
                    <div class="brand">
                            <h3 class="black-70 font-18 margin-t50 margin-b20">BRAND</h3>
                            <ul>
                            <c:forEach var="minorList" items="${minorList}" >
                                <li class="black-70 font-16 bold-500 margin-b10">
   									<a href="/getCategories?majorName=${minorList.majorName}&minorName=${minorList.minorName}" class="">${minorList.minorName} <i class="black-70 bold-600"></i></a>                                  
                                </li>
                             </c:forEach>
                             
                            </ul>
                        </div>
                        <div class="categories margin-t50">
                            <h3 class="black-70 font-18 ">CATEGORIES</h3>
                            <ul>
                               <c:forEach var="majorList" items="${majorList}">
                                 <li class="black-70 font-16 bold-500 margin-b10">
                 				     <a href="/getCategories?majorName=${majorList.majorName}&minorName=${majorList.minorName}" class="">${majorList.majorName} <i class="black-70 bold-600"></i></a>
                                 </li>
                			   </c:forEach>
                              
                            </ul>
                        </div>
                        
                    </div>
                    <div class="categories-main">
                        <div class="categories-title">
                            <p class="black-70 font-17 margin-b20 bold-600">Categories Top Banner</p>
                            <p class="font-15 line-150">standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type specimen book.</p>
                            <hr class="hr margin-tb30">
                        </div>
                        <div class="categories-content">
                            <p class="font-20 bold-700">FEATURED PRODUCTS</p>
                            <div class="featured-content">
                                <div class="featured-wrap">
                                    <c:forEach items="${pList}" var="pList">
	                                    <div class="featured-item bg-white margin-t10">
	                                        <div class="featured-img pos-rel padding-a10">
	                                            <a href="/getProductDetail?majorName=${pList.majorName}&minorName=${pList.minorName}&pid=${pList.pid}">
	                                            	<img src="/images/product/${fn:split(pList.safeFile, ';')[0]}">
	                                            </a>
	                                            <span class="cart-icon">
	                                            	<a href="/setProductCart?majorName=${pList.majorName}&minorName=${pList.minorName}&pid=${pList.pid}">
	                                                	<i class="fal fa-shopping-bag font-30 black-70"></i>
	                                            	</a>
	                                            </span>
	                                        </div>
	                                        <hr class="hr">
	                                        <div class="featured-text padding-a10 align">
	                                            <h4 class="item-title nanum font-14 margin-b10 line-150">
	                                           	 ${pList.productName}
	                                            </h4>
	                                                <p class="nanum font-14 bold-600">&#8361;${pList.productPrice}원( ${pList.productDelivery} )</p>
	                                                <p class="nanum font-13 margin-t10">
							                            <c:forEach begin="1" end="${pList.productStar}" var="star">
															<i class="fas fa-star tomato"></i>
														</c:forEach>
						
														<c:forEach begin="1" end="${5 - pList.productStar}">
															<i class="fas fa-star black-30"></i>
														</c:forEach>
		                							</p>
	                                       	 </div>
	                                    	</div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>