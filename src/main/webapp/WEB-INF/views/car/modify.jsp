<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">차량 정보 수정, 삭제</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                차량 정보
            </div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일</div>
    		<!-- /.panel-heading -->
      		<div class="panel-body">
      			<div class='form-group uploadDiv'>
      				<input type="file" name='uploadFile' multiple="multiple">
      			</div>
      			<div class="uploadResult">
					<ul>
								
					</ul>
				</div>
			</div>
			<!-- end panel-body -->
        </div>
	</div>
</div>

<!-- /.row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">차량 정보 수정, 삭제</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/car/modify" method="post">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' id='type' name='type' value='<c:out value="${cri.type}"/>'>
					<div class="form-group">
						<label>#번호</label> <input class="form-control" name='carid'
						value='<c:out value="${car.carid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>차량번호</label> <input class="form-control" name='carNumber'
						value='<c:out value="${car.carNumber}"/>'>	
					</div>
					<div class ="form-group">
						<label>차량종류</label>	<input class="form-control" name='series'
						 value='<c:out value="${car.series}"/>'>
					</div>
					<div class ="form-group">
						<label>색상</label> <input class="form-control" name='carColor'
						value='<c:out value="${car.carColor}"/>'>
					</div>
					<button type ="submit" data-oper='modify' class='btn btn-info'>수정</button>
					<button type ="submit" data-oper='remove' class='btn btn-danger'>삭제</button>
					<button type = "submit" data-oper='list' class="btn btn-default">목록으로</button>
				</form>	
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- end /.row -->
  			<script type="text/javascript">
  				$(document).ready(function(){
  					(function(){
  						
  						let carid = '<c:out value="${car.carid}"/>';
  						
  						$.getJSON("/car/getAttachList", {carid: carid}, function(arr){
  						    
  					      console.log(arr);
  					      
  					      let str = "";


  					      $(arr).each(function(i, attach){
  					          
  					          //image type
  					          if(attach.fileType){
  					            let fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
  					            
  					            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
  					            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
  					            str += "<span> "+ attach.fileName+"</span>";
  					            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
  					            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  					            str += "<img src='/display?fileName="+fileCallPath+"'>";
  					            str += "</div>";
  					            str +"</li>";
  					          }else{
  					              
  					            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
  					            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
  					            str += "<span> "+ attach.fileName+"</span><br/>";
  					            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
  					            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  					            str += "<img src='/resources/img/attach.png'></a>";
  					            str += "</div>";
  					            str +"</li>";
  					          }
  					       });

  					      
  					      $(".uploadResult ul").html(str);
  					      
  					    });//end getjson
  					  })();//end function

  					let formObj = $("form");
  					
  					$(".uploadResult").on("click", "button", function(e){
  					    
  					    console.log("delete file");
  					      
  					    if(confirm("Remove this file? ")){
  					    
  					      let targetLi = $(this).closest("li");
  					      targetLi.remove();

  					    }
  					});
  					
  					let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  					let maxSize = 5242880; //5MB
  				  
  				  	function checkExtension(fileName, fileSize){
  				    
  				    	if(fileSize >= maxSize){
  				    	  alert("파일 사이즈 초과");
  				    	  return false;
  				    	}
  				    	
  				    	if(regex.test(fileName)){
  				    	  alert("해당 종류의 파일은 업로드할 수 없습니다.");
  				    	  return false;
  				    	}
  				    	return true;
  				  	}
  					
  				  	$("input[type='file']").change(function(e){

  				  		let formData = new FormData();
  				    
  						let inputFile = $("input[name='uploadFile']");
  					    
  						let files = inputFile[0].files;
  				    
  				   		for(var i = 0; i < files.length; i++){

	  			        if(!checkExtension(files[i].name, files[i].size) ){
  				        	return false;
  				      	}
  				      	formData.append("uploadFile", files[i]);
  				      
					}
  				    
  				    $.ajax({
  				      url: '/uploadAjaxAction',
  				      processData: false, 
  				      contentType: false,data: 
  				      formData,type: 'POST',
  				      dataType:'json',
  				        success: function(result){
  				          console.log(result); 
  						  showUploadResult(result); //업로드 결과 처리 함수 

  				      }
  				    }); //$.ajax
  				    
  				  });
  					
  				  function showUploadResult(uploadResultArr){
  				    
  				    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
  				    
  				    let uploadUL = $(".uploadResult ul");
  				    
  				    let str ="";
  				    
  				    $(uploadResultArr).each(function(i, attach){
  						
  						if(attach.fileType){
  							let fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
  							str += "<li data-path='"+attach.uploadPath+"'";
  							str +=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"
  							str +" ><div>";
  							str += "<span> "+ attach.fileName+"</span>";
  							str += "<button type='button' data-file=\'"+fileCallPath+"\' "
  							str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  							str += "<img src='/display?fileName="+fileCallPath+"'>";
  							str += "</div>";
  							str +"</li>";
  						}else{
  							let fileCallPath =  encodeURIComponent( attach.uploadPath+"/"+ attach.uuid +"_"+attach.fileName);			      
  						    let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
  						      
  							str += "<li "
  							str += "data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
  							str += "<span> "+ attach.fileName+"</span>";
  							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
  							str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  							str += "<img src='/resources/img/attach.png'></a>";
  							str += "</div>";
  							str +"</li>";
  						}

  				    });
  				    
  				    uploadUL.append(str);
  				  }
  				  	
  					$('button').on("click", function(e){
  						
  						e.preventDefault();
  						
  						let operation = $(this).data("oper");
  						
  						console.log(operation);
  						
  						if(operation === 'remove'){
  							formObj.attr("action", "/car/remove");
  						}
  						else if(operation === 'list'){
  							//move to list
  							formObj.attr("action", "/car/list").attr("method","get");
  							let pageNumTag = $("input[name='pageNum']").clone();
  							let amountTag = $("input[name='amount']").clone();
  							let keywordTag = $("input[name='keyword']").clone();
  							let typeTag = $("input[name='type']").clone();
  							  							
  							formObj.empty();
  							
  							formObj.append(pageNumTag);
  							formObj.append(amountTag);
  							formObj.append(keywordTag);
  							formObj.append(typeTag);
  						}else if(operation === 'modify'){
  					        
  					        console.log("submit clicked");
  					        
  					        var str = "";
  					        
  					        $(".uploadResult ul li").each(function(i, obj){
  					          
  					          var jobj = $(obj);
  					          
  					          console.dir(jobj);
  					          
  					          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
  					          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
  					          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
  					          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
  					          
  					        });
  					        formObj.append(str).submit();
  				        }
  				    
  					    formObj.submit();
  					  });
  					});
  			</script>
<%@include file="../includes/footer.jsp"%>