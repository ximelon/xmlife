<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/page/util/common.jsp"%>
<%@include file="/header.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>MLife Home</title>
    <link href="${ctx}/css/resizeImgCommon.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/resizeImg.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
  	
  	</script>
  </head>
  <body>
	<%@ include file="/menu.jsp" %>
	
	<section class="engine"><a rel="external" href="https://mobirise.com">mobirise.com</a></section><section class="mbr-section mbr-after-navbar" id="form1-1f" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 40px;">
	    
	    <div class="mbr-section mbr-section-nopadding">
	        <div class="container">
	            <div class="row">
	                <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">
	
	                    <div data-form-alert="true">
	                        <div hidden="" data-form-alert-success="true" class="alert alert-form alert-success text-xs-center">Thanks for filling out form!</div>
	                    </div>
	
	                    <form id="photoForm" data-form-title="CONTACT FORM">
	                    	<input type="hidden" name="albumId" id="albumId" value="${albumId}"/>
	                        <div class="row row-sm-offset">
	                            <div class="col-xs-12 col-md-6">
	                                <div class="form-group">
	                                    <label class="form-control-label" for="mood">这一刻的心情</label>
	                                    <input type="text" class="form-control" name="mood" required="" data-form-field="mood" id="mood">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="kv-main">
									<section class=" img-section">
										<div class="z_photo upimg-div clear" >
							               	 <section class="z_file fl">
							               	 	<img src="${ctx}/images/a11.png" class="add-img">
							               	 	<input type="file" name="photos" id="photos" class="files" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
							               	 </section>
								         </div>
									 </section>
	                        	</div>
	                        </div>
	                        <div><button type="button" class="btn btn-info" onclick="savePhoto();">发 布</button></div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
  	<%@include file="/footer.jsp" %>
  <input name="animation" type="hidden">
  </body>
  <script src="${ctx}/js/resizeImage.js"></script>
  <script type="text/javascript">
  
  	var sendDatas = [];	//图片dataUrls
	
  	$(function(){
  		$("#menu-1c").children("nav.transparent").attr("class", "navbar navbar-dropdown bg-color navbar-fixed-top");
  	});
  	
  	function savePhoto(){
  		var mood = $("#mood").val();
		var albumId = $("#albumId").val();
  		$.post('${ctx}/albumManage/savePhoto.do',{"mood": mood, "albumId": albumId, "dataUrls":JSON.stringify(sendDatas)},function(data){  
            if(data.status == 'OK'){  
          	  window.location.href="${ctx}/albumManage/toAlbumIndex.do?albumId="+data.msg;
            }else{  
            }  
        });
  	}
  </script>
    
</html>
