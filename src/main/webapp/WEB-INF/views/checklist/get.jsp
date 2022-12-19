<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">고객 정보</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
               	정비 항목 정보
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="form-group">
						<label>#번호</label> <input class="form-control" name='checkListid'
						value='<c:out value="${checkList.checkListid}"/>' readonly="readonly">	
					</div>
					<div class="form-group">
						<label>정비 항목</label> <input class="form-control" name='repairCheckList'
						value='<c:out value="${checkList.repairCheckList}"/>'readonly="readonly">	
					</div>
					<div class="form-group">
						<label>정비 예상일</label> <input class="form-control" name='workTime'
						value='<c:out value="${checkList.workTime}"/>'readonly="readonly">	
					</div>
				<button data-oper="modify" class="btn btn-info" onclick="location.href='/checklist/modify?checkListid=<c:out value ="${checkList.checkListid }"/>'">수정</button>
                <button data-oper="list" class="btn btn-default" onclick="location.href='/checklist/list'">목록으로</button>

                <form id="operForm" action="/checklist/modify" method="get">
                    <input type="hidden" id="checkListid" name="checkListid" value="<c:out value='${checkList.checkListid}'/>">
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
        operForm.attr("action", "/checklist/modify").submit();
    });
    $("button[data-oper='list']").on("click", function (e) {
        operForm.find("#checkListid").remove();
        operForm.attr("action", "/checklist/list");
        operForm.submit();
    });
});
</script>
<%@ include file="../includes/footer.jsp" %>