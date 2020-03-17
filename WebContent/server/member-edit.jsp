<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
   <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/cookie.js"></script>
  </head>
  <body>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" name="userEmail" required="" lay-verify="userEmail"
                  autocomplete="off" class="layui-input" value="${user.userEmail }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>昵称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_username" name="userId" required="" lay-verify="userId"
                  autocomplete="off" class="layui-input" value="${user.userId }" readonly="readonly">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="userpsw" required="" lay-verify="userpsw"
                  autocomplete="off" class="layui-input" value="${user.userpsw }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input" value="${user.userpsw }">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
              	  <c:if test="${user.userSex eq '男' }" var="isCheck">
              	  	 <input type="radio" id="L_username" name="userSex" value="男" lay-verify="userSex"
                  autocomplete="off" class="layui-input" checked="checked">男
                  <input type="radio" id="L_username" name="userSex" value="女" required="" lay-verify="userSex"
                  autocomplete="off" class="layui-input">女
              	  </c:if>
                  <c:if test="${!isCheck }">
                  	<input type="radio" id="L_username" name="userSex" value="男" lay-verify="userSex"
                  	autocomplete="off" class="layui-input">男
                  	<input type="radio" id="L_username" name="userSex" value="女" required="" lay-verify="userSex"
                  	autocomplete="off" class="layui-input" checked="checked">女
                  </c:if>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="edit" lay-submit="">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
  		//取出session
    	/* var thisSession = window.sessionStorage.getItem("user");
  		alert(thisSession); */
      layui.use(['form','layer'], function(){
          $ = layui.jquery;
        var form = layui.form
        ,layer = layui.layer;
      
        //自定义验证规则
        form.verify({
          nikename: function(value){
            if(value.length < 5){
              return '昵称至少得5个字符啊';
            }
          }
          ,pass: [/(.+){6,12}$/, '密码必须6到12位']
          ,repass: function(value){
              if($('#L_pass').val()!=$('#L_repass').val()){
                  return '两次密码不一致';
              }
          }
        });
      	
        //监听提交
        form.on('submit(edit)', function(data){
          console.log(data);
          $.ajax({
          	url:"${pageContext.request.contextPath}/UserServlet?op=update",
          	type:"post",
          	data:data.field,
          	dataType:"text",
          	success:function(text){
          		if(text.trim()=="true"){
          			layer.alert("修改成功", {icon: 6},function () {
	                        //关闭当前frame
	                        x_admin_close();
	                        // 可以对父窗口进行刷新 
	                        x_admin_father_reload();
	                    }); 
          		}else{
          			layer.alert("修改失败", {icon: 2},function () {
	                        //关闭当前frame
	                        x_admin_close();
	                        // 可以对父窗口进行刷新 
	                        x_admin_father_reload();
	                    }); 
          		}
          		//thisSession.clear();
          	}
          });
          return false;
        });
        
      });
  </script>
  </body>
</html>