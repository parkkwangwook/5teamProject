<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="lib/jquery.validate.min.js"></script>


 <!--------------------- DatePicker --------------------->

 <link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script> 

<title>회원가입</title>
<script>
	$(document).ready(function() {
		var dp = {
				changeMonth : true,
				changeYear : true,
				yearRange : "1930:2015"
			};
		$("#datepicker").datepicker(dp);
		
		
		$("#frm").validate({
			//validation이 끝난 이후의 submit 직전 추가 작업할 부분
			submitHandler : function() {
				var f = confirm("글을 등록하시겠습니까?");
				if (f) {
					return true;
				} else {
					return false;
				}
			},
			//규칙
			rules : {
				name : {
					required : true,
					minlength : 2,
				},
				email : {
					required : true,
					minlength : 2,
					email : true
				},
				phone : {
					required : true,
					minlength : 12
				},
				subject : {
					required : true,
				},
				content : {
					required : true
				},
				pwd : {
					required : true,
					minlength : 6
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				name : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				email : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					email : "메일 기재 규칙에 어긋납니다."
				},
				phone : {
					required : "필수 입력사항 입니다.",
					minlength : "숫자 또는 '-'을 누락하셨습니다."
				},
				subject : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				content : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				pwd : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				}
			}
		});
		
		 var frm = $("#frm");
		for(var item in frm){
		console.log(item+ " : "+frm[item]);
		}
	});
	
/* 	
	
	 $(function() {
			$("#datepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				yearRange : "1930:2015"
			});
		}); 
	 
	  */
	 
</script>

</head>

<body>
	index!!!!!
	<br>

	<h2>회원가입</h2>
	<form id="frm" action="board_action.jsp" method="post">
		<table class="table" style="border-collapse: seperate;">
			<colgroup>
				<col style="align: center;" />
			</colgroup>
			<tbody>
				<tr>
					<th><label>작성자</label></th>
					<td><input type="text" name="name" id="name" value="" /></td>
				</tr>
				<tr>
					<th><label>E-mail</label></th>
					<td><input type="text" name="email" id="email" value="" /></td>
				</tr>
				<tr>
					<th><label>cellphone</label></th>
					<td><input type="text" name="phone" id="phone" value="" /></td>
				</tr>
				<tr>
					<th><label>제목</label></th>
					<td><input type="text" name="subject" id="subject" value="" /></td>
				</tr>
				<tr>
					<th><label>문의내용</label></th>
					<td><textarea class="form-control" id="content" name="content"
							rows="10" maxlength="5000"></textarea></td>
				</tr>
				<tr>
					<th><label>비밀번호</label></th>
					<td><input type="password" name="pwd" id="pwd" value="" /></td>
				</tr>
				<tr>
						<th><label>BIRTH</label></th>
						<td><input type="text" id="datepicker" name="birth" /></td>
				</tr>
			</tbody>
		</table>
		<div align="center" style="margin-bottom: 50px; margin-top: 30px;">
			<button type="submit" id="register" class="btn btn-success">등록</button>
			<button type="button" id="cancel" class="btn btn-warning">취소</button>
		</div>
	</form>
</body>
 		<!-- $("#frm").validate({
			//validation이 끝난 이후의 submit 직전 추가 작업할 부분
			submitHandler : function() {
				var f = confirm("글을 등록하시겠습니까?");
				if (f) {
					return true;
				} else {
					return false;
				}
			},
			//규칙
			rules : {
				name : {
					required : true,
					minlength : 2,
				},
				email : {
					required : true,
					minlength : 2,
					email : true
				},
				phone : {
					required : true,
					minlength : 12
				},
				subject : {
					required : true,
				},
				content : {
					required : true
				},
				pwd : {
					required : true,
					minlength : 6
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				name : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				email : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					email : "메일 기재 규칙에 어긋납니다."
				},
				phone : {
					required : "필수 입력사항 입니다.",
					minlength : "숫자 또는 '-'을 누락하셨습니다."
				},
				subject : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				content : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				pwd : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				}
			}
		});   -->
</html>