<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
          <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加模块','${pageContext.request.contextPath}/server/plant-add.jsp')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <table class="layui-table x-admin">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary" ><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>模块id</th>
            <th>模块标题</th>
            <th>模块描述</th>
            <th>是否屏蔽</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
          <c:forEach items="${list }" var="plate">
          	<tr>
	            <td>
	              <%-- data-id 为layerui的表格绑定数据 --%>
	              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${plate.plantId }'><i class="layui-icon">&#xe605;</i></div>
	            </td>
	            <td>${plate.plantId }</td>
	            <td>${plate.plantTitle }</td>
	            <td>${plate.plantMessage }</td>
	            <td>${plate.isEnable }</td>
	            <td class="td-status">
	              <span class="layui-btn layui-btn-normal layui-btn-mini">可查看</span></td>
	            <td class="td-manage">
	              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="屏蔽">
	                <i class="layui-icon">&#xe601;</i>
	              </a>
	              <a title="编辑"  onclick="x_admin_show('编辑','admin-edit.html')" href="javascript:;">
	                <i class="layui-icon">&#xe642;</i>
	              </a>
	              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
	                <i class="layui-icon">&#xe640;</i>
	              </a>
	            </td>
	          </tr>
          </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>

    </div>
    <script>
    	/* $(function(){
    		$.post("${pageContext.request.contextPath}/PlantServlet?op=show");
    	}) */
    /*   layui.use('table',function(){
    	  var table = layui.table;
    	  tableIns = table.render({
    		  url:"${pageContext.request.contextPath}/PlantServlet?op=show",
    		  method: 'post',
    		  done:function(){
    			  alert("回调含税");
    		  }
    	  });
      }) */
      
      
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            // 使用ajax来实现数据的删除
            $.ajax({
            	url:"${pageContext.request.contextPath}/PlantServlet?op=delAll",
            	type:"post",
            	data:{"ids":JSON.stringify(data)},
            	dataType:"json",
            	success:function(res){
            		if(res.result=="true"){
            			layer.msg('删除成功', {icon: 1});
                        $(".layui-form-checked").not('.header').parents('tr').remove();
            		}else{
            			layer.msg('删除失败', {icon: 2});
                        //$(".layui-form-checked").not('.header').parents('tr').remove();
            		}
            	}
            }
            );
        });
      }
    </script>
  </body>
</html>