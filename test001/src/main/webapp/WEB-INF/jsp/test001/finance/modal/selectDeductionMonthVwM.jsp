<style>
	 #popFrm .month:hover{color:#fff !important;background-color:#2e59d9 !important;border-color:#2653d4 !important;cursor:pointer;}
	 #popFrm .month.active{color:#fff !important;background-color:#2e59d9 !important;border-color:#2653d4 !important;cursor:pointer;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	<%-- 초기값 설정 --%>
	var searchYYYY = '<c:out value="${fn:substring(params.searchYYYYMM,0,4)}" />';
	var searchMM = '<c:out value="${fn:substring(params.searchYYYYMM,4,6)}" />';
	$('#selectYear option').each(function(){
		if($(this).val() == searchYYYY){ $(this).attr("selected", "selected"); }
	});
	$('#selectMonth .month').each(function(){
		if($(this).data("month") == searchMM){ $(this).addClass("active"); }
	});
	
	<%-- 월 클릭 이벤트 --%>
	$('#popFrm .month').on("click", function(){
		$('#popFrm .month').removeClass("active");
		$(this).addClass("active");
	});
	
});

function fn_closePopup(){
	parent.popupClose();
}

function fn_selectPopup(){
	var searchYYYY = $('#selectYear option:selected').val();
	var searchMM = $('#selectMonth .month.active').data("month");
	var yyyymm = searchYYYY + "" + searchMM;
	parent.fn_selectDeductionMonth(yyyymm);
}
</script>
<div class="modal-header">
	<h5 class="modal-title" id="staticBackdropLabel">Configuration</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body">
	<form id="popFrm" name="popFrm" method="post" autocomplete="off">
		<div class="row">
        		<div class="col">
        			<select class="form-control text-center w-99" id="selectYear" name="selectYear">
			            <option value="2020">2020년</option>
			            <option value="2021">2021년</option>
			            <option value="2022">2022년</option>
			            <option value="2023">2023년</option>
			            <option value="2024">2024년</option>
			            <option value="2025">2025년</option>
			            <option value="2026">2026년</option>
			            <option value="2027">2027년</option>
			            <option value="2028">2028년</option>
			            <option value="2029">2029년</option>
			            <option value="2030">2030년</option>
			        </select>
        		</div>
        	</div>
		<div class="d-flex flex-wrap justify-content-start align-items-start" id="selectMonth">
			<div class="w-33 py-2 bg-light border text-center month" data-month="01">1월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="02">2월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="03">3월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="04">4월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="05">5월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="06">6월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="07">7월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="08">8월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="09">9월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="10">10월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="11">11월</div>
			<div class="w-33 py-2 bg-light border text-center month" data-month="12">12월</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" onclick="fn_selectPopup()">Select</button>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
</div>