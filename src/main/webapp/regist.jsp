<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/messages_zh.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#checkForm1").validate({
		rules:{
			name:{
				required:true
			},
			pwd:{
				required:true
			},
			rpwd:{
				required:true,
				equalTo:"input[name=pwd]"
			}
			
		},
		messages:{
			name:{
				required:"用户名不能为空",
			},
			pwd:{
				required:"密码不能为空"
			},
			rpwd:{
				required:"密码不能为空",
			    equalTo:"密码不一致"
			}
		}
	});
	
	alert($(":input[name=name]").val());
	$(":input[name=name]").blur(function(){
		$.ajax({
			type:"post",
			dataType:"text",
			data:"name=" + $(":input[name=name]").val(),
			
			url:"${pageContext.request.contextPath}/user/queryname.action",
			success:function(data){
				if(data == "false"){
					$("span").text("用户名可用");
					
					
				}else{
					$("span").text("用户名不可用");
					$(":input[name=name]").val("");
					$(":input[name=name]").focus();
				}
			}
		});	

	});

	
});	
	
	
</script>
</head>
<body>
<form id="checkForm1" action="<c:url value="/user/regist.action"/>" method="post">
            <div>
                用户名<input type="text" id="username" name="name"  placeholder="" ><span></span>
            </div>
            <div>
                密码<input type="password" id="password" name="pwd" placeholder="" >
            </div>
            <div>
                确认密码<input type="password" id="repassword" name="rpwd" placeholder="" >
            </div>
            <div><input type="submit" value="注册" class="btn btn-success"> 
            </div>
        </form>
        <a href="<c:url value="/user/login.action"/>">去登录</a>
</body>
</html>