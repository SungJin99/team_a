<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class= "page-header">고객 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /./row -->

<div class="row">
	<div class =" col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/car/register" method="post">
					<div class="form-group">
						<label>고객 이름</label> <input class="form-control" name='clientName'>
					</div>
					<div class ="form-group">
						<label>운전면허번호</label> <input class="form-control" name='driverLicense'></input>
					</div>
					<div class ="form-group">
						<label>전화번호</label> <input class="form-control" name='phoneNumber'></input>
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