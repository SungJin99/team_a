<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header"> 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객 등록</div>
			<!-- /.panel-heading -->
			<div class ="form-group">
				<form role="form" action="/checklist/register" method="post">
				<div class="form-group">
					<label>정비 항목</label>
						<input class="form-control" name='repairCheckList'
				 	value=<c:out value="${checklist.repairCheckList}"/>></input>
				</div>
				<div class ="form-group">
					<label>정비기간</label>
						<input class="form-control" name='workTime'
				 	value=<c:out value="${checklist.workTime}"/>></input>
				</div>
				<button type="submit" class="btn btn-info">등록</button>
				<button type="reset" class="btn btn-default">초기화</button>
				</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- end /.row -->

<%@include file="../includes/footer.jsp"%>