<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
 	ul, ol, li { list-style:none; margin:0; padding:0; }
	ul.top_menu{ margin:0 auto; padding:0; width: 802px;} /*한칸당 약 144px*/
	
	ul.top_menu > li { display:inline-block; width:130px; padding:0; text-align:center; position: relative;}
    ul.top_menu > li a{ display: block; color: black; padding: 20px 10px; text-decoration: none; font-weight: bold;}
    ul.top_menu > li a:hover:not(.homenu){ text-decoration: underline; color: #4CAF50; }
    
    ul.top_menu > li ul.submenu { display:none;  position: absolute; top:60px; left:0;}
    ul.top_menu > li:hover ul.submenu { display:block; }
    
    ul.top_menu > li ul.submenu > li { display:inline-block; width:130px; padding: 0; background:#eee; text-align:center; }
    ul.top_menu > li ul.submenu > li a{ display: block; padding: 10px 10px; font-weight: normal;}
    
    .homenu {background-color: #4CAF50;}
</style>

<div id="menu_container">
	<ul class="top_menu">
		<li><a class="homenu" href="/">Home</a></li>
		<li><a class="menu1" href="/board/list_notice">공지사항</a>
			<ul class="menu1_1 submenu">
				<li>
					<c:if test="${member.userId == 'root'}"><a href="/board/writeView">공지사항 작성</a></c:if>
				</li>
			</ul>
		</li>
		<li><a class="menu2" href="/board/writeView">글쓰기</a></li>
		<li><a class="menu3" href="/board/list">게시판</a></li>
		<li><a class="menu4">회원활동</a>
			<ul class="menu4_1 submenu">
				<li>
					<c:if test="${member != null}"><a href="/board/memberwritelistPage?userId=${member.userId}">내가 쓴 글</a></c:if>
				</li>
				<li>
					<c:if test="${member != null}"><a href="/board/memberreplylistPage?userId=${member.userId}">내가 쓴 댓글</a></c:if>
				</li>
			</ul>
		</li>
		<li><a class="menu5">회원</a>
			<ul class="menu5_1 submenu">
				<li>
					<c:if test="${member != null}"><a href="/member/logout">로그아웃</a></c:if>
				</li>
				<li>
					<c:if test="${member != null}"><a href="/member/memberUpdateView">회원 정보 변경</a></c:if>
				</li>
				<li>
					<c:if test="${member != null}"><a href="/member/memberDeleteView">회원 탈퇴</a></c:if>
				</li>
				<li>
					<c:if test="${member == null}"><a href="/">로그인</a></c:if>
				</li>
				<li>
					<c:if test="${member == null}"><a href="/member/register">회원가입</a></c:if>
				</li>
			</ul>
		</li>
	</ul>
</div>