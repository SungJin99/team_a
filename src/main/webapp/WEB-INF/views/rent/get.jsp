<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">렌터카 정보</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                차량 정보
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="form-group">
						<label>렌터카 #번호</label> <input class="form-control" name='rentid'
						value='<c:out value="${rent.rentid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>고객 #번호</label> <input class="form-control" name='clientid'
						value='<c:out value="${rent.clientid}"/>'readonly="readonly">	
					</div>
					<div class ="form-group">
						<label>차량 #번호</label>	<input class="form-control" name='carid'
						 value='<c:out value="${rent.carid}"/>'readonly="readonly">
					</div>
					<div class ="form-group">
						<label>렌트 시작일</label> <input class="form-control" name='rentStartDate'
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${rent.rentStartDate}"/>'readonly="readonly">
					</div>
					<div class ="form-group">
						<label>렌트 종료일</label> <input class="form-control" name='rentEndDate'
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${rent.rentEndDate}"/>'readonly="readonly">
					</div>
				<button data-oper="modify" class="btn btn-info" onclick="location.href='/rent/modify?rentid=<c:out value ="${rent.rentid}"/>'">수정</button>
                <button data-oper="list" class="btn btn-default" onclick="location.href='/rent/list'">목록으로</button>

                <form id="operForm" action="/rent/modify" method="get">
                    <input type="hidden" id="rentid" name="rentid" value="<c:out value='${rent.rentid}'/>">
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
$(document).ready(function () {
    let operForm = $("#operForm");
    $("button[data-oper='modify']").on("click", function (e) {
        operForm.attr("action", "/rent/modify").submit();
    });
    $("button[data-oper='list']").on("click", function (e) {
        operForm.find("#rentid").remove();
        operForm.attr("action", "/rent/list");
        operForm.submit();
    });
});
</script>
<%@ include file="../includes/footer.jsp" %>