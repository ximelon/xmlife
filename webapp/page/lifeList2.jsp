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
	<div class="column half">
            <p style="text-align: justify;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus leo ante, consectetur sit amet vulputate vel, dapibus sit amet lectus.</p>
       	</div>
        <div class="column half">
            <img src="assets/minimalist-basic/e09-1.jpg" alt="">
       	</div>
</c:forEach>
