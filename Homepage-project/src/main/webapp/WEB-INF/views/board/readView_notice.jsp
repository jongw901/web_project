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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<style type="text/css">
table.type { border-collapse: separate;	border-spacing: 1px; text-align: left; line-height: 1.5; margin: 10px auto; border: 1px solid #ccc; width: 800px; }
.ti { padding: 20px 20px 10px 20px;	font-weight: bold; }
.wr { padding: 10px 20px 10px 0px; text-align: right }
.da { padding: 10px 20px 10px 0px; text-align: right }
.co { padding: 40px 20px 20px 20px; }
</style>
</head>
<script type="text/javascript">
		$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		var formRep = $("form[name='replyForm']");
		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/updateView_notice");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteconfirm = confirm("글을 삭제하시겠습니까?");
			if (deleteconfirm == true) {
				formObj.attr("action", "/board/delete_notice");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})

		// 목로으로
		$(".list_btn").on("click", function(){			
			location.href = "/board/list_notice?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		
	})
</script>
<body>
	<div id="root">
		<div>
			<%@include file="/WEB-INF/views/board/nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>공지사항</h3>
		</header>
		<hr />
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			</form>
			<c:if test="${member.userId == 'root'}">
			<div style="text-align: center">
				<button type="submit" class="update_btn btn btn-default" style="margin-right: 5px">수정</button>
				<button type="submit" class="delete_btn btn btn-default" style="margin-right: 620px">삭제</button>
				<button type="submit" class="list_btn btn btn-default">목록</button>
			</div>
			</c:if>
			
			<c:if test="${member.userId != 'root'}">
			<div style="text-align: center">
				<button type="submit" class="list_btn btn btn-default" style="margin-left: 740px">목록</button>
			</div>
			</c:if>
			
			<table class="type">
				<tbody>
					<tr>
						<td class="ti" style="font-size: 30px"><c:out value="${read.title}" /></td>
					</tr>
					<tr>
						<td class="wr" style="font-size: 15px"><c:out value="${read.writer}" /></td>
					</tr>
					<tr>
						<td class="da" style="font-size: 15px"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td class="co" style="font-size: 20px"><c:out value="${read.content}" /></td>
					</tr>
				</tbody>
			</table>
		</section>
		<hr />
	</div>
</body>
</html>