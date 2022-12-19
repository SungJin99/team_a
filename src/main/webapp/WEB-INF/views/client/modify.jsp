<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">고객정보 수정, 삭제</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객정보 수정, 삭제</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/client/modify" method="post">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' id='type' name='type' value='<c:out value="${cri.type}"/>'>
					<div class="form-group">
						<label>#번호</label> <input class="form-control" name='clientid'
						value='<c:out value="${client.clientid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>고객이름</label> <input class="form-control" name='clientName'
						value='<c:out value="${client.clientName}"/>'>	
					</div>
					<div class ="form-group">
						<label>운전면허번호</label>	<input class="form-control" name='driverLicense'
						 value='<c:out value="${client.driverLicense}"/>'>
					</div>
					<div class ="form-group">
						<label>전화번호</label> <input class="form-control" name='phoneNumber'
						value='<c:out value="${client.phoneNumber}"/>'>
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
  					let formObj = $("form");
  					
  					$('button').on("click", function(e){
  						
  						e.preventDefault();
  						
  						let operation = $(this).data("oper");
  						
  						console.log(operation);
  						
  						if(operation === 'remove'){
  							formObj.attr("action", "/client/remove");
  						}
  						else if(operation === 'list'){
  							//move to list
  							formObj.attr("action", "/client/list").attr("method","get");
  							let pageNumTag = $("input[name='pageNum']").clone();
  							let amountTag = $("input[name='amount']").clone();
  							let keywordTag = $("input[name='keyword']").clone();
  							let typeTag = $("input[name='type']").clone();
  							  							
  							formObj.empty();
  							
  							formObj.append(pageNumTag);
  							formObj.append(amountTag);
  							formObj.append(keywordTag);
  							formObj.append(typeTag);
  						}
  						formObj.submit();
  					});
  				});		
  			</script>
<%@include file="../includes/footer.jsp"%>