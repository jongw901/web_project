<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
table.type { border-collapse: collapse; text-align: left; line-height: 1.5; margin:0 auto;}
table.type thead th { padding: 10px; font-weight: bold; vertical-align: top; color: black; border-bottom: 1px solid; text-align: center;}
table.type td { padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; }
table.type td a{ color: black;}
table.type td a:hover{ color: black; text-decoration: underline;}
.ti { width: 800px; padding-left: 10px; } .wr{ width: 100px;padding-left: 10px;} .da{ width: 90px; text-align: center;} .da_d{ text-align: center; }
.hi{ width: 50px; text-align: center;} .hi_h{ text-align: center; }

.page_btn {list-style: none; float: left; padding: 10px;}
.page_btn a{color: black;}
.page_btn a:hover{color: black; text-decoration: underline;}
.active{ background-color: white; border: 1px solid;}
.active a{color: #4CAF50; font-weight: bold;}
.active a:hover{color: #4CAF50; font-weight: bold; }

select { width: 150px; padding: 8px 5px; border: 1px solid #999; border-radius: 0px; }
.searchContent{ width: 250px; padding: 8px 5px 7px 5px; border: 1px solid #999; line-height:20px; border-radius: 0px; border-right: none; }
.searchBtn{ width: 60px; padding: 6px 5px 8px 5px; margin-left: -4px; border: 1px solid #999; border-radius: 0px; background: #4CAF50; color: white;}
</style>
<title>게시판</title>
</head>
<body>
	<div id="root">
		<div>
			<%@include file="/WEB-INF/views/board/nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>게시판</h3>
		</header>
		<hr />
		
		<section id="container">
			<form role="form" method="get">
				<table class="type">
					<tr>
						<th class="ti">제목</th>
						<th class="wr">작성자</th>
						<th class="da">등록일</th>
						<th class="hi">조회수</th>
					</tr>
					<c:forEach items="${memberwritelistPage}" var="memberwritelistPage">
						<tr>
							<td><a href="/board/readView?userId=${scri.userId}&
															bno=${memberwritelistPage.bno}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}"><c:out value="${memberwritelistPage.title}" /></a></td>
							<td><c:out value="${memberwritelistPage.writer}" /></td>
							<td class="da_d"><fmt:formatDate value="${memberwritelistPage.regdate}" pattern="MM-dd" /></td>
							<td class="hi_h"><c:out value="${memberwritelistPage.hit}"/></td>
						</tr>
					</c:forEach>
				</table>
				<hr />
				<table style="margin: 0px auto;">
				<tr>
					<td>
						<ul>
							<c:if test="${pageMaker.prev}">
								<li class="page_btn"><a
									href="memberwritelistPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li class="page_btn ${pageMaker.cri.page == idx ? "active" : "" }"><a
									href="memberwritelistPage${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page_btn"><a
									href="memberwritelistPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</td>
				</tr>
				</table>
				
			</form>
		</section>
		</div>
</body>
</html>