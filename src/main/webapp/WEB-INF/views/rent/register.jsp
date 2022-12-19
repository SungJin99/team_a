<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">렌터카 렌트 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">렌터카 렌트 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/rent/register" method="post">
					<div class ="form-group">
						<label>고객이름</label> 
						<select class="form-control" name='clientid'>
							<option value="">==고객이름을 선택해주세요==</option>
							<c:forEach var="client" items="${client}"> 
                                <option value='${client.clientid}'>${client.clientName}</option>
                            </c:forEach>
						</select>
					</div>
					<div class ="form-group">
						<label>차량번호</label>
						<select class="form-control" name='carid'>
							<option value="">==차량번호를 선택해주세요==</option>
							<c:forEach var="car" items="${car}"> 
                                <option value='${car.carid}'>${car.carNumber}</option>
                            </c:forEach>
						</select>
					</div>
					<div class ="form-group">
						<label>렌트 시작일</label> <input class="form-control" name='rentStartDate'
						value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${rent.rentStartDate}"/>'>
					</div>
					<div class ="form-group">
						<label>렌트 종료일</label> <input class="form-control" name='rentEndDate'
						value='<fmt:formatDate value="${rent.rentEndDate}" pattern="yyyy/MM/dd"/>'>
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