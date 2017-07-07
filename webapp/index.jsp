<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>MLife Home</title>
    <script type="text/javascript">
  	
  	</script>
  </head>
  <body>
	<%@ include file="/menu.jsp" %>
	<div id="content">
	<section class="mbr-section article mbr-parallax-background mbr-after-navbar" id="msg-box8-1l" style="background-image: url(images/index.jpeg); padding-top: 200px; padding-bottom: 160px;">
	    <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(34, 34, 34);">
	    </div>
	    <div class="container">
	        <div class="row">
	            <div class="col-md-8 col-md-offset-2 text-xs-center">
	                <h3 class="mbr-section-title display-2">西&nbsp;&nbsp;瓜&nbsp;&nbsp;傳</h3>
	                <div class="lead"><p>偷得浮生半日閑</p></div>
	                <div><a class="btn btn-info" href="${ctx}/lifeManage/addLife.do"><span class="mbri-image-gallery mbr-iconfont mbr-iconfont-btn"></span>閑&nbsp;記</a></div>
	            </div>
	        </div>
	    </div>
	
	</section>
	
	<section class="mbr-cards mbr-section mbr-section-nopadding" id="lifeList" style="background-color: rgb(255, 255, 255);">
	</section>
	</div>
  <%@include file="/footer.jsp" %>
  <input name="animation" type="hidden">
  </body>
  
  <script type="text/javascript">
  	$(function(){
		loadLifeList();
		
		/*监听modal关闭*/
		$('#lifeModal').on('hide.bs.modal',
		    function() {
		        loadLifeList();
		    });
		
	});
	
	function loadLifeList(){
		$.ajax({
			type: "post",
			url: "${ctx}/lifeManage/loadLifeList.do",
			success: function(data){
				$("#lifeList").html(data);
			},
			error:function(){}
		});
	}
	
	$("#imageFiles").fileinput({
		//uploadUrl: '${ctx}/index/saveLifeImages.do',
		language: 'zh', //设置语言
		showUpload: false,
		showRemove: false,
		showCaption: false,//是否显示标题
		browseClass: "btn btn-primary",
		//fileType: "any",
		allowedPreviewTypes: ['image'],
        allowedFileExtensions:  ['jpg', 'png','jpeg'],
        maxFileSize: 2000
	});
	
	function saveLife(){
	     
		$.ajaxFileUpload({
			url:'${ctx}/lifeManage/saveLifeImages.do', //用于文件上传的服务器端请求地址
			secureuri: false, //一般设置为false
			fileElementId: 'imageFiles', //文件上传空间的id属性  <input type="file" id="file" name="file" />
           //  dataType: 'json', //返回值类型 一般设置为json
			success: function (data){  //服务器成功响应处理函数
				$('#lifeModal').modal('hide');
			},
			error: function (data, status, e)//服务器响应失败处理函数
			{
				alert(data);
			}
        });
	}
  </script>
    
</html>
