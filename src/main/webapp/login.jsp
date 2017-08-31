<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/messages_zh.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkForm").validate({
			rules:{
				name:{
					required:true,
				},
				pwd:{
					required:true
				}
				
				
			},
			messages:{
				name:{
					required:"用户名不能为空",
				},
				pwd:{
					required:"密码不能为空"
				}
				
			}
		});
		
		
		
		
		$(":input[name=name]").blur(function(){
			$.ajax({
				type:"post",
				dataType:"text",
				data:"name=" + $(":input[name=name]").val(),
				url:"${pageContext.request.contextPath}/user/queryname.action",
				success:function(data){
					if(data == "false"){
						$("span").text("用户名不能为空");
						$(":input[name=name]").val("");
						$(":input[name=name]").focus();
					}else{
						$("span").text("");
					}
				}
			});	

		});

		
	});	
	

	
</script>
</head>
<body>
<form id="checkForm" action="<c:url value="/user/login.action"/>" method="post">
            <div>
                用户名<input type="text"id="username" name="name"  placeholder="" ><span></span>
                
            </div>
            <div>
                密码<input type="password" id="password" name="pwd" placeholder="" >
            </div>
            <div><input type="submit" value="登录" class="btn btn-success"> 
            </div>
        </form>
         <a href="<c:url value="/user/regist.action"/>">去注册</a>
</body>
</html>