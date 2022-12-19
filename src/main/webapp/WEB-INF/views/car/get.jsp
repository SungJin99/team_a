<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">차량 정보</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>
.uploadResult {
	width: 100%;
	background-color: white;
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
	width: 300px;
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
  background-color: white; 
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
    <div class="col-lg-12">
		<div class="panel panel-default">
            <!-- /.panel-heading -->
            <div class="panel-body">
                	<div class="form-group">
						<label>#번호</label> <input class="form-control" name='carid'
						value='<c:out value="${car.carid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>차량번호</label> <input class="form-control" name='carNumber'
						value='<c:out value="${car.carNumber}"/>'readonly="readonly">	
					</div>
					<div class ="form-group">
						<label>차량종류</label>	<input class="form-control" name='series'
						 value='<c:out value="${car.series}"/>'readonly="readonly">
					</div>
					<div class ="form-group">
						<label>색상</label> <input class="form-control" name='carColor'
						value='<c:out value="${car.carColor}"/>'readonly="readonly">
					</div>
				<button data-oper="modify" class="btn btn-info" onclick="location.href='/car/modify?carid=<c:out value ="${car.carid }"/>'">수정</button>
                <button data-oper="list" class="btn btn-default" onclick="location.href='/car/list'">목록으로</button>

                <form id="operForm" action="/car/modify" method="get">
                    <input type="hidden" id="carid" name="carid" value="<c:out value='${car.carid}'/>">
                    <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                    <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                    <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
                    <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function () {(function(){
    
	let carid = '<c:out value="${car.carid}"/>';
	
    $.getJSON("/car/getAttachList", {carid: carid}, function(arr){
    	console.log(arr);
    	let str = "";
    	
    	$(arr).each(function(i, attach){
    	       
            //image type
            if(attach.fileType){
              var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
              
              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
              str += "<img src='/display?fileName="+fileCallPath+"'>";
              str += "</div>";
              str +"</li>";
            }else{
                
              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
              str += "<span> "+ attach.fileName+"</span><br/>";
              str += "<img src='/resources/img/attach.png'></a>";
              str += "</div>";
              str +"</li>";
            }
          });
    	 $(".uploadResult ul").html(str);
    });//end$.getJSON
})(); //end function

	$(".uploadResult").on("click","li", function(e){
    
    	console.log("view image");
    
    	var liObj = $(this);
    
    	var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
    
    	if(liObj.data("type")){
      		showImage(path.replace(new RegExp(/\\/g),"/"));
    	}else {
      	//download 
      		self.location ="/download?fileName="+path
    	}
  	});
  	
  	
    let operForm = $("#operForm");
    let carid = '<c:out value="${car.carid}"/>';
    $("button[data-oper='modify']").on("click", function (e) {
        operForm.attr("action", "/car/modify").submit();
    });
    $("button[data-oper='list']").on("click", function (e) {
        operForm.find("#carid").remove();
        operForm.attr("action", "/car/list");
        operForm.submit();
    });
    
    function showImage(fileCallPath){
	    
    	alert(fileCallPath);
        
        $(".bigPictureWrapper").css("display").show();
        
        $(".bigPicture")
        .html("<img src='/display?fileName="+fileCallPath+"' >")
        .animate({width:'100%', height: '100%'}, 1000);
	}
    
    $(".bigPictureWrapper").on("click", function(e){
        $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
        setTimeout(function(){
          $('.bigPictureWrapper').hide();
        }, 1000);
      });
    
    
});
</script>

<%@ include file="../includes/footer.jsp" %>