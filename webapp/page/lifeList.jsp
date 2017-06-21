<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/page/util/common.jsp"%>
<c:forEach var="file" items="${fileNames}" varStatus="status">
	<c:if test="${status.index%3==0 }">
	<div class="mbr-cards-row row">
	</c:if>
        <div class="mbr-cards-col col-xs-12 col-lg-4" style="padding-top: 40px; padding-bottom: 0px;">
            <div class="container">
              <div class="card cart-block">
                  <div class="card-img"><a href="${ctx}/lifeManage/toAlbumIndex.do"><img src="${ctx}/upload/lifeImages/${file}" class="card-img-top" alt="儿童节" title="儿童节2017-06-01"></a></div>
                  <div class="card-block">
                    <h4 class="card-title">Bootstrap 4${status.index}</h4>
                    <h5 class="card-subtitle">Bootstrap 4 has been noted</h5>
                    </div>
                </div>
            </div>
        </div>
    <c:if test="${status.index%3==2}">
    </div>
    </c:if>
</c:forEach>
