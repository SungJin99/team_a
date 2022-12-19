<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="../includes/header.jsp" %>
		
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">렌터카</h1>
                </div>
                 <form id='searchForm' action="/repair/list" method='get'>
                 <select name='type'>
                 		<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                 		<option value="R"<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>정비항목</option>
                 		<option value="S"<c:out value="${pageMaker.cri.type eq 'S'?'selected':''}"/>>차량종류</option>
                 		<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>차량번호</option>
                 		<option value="RS"<c:out value="${pageMaker.cri.type eq 'RS'?'selected':''}"/>>정비항목 or 차량종류</option>
                 		<option value="RC"<c:out value="${pageMaker.cri.type eq 'RC'?'selected':''}"/>>정비항목 or 차량번호</option>
                 		<option value="RSC"<c:out value="${pageMaker.cri.type eq 'RSC'?'selected':''}"/>>정비항목 or 차량종류 or 차량번호</option>
                 </select><input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
                 <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
                 <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
                 <button class='btn btn-default'>Search</button>
                </form>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            정비 렌터카 리스트
                            <button id="regBtn" Type="button" class="btn btn-xs pull-right">
                            정비 렌터카 등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>정비 #번호</th>
                                        <th>차량번호</th>
                                        <th>정비항목</th>
                                        <th>차량종류</th>
                                        <th>입고일</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${repair}" var="repair">
                                	<tr>
                                        <td>
                                        	<a class='move' href='<c:out value="${repair.repairid}"/>'>
                                        		<c:out value="${repair.repairid}"/>
                                        	</a>
                                        </td>
                                        <td><c:out value="${repair.carNumber}"/></td>
                                        <td><c:out value="${repair.repairCheckList}"/></td>
                                        <td><c:out value="${repair.series}"/></td>
                                       	<td><fmt:formatDate pattern="yyyy/MM/dd" value="${repair.receipt}"/></td>
                                    </tr>
                                </c:forEach>
                                <tbody>
                                </tbody>
                            </table>
                            <!-- 페이지 표시 부분 시작 -->
                            <!-- end table -->
                            <div class='pull-right'>
                            	<ul class="pagination">
                            	
                            	 	<c:if test="${pageMaker.prev}">
                            			<li class="paginate_button previous">
                            				<a href=<c:out value = "${pageMaker.startPage -1}"/>>Previous</a>
                            			</li>
                            		</c:if>
                            		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
                            				<a href="${num}">${num}</a>
                            			</li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next}">
                            			<li class="paginate_button next">
                            				<a href=${pageMaker.endPage +1 }>Next</a>
                            			</li>                            		
                            		</c:if>                            
                            	</ul>
                            	<form  id='actionForm' action="/repair/list" method='get'>
                            		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                            	 	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
                            		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
                            	</form>
                            </div>
                            <!-- 페이지 표시 부분 종료 -->
                            <!-- end Pagination -->
                            <!-- add Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                            aria-labelledby="myModalLabel" aria-hidden="true">
                            	<div class="modal-dialog">
                            		<div class="modal-content">
                            			<div class="modal-header">
                            				<button type="button" class="close" data-dismiss="modal"
                            				aria-hidden="true">&times;</button>
                            				<h4 class="modal-title" id="myModalLabel"></h4>
                            			</div>
                            			<div class="modal-body">처리가 완료되었습니다.</div>
                            			<div class="modal-footer">
                            				<button type="button" class="btn btn-default" 
                            				data-dismiss="modal">닫기</button>                            				
                            			</div>
                            		</div>
                            		<!-- /.modal-content -->
                            	</div>
                            	<!-- /.modal-diaLog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<script type="text/javascript">
$(document).ready(function(){
	let result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result ===''|| history.state){
			return;
		}
		
		if(parseInt(result) > 0){
			$(".modal-body").html("차량 " + parseInt(result) + "이 등록 되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		self.location = "/repair/register";
	});
	
	$(".move").on("click", function(e){
			
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='repairid' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/repair/get");
			actionForm.submit();
		});
	
	let actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	let searchForm = $("#searchForm");
	$("#searchForm button").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.perventDefault();
		
		searchForm.submit();
	});
	
});
	
</script>
<%@include file="../includes/footer.jsp" %>