<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>MLife Home</title>
    <script type="text/javascript">
  	
  	</script>
  </head>
  <body>
    <div class="container" style="padding-top: 5em;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="jumbotron">
					<h1>Melon Life</h1>
					<p>Just Record Melon Life.</p>
					<p>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#lifeModal">
						记录
						</button>
					</p>
				</div>
				<div class="row" id="lifeList"></div>
				
				<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">MLife</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Link</a>
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="lifeModal" tabindex="-1" role="dialog" aria-labelledby="lifeModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="lifeModalLabel">记录点滴人生</h4>
	      </div>
          <form id="lifeImagesForm" enctype="multipart/form-data">
		      <div class="modal-body">
		        <div class="kv-main">
		            <br>
		                <div class="form-group">
		                    <input id="imageFiles" name="imageFiles" type="file" multiple class="file" data-overwrite-initial="false">
		                </div>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="saveLife();">Save changes</button>
		      </div>
          </form>
	    </div>
	  </div>
	</div><!-- end modal -->
	
	<%@include file="/foot.jsp" %>
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
			url: "${ctx}/index/loadLifeList.do",
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
			url:'${ctx}/index/saveLifeImages.do', //用于文件上传的服务器端请求地址
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
