<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   


   
<!-- 본문작성 시작 -->	
<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">커뮤니티 수정하기</h2>

    <div class="container-fluid col-lg-8 card shadow">
        <p style="text-align: right"><a href="/comm/admin/${c_code}" style="color: #3b5998; margin-top: 20px">돌아가기</a></p>

        <div class="table-responsive">	
	
	
<!-- 설문 소개. -->
	<!-- ** 경환 : 설문지코드 자동생성 : s + 날짜(yyyymmdd) + 커뮤니티코드 -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set> 
	<c:set var="sv_code" value="s${date}-${c_code}"></c:set>
	<!-- count 생성 -->
	<c:set var="c" value='${c+1}'></c:set>
	<c:if test="${c<10}">
		<c:set var="anscodeno" value="od0${j}"></c:set>
	</c:if>
	<c:if test="${c>=10}">
		<c:set var="anscodeno" value="od${j}"></c:set>
	</c:if>
	
<div class="site-section bg-light" id="blog-section">
  <div class="container">
	<h1>설문조사 ${sv_code} ${s_id}</h1><br>
	<!-- <form name="frm1" method="post" action="/survey/create/insert" enctype="multipart/form-dat"> -->
	<div>
	<c:set var="oderno" value="1"></c:set>
		<p class="survey">
			<input type="hidden" class="sv_id" name="sv_id" value="${s_id}">
			<input type="hidden" class="sv_comcode" name="sv_comcode" value="${c_code}"> <!-- 커뮤니티 코드 받아오기 -->
			<input type="hidden" class="sv_code" name="sv_code" value="${sv_code}">
		제목 : <input type="text" class="sv_title" name="sv_title" placeholder="해당 설문지의 제목을 입력하세요.">
		</p>
	</div>
	<div>
		<p class="survey">
		설명 : <input type="text" class="sv_des" name="s_content" placeholder="해당 설문지의 설명을 입력하세요.">
		</p>
	</div>
	<div>
		<p class="survey">
		인원제한 : <input type="number" class="sv_max" name="sv_max">
		</p>
	</div>
	<div>
		<p class="survey">
		마감일 : <input type="date" class="sv_edate" name="sv_edate">
		</p>
	</div>
	<br><hr>
<!-- 설문 템플릿 -->	

 
	
	<hr><br>
	
