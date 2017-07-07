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
	
<section class="engine"></section><section class="mbr-section article mbr-parallax-background mbr-after-navbar" id="msg-box8-l" style="background-image: url(${ctx}/lifeAlbum/${album.albumTitle }/background.jpg); padding-top: 160px; padding-bottom: 40px;">

    <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(34, 34, 34);">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-xs-center">
                <h3 class="mbr-section-title display-2">${album.albumTitle }</h3>
                <div class="lead"><p>${album.subTitle }</p></div>
                <div><a class="btn btn-info" href="${ctx}/albumManage/addPhoto.do?albumId=${album.id}"><span class="mbri-camera mbr-iconfont mbr-iconfont-btn"></span>拍 照</a> </div>
            </div>
        </div>
    </div>

</section>

<section class="mbr-gallery mbr-section mbr-section-nopadding mbr-slider-carousel" id="gallery3-1a" data-filter="false" style="background-color: rgb(255, 255, 255); padding-top: 1.5rem; padding-bottom: 1.5rem;">
    <!-- Filter -->
    <c:forEach var="photo" items="${album.photo}" varStatus="photoStat">
	    <section class="mbr-section mbr-section__container article" id="header3-a" style="background-color: rgb(255, 255, 255); padding-top: 20px; padding-bottom: 20px;">
		    <div class="container">
		        <div class="row">
		            <div class="col-xs-12">
		                <h3 class="mbr-section-title display-5">${photo.mood }</h3>
		                <small class="mbr-section-subtitle">${photo.uploadTime}</small>
		            </div>
		        </div>
		    </div>
		</section>
	
	    <!-- Gallery -->
	    <div class="mbr-gallery-row container">
	        <div class=" mbr-gallery-layout-default">
	            <div>
	                <div>
	                	<c:forEach var="photoPath" items="${photo.paths }" varStatus="pathStat">
		                    <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="Awesome" data-video-url="false">
		                        <div href="#lb-gallery3-${photoStat.index }" data-slide-to="${pathStat.index }" data-toggle="modal">
		                            <img alt="" src="${ctx}${photoPath.path}">
		                            <span class="icon-focus"></span>
		                        </div>
		                    </div>
	                    </c:forEach>
	                </div>
	            </div>
	            <div class="clearfix"></div>
	        </div>
	    </div>

    <!-- Lightbox -->
    <div data-app-prevent-settings="" class="mbr-slider modal fade carousel slide" tabindex="-1" data-keyboard="true" data-interval="false" id="lb-gallery3-${photoStat.index }">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <ol class="carousel-indicators">
                    	<c:forEach var="photoPath" items="${photo.paths }" varStatus="pathStat">
                        	<li data-app-prevent-settings="" data-target="#lb-gallery3-${photoStat.index }" data-slide-to="${pathStat.index}"></li>
                        </c:forEach>
                    </ol>
                    <div class="carousel-inner">
                    	<c:forEach var="photoPath" items="${photo.paths }" varStatus="pathStat">
	                        <div  <c:if test="${pathStat.index==0 }">class="carousel-item active"</c:if> <c:if test="${pathStat.index!=0 }">class="carousel-item"</c:if> >
	                            <img alt="" src="${ctx}${photoPath.path}">
	                        </div>
	                    </c:forEach>
                    </div>
                    <a class="left carousel-control" role="button" data-slide="prev" href="#lb-gallery3-${photoStat.index }">
                        <span class="icon-prev" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" role="button" data-slide="next" href="#lb-gallery3-${photoStat.index }">
                        <span class="icon-next" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                    <a class="close" href="#" role="button" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                        <span class="sr-only">Close</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    </c:forEach>
</section>

  <%@include file="/footer.jsp" %>
  <input name="animation" type="hidden">
  </body>
  
  <script type="text/javascript">
  	$(function(){
		
	});
	
  </script>
    
</html>
