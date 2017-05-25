<%@ include file="/page/util/common.jsp"%>
<c:forEach var="file" items="${fileNames}">
	<div class="col-md-4">
		<div class="thumbnail">
			<img alt="300x200" src="${ctx}/upload/lifeImages/${file}" />
			<div class="caption">
				<h3>
					Thumbnail label
				</h3>
				<p>
					Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
				</p>
				<p>
					 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
				</p>
			</div>
		</div>
	</div>
</c:forEach>
