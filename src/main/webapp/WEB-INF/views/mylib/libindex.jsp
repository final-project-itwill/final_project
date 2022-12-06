<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
	
<!-- 커뮤니티 container -->
	<img class="userphoto rounded-circle" alt="user" src="/images/user.png">
	<div class="container-fluid">
		<div class="row lib-row">
			<!-- 개인정보창 -->
			<div class="lib-info col-12 col-sm-3 col-lg-3">
			<c:forEach items="${libInfo}" var="info">
				<table class="table">
				<tr align="center">
					<td valign="middle" style="line-height: 180%;">
						<span style="font-weight: bold; font-size: 35px;">${info.m_nick}</span><br>
						${lib_id}<br>
					</td>
				</tr>
				<tr>
					<td>
						<div style="background-image: url('/images/heart.png');
									background-position: center;
									background-repeat: no-repeat;
									background-size: 10vh;
									position: relative;
									height: 10vh;">
						<p style="color: white; font-weight: bold; text-align: center; padding-top: 2vh;">${info.m_heat}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						서재에 있는 책은 모두 : ${bookCount}권<br>
						80% 이상 읽은 책은 : ${book80Count}권
					</td>
				</tr>
				<tr>
					<td>
					<button class="btn btn-warning">이번 달 목표 설정하기</button>
					</td>
				</tr>
				<tr>
					<td>
						이번 달은<br>
						<span style="font-weight: bold; font-size: 35px;">4</span> 권 읽기
					</td>
				</tr>
				<tr>
					<td>
						이번 해는<br>
						<span style="font-weight: bold; font-size: 35px;">12</span> 권 읽기
					</td>
				</tr>
				</table>
			</c:forEach>
			</div>
			<!-- 상세페이지 -->
			<div class="lib-cont col-12 col-sm-9 col-lg-9">
				<table class="table">
				<!-- 도서 목록 -->
				<tr>
					<td colspan="4">
						<span style="font-weight: bold; font-size: 35px;">나의 서재 > </span>요즘 읽고 있는 책들이에요
					</td>
				</tr>
				<c:if test="${bookCount==0}"> <!-- 전체 글 개수가 0일 때 : 글이 없을 때 -->
					<tr><td colspan="4">서재에 책 없음</td></tr>
				</c:if>
					<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
				<c:if test="${bookCount!=0}">
					<c:forEach items="${libRead}" var="read" varStatus="vs">
					<c:choose>
					<c:when test="${fn:length(libRead)==1}">
					<td colspan="4">
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${read.b_bookcover == null}">
								<div style="height: 150px; padding: 10px;">
								<img src="/storage/${read.b_bookcover}" width="100px" align="middle">
								</div>
							</c:when>
							<c:otherwise>
								등록된 사진 없음!!<br>
							</c:otherwise>
						</c:choose>
						<br>
						책 제목 : <a href="detail/${read.b_code}">${read.b_name}</a>
						<br>
 						진행도 : <fmt:formatNumber value="${read.lib_proc}" pattern="###"/>%
						</div>
					</td>
					</c:when>
					<c:otherwise>
					<td>
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${read.b_bookcover == null}">
								<div style="height: 150px; padding: 10px;">
								<img src="/storage/${read.b_bookcover}" width="100px" align="middle">
								</div>
							</c:when>
							<c:otherwise>
								등록된 사진 없음!!<br>
							</c:otherwise>
						</c:choose>
						<br>
						책 제목 : <a href="detail/${read.b_code}">${read.b_name}</a>
						<br>
 						진행도 : <fmt:formatNumber value="${read.lib_proc}" pattern="###"/>%
						</div>
					</td>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				</c:if>
				</tr>
				<tr><td colspan="4"><br><br></td></tr>
				<!-- 커뮤니티 -->
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td colspan="4">
						<span style="font-weight: bold; font-size: 35px;">나의 커뮤니티 활동 > </span>최근에 활동한 커뮤니티들이에요
					</td>
				</tr>
					<!-- 가입한 커뮤니티가 없을 때 -->
				<c:if test="${fn:length(commuRead)==0}">
				<tr><td colspan="4">오 이런, 가입한 커뮤니티가 없군요!</td></tr>
				</c:if>
					<!-- 가입한 커뮤니티가 있을 때 -->
				<c:if test="${fn:length(commuRead)!=0}">
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
					<td colspan="2">커뮤니티 이름</td>
					<td>상태</td>
					<td>별점</td>
				</tr>
				<c:forEach items="${commuRead}" var="commu">
				<tr style="text-align: center;">
					<td colspan="2"><a href="#">${commu.c_name}</a></td>
					<td>${commu.c_state}</td>
					<td>${commu.ac_manjok}</td>
				</tr>
				</c:forEach>
				</c:if>
				<tr><td colspan="4"><br><br></td></tr>
				<!-- 서평 -->
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td colspan="4">
						<span style="font-weight: bold; font-size: 35px;">나의 서평 > </span>읽기만 하지 않고 쓰기도 하는 당신
					</td>
				</tr>
					<!-- 작성한 서평이 없을 때 -->
				<c:if test="${fn:length(review)==0}">
				<tr><td colspan="4">오 이런, 서평을 작성하지 않았군요!</td></tr>
				</c:if>
					<!-- 작성한 서평이 있을 때 -->
				<c:if test="${fn:length(review)!=0}">
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
					<td>제목</td>
					<td>책 이름</td>
					<td>별점</td>
					<td>조회수</td>
				</tr>
				<c:forEach items="${review}" var="rv">
				<tr style="text-align: center;">
					<td>${rv.br_title}</td>
					<td>${rv.b_name}</td>
					<td>${rv.br_star}</td>
					<td>${rv.br_count}</td>
				</tr>
				</c:forEach>
				</c:if>
				<tr><td colspan="4"><br><br></td></tr>
				<!-- 방명록 -->
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td colspan="4">
						<span style="font-weight: bold; font-size: 35px;">방명록 > </span>
					</td>
				</tr>			
				</table>
				<div class="container">
				    <label for="content">방명록</label>
				    <form name="visitorInsertForm" id="visitorInsertForm">
				    <div>
				        <input type="hidden" name="lib_id" id="lib_id" value="${lib_id}">
				        <input type="text" name="content" id="content" placeholder="내용을 입력하세요">
				        <button type="button" name="visitorInsertBtn" id="visitorInsertBtn">등록</button>
				    </div>
				    </form>
				</div>
				<hr>
				<div class="container">
				    <div class="visitorList"></div>
				</div>
				
				<!-- 방명록 관련 자바스크립트 -->
				<script>
				    let lib_id='${lib_id}';
				
				    $('#visitorInsertBtn').click(function(){
				        let insertData = $('#visitorInsertForm').serialize();
				        alert(insertData);
				        visitorInsert(insertData);
				    }); // click() end
				
				    // 댓글 등록
				    function visitorInsert(insertData){
				        $.ajax({
				             url:'/mylib/vsinsert'
				            ,type:'post'
				            ,data:insertData
				            ,success:function(data){
				                if(data==1){
				                    visitorList(); // 댓글 작성 후 댓글 목록 함수 호출
				                    $('#vis_content').val('');
				                } // if end
				            } // success end
				        }); // ajax() end
				    }; // commentInsert() end
				    
				    // 방명록 목록
				    function visitorList(){
				        $.ajax({
				             url:"/mylib/vslist"
				            ,type:"get"
				            ,data:{'lib_no':lib_no}
				            ,success:function(data){
				                // alert(data);
				                let a = "";
				                $.each(data, function(key, value){
				                    a += "<div class='visitorArea' style='border-bottm:1px solid darkgray; margin-bottom:15px;'>";
				                    a += "	<div class='visitorInfo" + value.vis_no + "'>";
				                    a += "		댓글번호 : " + value.vis_no + " / 작성자 : " + value.vis_myid + " " + value.vis_rdate;
				                    a += "		<a href='javascript:visitorUpdate(" + value.vis_no + ", \"" + value.vis_content + "\");'>수정</a>";
				                    a += "		<a href='javascript:visitorDelete(" + value.vis_no + ");'>삭제</a>";
				                    a += "	</div>";
				                    a += "	<div class='commentContent" + value.vis_no + "'>";
				                    a += "		<p>내용 : " + value.vis_content + "</p>";
				                    a += "	</div>";
				                    a += "</div>";
				                    // alert(a);
				                }); // each end

				                $(".visitorList").html(a);
				            } // success end
				        }); // ajax() end
				    } // commentList() end

				    // 페이지 로딩 시 댓글 목록 출력시키기
				    $(document).ready(function(){
				        commentList();
				    }); // ready() end
				    
				</script>

			</div>
		</div>
	</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>