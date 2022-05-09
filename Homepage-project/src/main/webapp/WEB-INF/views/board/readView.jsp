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
table.type { border-collapse: separate;	border-spacing: 1px; text-align: left; line-height: 1.5; margin: 10px auto; border: 1px solid #ccc; width: 800px; table-layout:fixed;word-break:break-all;}
.ti { padding: 20px 20px 10px 20px;	font-weight: bold; }
.wr { padding: 10px 20px 10px 0px; text-align: right }
.da { padding: 10px 20px 10px 0px; text-align: right }
.co { padding: 40px 20px 20px 20px; }
</style>
</head>
<script type="text/javascript">
		$(document).ready(function() {
		const formObj = $("form[name='readForm']");
		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteconfirm = confirm("글을 삭제하시겠습니까?");
			if (deleteconfirm == true) {
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})

		// 목록으로
		$(".list_btn").on("click", function(){
			if($("input[name='userId']").val()==""){
				location.href = "/board/list?userId=${scri.userId}"
						+"&page=${scri.page}"
						+"&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			}
			else{
				location.href = "/board/memberwritelistPage?userId=${scri.userId}"
					+"&page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			}
				
		})
		
		//댓글 write
		$(".replyWriteBtn").on("click", function(){
			  var formObj = $("form[name='replyForm']");
			  formObj.attr("action", "/board/replyWrite");
			  formObj.submit();
			});
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?userId=${scri.userId}"
							+ "&bno=${read.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});

		//댓글 삭제 post
		$(".replyDeleteBtn").on("click", function(){
			var formObj = $("form[name='deleteForm']");
			var deleteconfirm = confirm("글을 삭제하시겠습니까?");
			if (deleteconfirm == true) {
				formObj.attr("action", "/board/replyDelete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
		
	})
</script>
<body>
	<div id="root">
		<div>
			<%@include file="/WEB-INF/views/board/nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>글</h3>
		</header>
		<hr />
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="userId" name="userId" value="${scri.userId}" />
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			</form>
			<c:if test="${member.userId == read.userId || member.userId == 'root'}">
			<div style="text-align: center">
				<button type="submit" class="update_btn btn btn-default" style="margin-right: 5px">수정</button>
				<button type="submit" class="delete_btn btn btn-default" style="margin-right: 620px">삭제</button>
				<button type="submit" class="list_btn btn btn-default">목록</button>
			</div>
			</c:if>
			
			<c:if test="${member.userId != read.userId && member.userId != 'root'}">
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
						<td class="co" style="font-size: 20px;"><c:out value="${read.content}" /></td>
					</tr>
				</tbody>
			</table>
			
			<div style="text-align: center; padding : 30px 770px 0px 0px">
				<header>
					<h4>댓글</h4>
				</header>
			</div>
			
			<table id="reply" style="margin:0 auto; width: 800px;">
				<tbody>
					<tr>
						<td>
							<ol class="replyList">
								<c:forEach items="${replyList}" var="replyList">
									<form name="deleteForm" role="form" method="post" action="/board/replyDelete">
										<input type="hidden" id="userId" name="userId" value="${scri.userId}" />
										<input type="hidden" name="bno" value="${read.bno}" readonly="readonly" />
										<input type="hidden" id="rno" name="rno" value="${replyList.rno}" />
										<input type="hidden" id="page" name="page" value="${scri.page}">
										<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
										<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
										<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
									</form>
										<hr />
										<li style="margin-bottom: -20px">
											<p style="font-weight: bold;">${replyList.writer}</p>
											<p style="line-height: 1.2;">${replyList.content}</p>
											<p style="line-height: 2.5; color: #949494; font-size: 15px">
												<fmt:formatDate value="${replyList.regdate}"
													pattern="yyyy-MM-dd" />
											</p> <c:if
												test="${member.userId == replyList.repuserId || member.userId == 'root'}">
												<div style="padding-bottom: 20px">
													<button type="button" class="replyUpdateBtn"
														data-rno="${replyList.rno}">수정</button>
													<button type="button" class="replyDeleteBtn"
														data-rno="${replyList.rno}">삭제</button>
												</div>
											</c:if>
										</li>
								</c:forEach>
							</ol>
						</td>
					</tr>
				</tbody>
			</table>
			
			<c:if test="${member.userId != null}">
			<form name="replyForm" method="post">
			<table style="margin: 50px auto; width: 800px; border: 1px solid #ccc;">
				<tr>
					<td style="padding: 20px 20px 0px 20px;">
						<input type="hidden" id="userId" name="userId" value="${scri.userId}" />
						<input type="hidden" id="bno" name="bno" value="${read.bno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

						<div>
							<label for="writer">댓글 작성자 </label>
							<input type="hidden" id="repuserId" name="repuserId" value="${member.userId}"/>
							<input type="text" id="writer" name="writer" size="20" maxlength='10' style="border:none; pointer-events : none; line-height: 1.2;" value="${member.userName}" />
							<br />
							<textarea id="content" name="content" rows="5" cols="92" maxlength='190' style="resize: none; vertical-align: middle; margin: 10px auto 0px auto;"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: center; padding: 10px 0px 20px 0px;">
						<button type="button" class="replyWriteBtn"
							style="width: 50px; padding: 8px 4px; border: 0px solid #999; border-radius: 0px; background: #4CAF50; color: white;">작성</button>
					</td>
				</tr>
			</table>
			</form>
			</c:if>
		</section>
		<hr />
	</div>
</body>
</html>