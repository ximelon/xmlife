/**
 * 图片压缩成base64编码
 * 多图片上传
 */
$(function(){

	var delParent;
	var defaults = {
		fileType         : ["jpg","png","bmp","jpeg", "JPG", "PNG", "BMP", "JPEG"],   // 上传文件的类型
		fileSize         : 1024 * 1024 * 10                  // 上传文件的大小 10M
	};

	/*点击图片的文本框*/
	$("#photos").change(function(){
		var idFile = $(this).attr("id");
		var file = document.getElementById(idFile);
		var imgContainer = $(this).parents(".z_photo"); //的存放图片父亲元素
		var fileList = file.files; //获取的图片文件
		console.log(fileList+"======filelist=====");
		var input = $(this).parent();//文本框的父亲元素
		var imgArr = [];
		//遍历得到的图片文件
		var numUp = imgContainer.find(".up-section").length;
		var totalNum = numUp + fileList.length;  //总的数量
		if(fileList.length > 9 || totalNum > 9 ){
			alert("上传图片数目不可以超过9个，请重新选择");  //一次选择上传超过5个 或者是已经上传和这次上传的到的总数也不可以超过5个
		}
		else if(numUp < 9){
			fileList = validateUp(fileList);
			for(var i = 0;i<fileList.length;i++){

			 var _file = fileList[i];
			 console.info("filetype: " + _file.type);
			 var fileType = _file.type;

			 var imgUrl = window.URL.createObjectURL(fileList[i]);
			     imgArr.push(imgUrl);
			 var $section = $("<section class='up-section fl loading'>");
			     imgContainer.prepend($section);
			 var $span = $("<span class='up-span'>");
			     $span.appendTo($section);
			
			     /*
		     var $img0 = $("<img class='close-upimg'>").on("click",function(event){
				    event.preventDefault();
					event.stopPropagation();
					$(".works-mask").show();
					delParent = $(this).parent();
				});   
				$img0.attr("src","img/a7.png").appendTo($section);*/
		     var $img = $("<img class='up-img up-opcity'>");
		         $img.attr("src",imgArr[i]);
		         $img.appendTo($section);
		     var $p = $("<p class='img-name-p'>");
		         $p.html(fileList[i].name).appendTo($section);
		     var $input = $("<input id='taglocation' name='taglocation' value='' type='hidden'>");
		         $input.appendTo($section);
		     var $input2 = $("<input id='tags' name='tags' value='' type='hidden'/>");
		         $input2.appendTo($section);

		     //开始压缩
		     if(/image\/\w+/.test(fileType)){  
	        	console.log('图片上传中...', function(){});  
	            var fileReader = new FileReader();  
	            fileReader.readAsDataURL(_file);  
	            fileReader.onload = function(event){  
	                var result = event.target.result;   //返回的dataURL  
	                var image = new Image();  
	                image.src = result;  
	                image.onload = function(){  //创建一个image对象，给canvas绘制使用  
	                    var cvs = document.createElement('canvas');  
	                    var scale = 1;    
	                    if(this.width > 800 || this.height > 800){  //1000只是示例，可以根据具体的要求去设定    
	                        if(this.width > this.height){    
	                            scale = 800 / this.width;  
	                        }else{    
	                            scale = 800 / this.height;    
	                        }    
	                    }  
	                    cvs.width = this.width*scale;    
	                                    cvs.height = this.height*scale;     //计算等比缩小后图片宽高  
	                    var ctx = cvs.getContext('2d');    
	                    ctx.drawImage(this, 0, 0, cvs.width, cvs.height);     
	                    var newImageData = cvs.toDataURL(fileType, 0.3);   //重新生成图片，<span style="font-family: Arial, Helvetica, sans-serif;">fileType为用户选择的图片类型</span>  
	                    //var sendData = newImageData.replace("data:"+fileType+";base64,",'');  
	                    sendDatas.push(newImageData);
	                }  
	                  
	            }  
	        }

		   }
		}
		setTimeout(function(){
             $(".up-section").removeClass("loading");
		 	 $(".up-img").removeClass("up-opcity");
		 },450);
		 numUp = imgContainer.find(".up-section").length;
		if(numUp >= 9){
			$(this).parent().hide();
		}
		
		//input内容清空
		$(this).val("");
	});
   
    $(".z_photo").delegate(".close-upimg","click",function(){
     	  $(".works-mask").show();
     	  delParent = $(this).parent();
	});
		
	$(".wsdel-ok").click(function(){
		$(".works-mask").hide();
		var numUp = delParent.siblings().length;
		if(numUp < 10){
			delParent.parent().find(".z_file").show();
		}
		console.info("delParent: "+ delParent);
		 delParent.remove();
		
	});
	
	$(".wsdel-no").click(function(){
		$(".works-mask").hide();
	});
		
	function validateUp(files){
		var arrFiles = [];//替换的文件数组
		for(var i = 0, file; file = files[i]; i++){
			//获取文件上传的后缀名
			var newStr = file.name.split("").reverse().join("");
			if(newStr.split(".")[0] != null){
					var type = newStr.split(".")[0].split("").reverse().join("");
					console.log(type+"===type===");
					if(jQuery.inArray(type, defaults.fileType) > -1){
						// 类型符合，可以上传
						if (file.size >= defaults.fileSize) {
							alert(file.size);
							alert('您这个"'+ file.name +'"文件大小过大');	
						} else {
							// 在这里需要判断当前所有文件中
							arrFiles.push(file);	
						}
					}else{
						alert('您这个"'+ file.name +'"上传类型不符合');	
					}
				}else{
					alert('您这个"'+ file.name +'"没有类型, 无法识别');	
				}
		}
		return arrFiles;
	}
});