<!-- 설문지 작성  -->	


	<c:forEach items="${tplread}" var="title" varStatus="tvs">		
	<div class="q_div">	
	
			<input type="text" name="q_title" value="${title.tefo_subject}" placeholder="질문의 제목을 입력하세요." required></input>
			<c:choose>
	
				<c:when test="${title.tefo_type eq 'ju'}">
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju"selected>주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
					
						<div class="layer1" style="display: none"> 
							<div>
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
				</c:when>
	
				<c:when test="${title.tefo_type eq 'gaek' or 'etc'}">
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" selected>객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" >
							<div>
							
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  value="${choice.ch_content}" placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							
							
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
					
				<c:when test="${title.tefo_type eq 'check' or 'etc' }">
					
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" >객관식</option>
						<option value="ju">주관식</option>
						<option value="check" selected>체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3">
							<div>
												
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" value="${choice.ch_content}" placeholder="체크박스 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
								
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
				<c:when test="${title.tefo_type eq 'schedule' }">	
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" selected>시간</option>
						<option value="schedule">날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.tefo_order eq choice.ch_order}">
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek" style="display: none">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" >
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->

				</c:when>
						
				<c:when test="${title.tefo_type eq 'time' }">
					
	
						<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" >시간</option>
						<option value="schedule" selected>날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.tefo_order eq choice.ch_order}">
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek" style="display: none">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" >
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->		
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->
					
				</c:when>
			</c:choose>					
			
		</div>
		<button id="btn_Del">질문삭제</button>	
		</c:forEach> 
		
		  	<div>
				<button id="btn_add">질문추가</button>
			</div>
			
			<br><hr><br>
			<div>
				<button type="button" id="btn_survey" >작성완료</button>
			</div>
				
			
		  </div> <!-- contaioner end -->
		
		</div> <!-- site-section end -->
        </div>
    </div>
    </div>





	<script>

    let q_tag = `
    <div class="q_div">
		<input type="text" name="q_title" placeholder="질문의 제목을 입력하세요."></input>
		<select name="q_type" class="q_type">
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="gaek">객관식</option>
			<option value="ju">주관식</option>x 
			<option value="check">체크박스</option>
			<option value="time">시간</option>
			<option value="schedule">날짜</option>
		</select>
		<div class="layer1" style="display: none">
				<div class="gaek">
					<label><input type='radio' name='radio' onclick="return(false);">
					<input type='text' name="i_content"placeholder="객관식 답변을 입력"></input>
					<input type="button" class="rRemove" value="답변삭제">
					</label>
				</div>
			<button class="btn_answer">답안 추가</button>		
			<hr>
		</div>
		<div class="layer2" style="display: none">
				<div class="ju">
				<input type="text" name="i_content" readonly></input>
				</div>
			<hr>
		</div>
		<div class="layer3" style="display: none">
				<div class="check">
					<label><input type="checkbox" name='checkbox' onclick="return(false);">
					<input type='text' name="i_content" placeholder="체크박스 답변을 입력"></input>
					<input type="button" class="rRemove" value="답변삭제">
					</label>
				</div>
			<button class="btn_checkans">답안 추가</button>
			<hr>
		</div>
		<div class="layer4" style="display: none">
				<div class="time">
				<input type="time" name="i_content" readonly></input>	<hr>
				</div>
		</div>
		<div class="layer5" style="display: none">
				<div class="schedule">
				<input type="date" name="i_content" readonly></input>	
				</div>	
		</div>
		</div>
		<button id="btn_Del">질문삭제</button>
	`; // add end
    
	//btn_add 클릭 질문 생성
    $(document).on('click', '#btn_add', function () {
    	$(this).before(q_tag);
    }); // #btn_add end
	
	//btn-Del 클릭 질문 삭제
	$(document).on('click', '#btn_Del', function (){
        $(this).prev().remove (); // remove the input date
        $(this).remove();		  // remove the button
	}); // #btn_Del end
    
 
	let a_tag =`
	<div class = "gaek">
		<input type='radio' name='radio' onclick="return(false);">
		<input type='text' name="i_content" placeholder="객관식 답변을 입력"></input>
		<input type="button" class="rRemove" value="답변삭제">
	</div>
	`; // radio end
	
	let c_tag =`
	<div class = "check">
		<input type='checkbox' name='checkbox' onclick="return(false);">
		<input type='text' name="i_content" placeholder="체크박스 답변을 입력"></input>
		<input type="button" class="cRemove" value="답변삭제">
	</div>
	`; // checkbox end
			
	$(document).on('click', '.btn_answer', function(){
		$(this).before(a_tag);
		//alert(rcount);
	}); // btn_answer.click end
	
	$(document).on('click', '.btn_checkans', function(){
		$(this).before(c_tag);
		//alert(ccount);
	}); // btb_checkans.click end
	
	$(document).on('click', '.rRemove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
       // alert(rcount);
	}); // radioRemove.click end
	
	$(document).on('click', '.cRemove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
		// alert(ccount);
	}); // radioRemove.click end
	
	$(document).on('change', '.q_type', function() {
		let qs = $(this).find('option:selected').val();
	
		//let qs = $(this).val();
		//let qs =$("#question option:selected").val();
		
		console.log('type: ' + qs);
		if(qs == 'gaek'){ //객관식
 			$(this).next('.layer1').show();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();
 			
		}else if(qs == 'ju'){ //주관식
			$(this).next().hide();
 			$(this).next().next('.layer2').show();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'check'){ //체크박스
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next('.layer3').show();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'time'){ //시간
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next('.layer4').show();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'schedule'){ //날짜
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next('.layer5').show();

		}
	}); // change q_type end
	
	
	$(document).on('click','#btn_survey',function(){
		let sv_code = $('p.survey').find('input.sv_code').val();
		let sv_comcode = $('p.survey').find('input.sv_comcode').val();
		let sv_title = $('p.survey').find('input.sv_title').val();
		let sv_des = $('p.survey').find('input.sv_des').val();
		let sv_id = $('p.survey').find('input.sv_id').val();
		let sv_max = $('p.survey').find('input.sv_max').val();
		let sv_edate = $('p.survey').find('input.sv_edate').val();
		
		let survey = {
			sv_code : sv_code,
			sv_comcode : sv_comcode,
			sv_title : sv_title,
			sv_des : sv_des,
			sv_id : sv_id,
			sv_max : sv_max,
			sv_edate : sv_edate
		};
    
		$.ajax({
			type: "post",
			url:"/survey/create/insert",
			contentType: "application/json",
			data: JSON.stringify(survey),
		})
		.done(function (data) {
			alert("survey성공");
		});
		
			$(".q_div").each(function (i) {
				let dsv_subject = $(this).find('input[name="q_title"]').val();
				// let q_content = $(this).find('input[name="q_content"]:eq(1)').val();
				let dsv_type = $(this).find('option:selected').val();
				let dsv_order = "od0"+(i+1);
				// alert(dsv_subject);
				// alert(dsv_type);
				// alert(dsv_order);
				// alert(sv_code);
			
				let question = {
					dsv_code :sv_code,
					dsv_subject: dsv_subject,
					dsv_type: dsv_type,
					dsv_order: dsv_order
				};
				
 				$.ajax({
					type: "post",
					url:"/survey/create/dinsert",
					contentType: "application/json",
					data: JSON.stringify(question)
				}) 
				.done(function (data) {
					//alert("dsurvey성공");
				});
	
				$(this).find("."+dsv_type+"").find('input[name="i_content"]').each(function (i) {
					//console.log($(this));
					let i_content = $(this).val();
					let ch_anscode = dsv_type.substring(0,1)+0+(i+1);
					// alert(ch_anscode);
					
					let item = {
						ch_code : sv_code,
						ch_order : dsv_order,
						ch_type : dsv_type,
						ch_anscode : ch_anscode,
						ch_content: i_content
						};
					
						 alert(sv_code);
						 alert(dsv_order);
						 alert(dsv_type);
						 alert(i_content);
						
				 	 $.ajax({
						type: "post",
						url:"/survey/create/cinsert",
						contentType: "application/json",
						data: JSON.stringify(item),
						success:function(data){
							alert(data);
						} 
					}) // q_div.i_div function() end
				
				}); // i)div, functoin() end
				
			}); //q_div, function() end	
	//alert("생성 었습니다.");
	window.location.href= "http://localhost:9090/comm/admin/${c_code}";			
	}); // survey end



  /////////////////// AJAX

  </script>

<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>