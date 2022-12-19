<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">렌터카 정비 수정, 삭제</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">렌터카 정비 수정, 삭제</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/repair/modify" method="post">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' id='type' name='type' value='<c:out value="${cri.type}"/>'>
					<div class="form-group">
						<label>정비 #번호</label> <input class="form-control" name='repairid'
						value='<c:out value="${repair.repairid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>차량번호</label>
						<select class="form-control" name='carNumber'>
							<option value="">==차량번호를 선택해주세요==</option>
							<c:forEach var="car" items="${car}"> 
                                <option value='${car.carNumber}'>${car.carNumber}</option>
                            </c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>정비항목</label>
						<select class="form-control" name='repairCheckList'>
							<option value="">==정비항목을 선택해주세요==</option>
							<c:forEach var="checkList" items="${checkList}"> 
                                <option value='${checkList.repairCheckList}'>${checkList.repairCheckList}</option>
                            </c:forEach>
						</select>
					</div>
					<div class ="form-group">
						<label>입고일</label> <input class="form-control" name='receipt'
						 value=<fmt:formatDate pattern="yyyy/MM/dd" value="${repair.receipt}"/>></input>
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
  							formObj.attr("action", "/checklist/remove");
  						}
  						else if(operation === 'list'){
  							//move to list
  							formObj.attr("action", "/checklist/list").attr("method","get");
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