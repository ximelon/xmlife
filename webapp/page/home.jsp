<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/head.jsp" %>
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
	      <div class="modal-body">
	        <div class="kv-main">
            <br>
            <form enctype="multipart/form-data">
                
                <div class="form-group">
                    <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
                </div>
            </form>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="saveLife();">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div><!-- end modal -->
	
	<%@include file="/page/foot.jsp" %>
  </body>
  <script type="text/javascript">
  	$(function(){
		loadLifeList();
		
		/*监听modal关闭*/
		$('#lifeModal').on('hide.bs.modal',
		    function() {
		        loadLifeList();
		    });
		    
	    $("#file-1").fileinput({
	        uploadUrl: '#', // you must set a valid URL here else you will get an error
	        allowedFileExtensions : ['jpg', 'png','gif'],
	        overwriteInitial: false,
	        maxFileSize: 1000,
	        maxFilesNum: 10,
	        //allowedFileTypes: ['image', 'video', 'flash'],
	        slugCallback: function(filename) {
	            return filename.replace('(', '_').replace(']', '_');
	        }
		});
	});
	
	function loadLifeList(){
		$.ajax({
			type: "post",
			url: "${ctx}/index/loadLifeList.do",
			timeout: 100,
			success: function(data){
				$("#lifeList").html(data);
			},
			error:function(){}
		});
	}
	
	function saveLife(){
		$('#lifeModal').modal('hide');
	}
  </script>
</html>
