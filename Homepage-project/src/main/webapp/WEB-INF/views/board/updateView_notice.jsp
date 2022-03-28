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
<title>공지사항</title>
<style type="text/css">
textarea{resize: none; vertical-align: middle;}
table.type { margin:0 auto;}
.update_btn{ width: 80px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #4CAF50; color: white; }
.cancel_btn{ width: 60px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #D45353; color: white; }
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/board/readView_notice?bno=${update.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
		})
		$(".update_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/update_notice");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
	<div id="root">
		<div>
			<%@include file="/WEB-INF/views/board/nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>공지사항수정</h3>
		</header>
		<hr />
		<section id="container">
			<form name="updateForm" role="form" method="post" action="/board/update_notice">
				<input type="hidden" name="bno" value="${update.bno}" readonly="readonly" />
				<table class="type">
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label>
								<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요." size="100"  maxlength='50' style="line-height:30px; margin: 10px" value="${update.title}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label>
								<textarea id="content" name="content" class="chk" title="내용을 입력하세요." rows="10" cols="103" maxlength='1000' style="margin: 10px"><c:out value="${update.content}" /></textarea></td>
						</tr>
						<tr>
							<td>
								<label for="writer" style="margin-left: 40px">작성자</label>
								<input type="text" id="writer" name="writer" style="background-color:transparent;border:0px" value="${update.writer}" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td>
							<label for="regdate" style="margin-left: 40px">작성날짜</label> <fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center">
					<button type="submit" class="update_btn" style="margin-right: 5px">수정완료</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>