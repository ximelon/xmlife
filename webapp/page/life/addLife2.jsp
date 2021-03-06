<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/page/util/common.jsp"%>
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
	
	<section class="engine"><a rel="external" href="https://mobirise.com">mobirise.com</a></section><section class="mbr-section mbr-after-navbar" id="form1-1f" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 40px;">
	    
	    <div class="mbr-section mbr-section__container mbr-section__container--middle">
	        <div class="container">
	            <div class="row">
	                <div class="col-xs-12 text-xs-center">
	                    <small class="mbr-section-subtitle">一本纪念册，一段小故事</small>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="mbr-section mbr-section-nopadding">
	        <div class="container">
	            <div class="row">
	                <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">
	
	
	                    <div data-form-alert="true">
	                        <div hidden="" data-form-alert-success="true" class="alert alert-form alert-success text-xs-center">Thanks for filling out form!</div>
	                    </div>
	
	
	                    <form id="lifeImagesForm" enctype="multipart/form-data" action="" method="post" data-form-title="CONTACT FORM">
	
	                        <div class="row row-sm-offset">
	
	                            <div class="col-xs-12 col-md-6">
	                                <div class="form-group">
	                                    <label class="form-control-label" for="albumTitle">标题<span class="form-asterisk">*</span></label>
	                                    <input type="text" class="form-control" name="albumTitle" required="" data-form-field="albumTitle" id="albumTitle">
	                                </div>
	                            </div>
	
	                            <div class="col-xs-12 col-md-6">
	                                <div class="form-group">
	                                    <label class="form-control-label" for="subTitle">副标题<span class="form-asterisk">*</span></label>
	                                    <input type="text" class="form-control" name="subTitle" required="" data-form-field="subTitle" id="subTitle">
	                                </div>
	                            </div>
	
	                        </div>
	
	                        <div class="form-group">
	                        	<div class="kv-main">
		                            <label class="form-control-label" for="form1-1f-message">背景图片</label>
		                            <input id="imageFiles" name="imageFiles" type="file" class="file" data-overwrite-initial="false">
	                        	</div>
	                        </div>
	
	                        <div><button type="button" class="btn btn-info" onclick="saveLife();">创 建</button></div>
	
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

  	<%@include file="/footer.jsp" %>
  <input name="animation" type="hidden">
  </body>
  
  <script type="text/javascript">
  	$(function(){
		$("#menu-1c").children("nav.transparent").attr("class", "navbar navbar-dropdown bg-color navbar-fixed-top");
	});
	
	
	$("#imageFiles").fileinput({
		//uploadUrl: '${ctx}/index/saveLifeImages.do',
		language: 'zh', //设置语言
		showUpload: false,
		showRemove: false,
		showCancel: false,
		showCaption: false,//是否显示标题
		browseClass: "btn btn-primary",
		//fileType: "any",
		allowedPreviewTypes: ['image'],
        allowedFileExtensions:  ['jpg', 'png','jpeg'],
        maxFileSize: 2000
	});
	
	function saveLife(){
		var albumTitle = $("#albumTitle").val();
		var subTitle = $("#subTitle").val();
	     
		$.ajaxFileUpload({
			url:'${ctx}/lifeManage/saveLifeImages.do', //用于文件上传的服务器端请求地址
			secureuri: false, //一般设置为false
			fileElementId: 'imageFiles', //文件上传空间的id属性  <input type="file" id="file" name="file" />
           	dataType: 'json', //返回值类型 一般设置为json
            data: {"albumTitle": albumTitle, "subTitle": subTitle},
			success: function (data){  //服务器成功响应处理函数
				window.location.href="${ctx}/albumManage/toAlbumIndex.do?albumId="+data.msg;
			},
			error: function (data, status, e)//服务器响应失败处理函数
			{
				alert(data);
			}
        });
	}
  </script>
    
</html>
