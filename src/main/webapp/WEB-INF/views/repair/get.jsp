<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">렌터카 정비 정보</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                정비 정보
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="form-group">
						<label>정비 #번호</label> <input class="form-control" name='repairid'
						value='<c:out value="${repair.repairid}"/>' readonly="readonly">	
					</div>
					<div class ="form-group">
						<label>차량번호</label>	<input class="form-control" name='carNumber'
						 value='<c:out value="${repair.carNumber}"/>'readonly="readonly">
					</div>
					<div class="form-group">
						<label>정비 항목</label> <input class="form-control" name='repairCheckList'
						value='<c:out value="${repair.repairCheckList}"/>'readonly="readonly">	
					</div>
					<div class="form-group">
						<label>차량 종류</label> <input class="form-control" name='series'
						value='<c:out value="${repair.series}"/>'readonly="readonly">	
					</div>
					<div class ="form-group">
						<label>입고일</label> <input class="form-control" name='receipt'
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${repair.receipt}"/>'readonly="readonly">
					</div>

				<button data-oper="modify" class="btn btn-info" onclick="location.href='/repair/modify?repairid=<c:out value ="${repair.repairid}"/>'">수정</button>
                <button data-oper="list" class="btn btn-default" onclick="location.href='/repair/list'">목록으로</button>

                <form id="operForm" action="/repair/modify" method="get">
                    <input type="hidden" id="repairid" name="repairid" value="<c:out value='${repair.repairid}'/>">
                    <input type="hidden" id="series" name="series" value="<c:out value='${repair.series}'/>">
                    <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                    <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                    <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
                    <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End row -->

<script type="text/javascript">
$(document).ready(function () {
    let operForm = $("#operForm");
    $("button[data-oper='modify']").on("click", function (e) {
        operForm.attr("action", "/repair/modify").submit();
    });
    $("button[data-oper='list']").on("click", function (e) {
        operForm.find("#repairid").remove();
        operForm.attr("action", "/repair/list");
        operForm.submit();
    });
});
</script>
<%@ include file="../includes/footer.jsp" %>