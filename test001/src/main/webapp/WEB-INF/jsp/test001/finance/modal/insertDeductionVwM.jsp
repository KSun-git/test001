<script type="text/javascript">
$(document).ready(function() {
	var today = new Date();
	var todayVw = toStringByFormatting(today);
	$('#inline-datepicker').datepicker({
		/*buttonImage: "../2016img/search_calendar.gif", */
		language : "ko" //언어
		, format: 'yyyy-mm-dd' //날짜형식
		, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		, showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		, changeYear: true //콤보박스에서 년 선택 가능
		, changeMonth: true //콤보박스에서 월 선택 가능
		, buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
		, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		, monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		, dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		, dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		, autoclose : true //선택시 자동닫기
		, todayHighlight  : false //오늘날짜하이라이트
		, todayBtn : false //오늘날짜버튼
	}).on("changeDate", function(e) {
		if($(this).next("input[id='picked-date']").length == 1){
			$(this).next("input[id='picked-date']").val(toStringByFormatting(e.date));
		}
	});
	$('#inline-datepicker').datepicker('update', todayVw);
	$('#picked-date').val(todayVw);
});

function fn_registrPopup(){
	if(confirm("regist deduction?")){
		var params = $("#popFrm").serialize();
		$.ajax({
			url: '/test001/finance/popup/insertDeduction.do',
			type: 'post',
			timeout: 10000,
			//dataType: 'json' ,
			data: params,
			async: false,
			success: function(data){
				if(data.result=="success"){
					alert("complete registration");
					parent.location.reload(true);
				} else{
					alert("fail registration");
				}
			},
			error: function (request, status, error) {
				alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
			}
		});
	} else {
		alert("canceled");
	}
}
</script>
<div class="modal-header">
	<h5 class="modal-title" id="staticBackdropLabel">Registration</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body">
	<form id="popFrm" name="popFrm" method="post" autocomplete="off">
		<input type="hidden" name="gbn" value="${gbn}" />
		<div class="d-flex flex-column mb-3">
			
			<div class="text-center">
				<div id="inline-datepicker" class="d-inline-block pl-4 bg-white border"></div>
				<input type="hidden" id="picked-date" name="deductionDe" value="" />
			</div>
			
			<div class="input-group input-group-sm mt-2 px-4">
				<div class="input-group-prepend">
					<span class="input-group-text font-weight-bold">Category</span>
				</div>
				<input type="text" class="form-control" id="cate" name="cate" list="cateList" />
				<datalist id="cateList">
					<c:forEach items="${cateGroupList}" var="list" varStatus="status">
						<option value="${list.CATE}" />
					</c:forEach>
				</datalist>
			</div>
			
			<div class="input-group input-group-sm mt-2 px-4">
				<div class="input-group-prepend">
					<span class="input-group-text font-weight-bold">Amount</span>
				</div>
				<input type="text" class="form-control text-right" id="amount" name="amount" onkeyup="this.value=this.value.replace(/[^0-9]/g,''); addThousandSeparatorCommas(this);" maxlength="12" />
				<div class="input-group-append">
					<span class="input-group-text">&#8361;</span>
				</div>
			</div>
			
			<div class="input-group input-group-sm mt-2 px-4">
				<div class="input-group-prepend">
					<span class="input-group-text font-weight-bold">bigo</span>
				</div>
				<textarea class="form-control" name="bigo" rows="5"></textarea>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" onclick="fn_registrPopup()">Register</button>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
</div>