<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">렌터카 정비 등록</h1>
		<button data-oper="list" class="btn btn-default" onclick="location.href='/repair/list'">목록으로</button>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">렌터카 정비 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/repair/register" method='post'>
					<div class ="form-group">
						<label>정비 항목</label>
						<select class="form-control" name='repairCheckList'>
							<option value="">==선택이 필요합니다.==</option>
							<c:forEach var="checklist" items="${checklist}"> 
                                <option value="${checklist.repairCheckList}">${checklist.repairCheckList}</option>
                            </c:forEach>
						</select>
					</div>
					<div class ="form-group">
						<label>차량번호</label> 
						<select class="form-control" name='carNumber'>
							<option value="">==선택이 필요합니다.==</option>
							<c:forEach var="car" items="${car}"> 
                                <option value="${car.carNumber}">${car.carNumber}</option>
                            </c:forEach>
						</select>
					</div>
					<div class ="form-group">
						<label>입고일</label> <input class="form-control" name='receipt'
						 value=<fmt:formatDate pattern="yyyy/MM/dd" value="${repair.receipt}"/>></input>
					</div>

					<button type="submit" class="btn btn-default">등록</button>
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