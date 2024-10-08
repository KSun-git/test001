<script type="text/javascript">
$(document).ready(function() {
	const device = '${device}';
	const menuId = '${menuId}';
	const majorMenuId = menuId.substr(0,2);
	const middleMenuId = menuId.substr(2,2);
	const smallMenuId = menuId.substr(4,2);
	
	<%-- 메뉴(대) --%>
	$('ul#snbMenu').children('.sidebar-heading').each(function(){
		if($(this).data("majorcate") == majorMenuId){
			$(this).addClass("text-warning");
		}
	});
	
	<%-- 메뉴(중) --%>
	$('ul#snbMenu').children('li.nav-item').each(function(){
		if($(this).data("middlecate") == majorMenuId){
			$(this).children('.nav-link').addClass("text-warning font-weight-bold");
			
			<%-- 메뉴(소) --%>
			$(this).find('.collapse-item').each(function(){
				if($(this).data("smallcate") == smallMenuId){
					$(this).addClass("text-warning font-weight-bold");
					if(device == 'PC') {$(this).closest('.collapse').addClass("show");}
				}
			});
		}
	});
	
	<%-- 데이터테이블 적용 --%>
	if($('#dataTable').length > 0) {
		let columnDefs_PC = [{className: "text-center", width: 80, targets: 0},
										{className: "text-center", width: 180, targets: 1},
										{className: "text-right", width: 200, targets: [2,3]},
										{className: "text-right", targets: 4}];
		let columnDefs_MOBILE = [{className: "text-center", width: 160, targets: 0},
											{className: "text-right", width: 180, targets: [1,2]}];
		let dataTable = new DataTable('#dataTable', {
			responsive: true,
			paging: true,
			searching: true,
			ordering:  true,
			lengthChange: false,
			info: false,
			columnDefs: (device == 'PC') ? columnDefs_PC : columnDefs_MOBILE ,
			footerCallback: function (tr, data, start, end, display) {
				let api = this.api();
				let intVal = function (i) {
					return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;	
				};
				
				let amount_column = (device == 'PC') ? 2 : 1 ;
				
				// Total over all pages
				total = api.column(amount_column).data().reduce((a, b) => intVal(a) + intVal(b), 0);
				
				// Total over this page
		        pageTotal = api.column(amount_column, { page: 'current' }).data().reduce((a, b) => intVal(a) + intVal(b), 0);
				
		     	// Update footer
		     	api.column(1).footer().innerHTML = '&#8361;' + addThousandSeparatorCommas(pageTotal) + ' (&#8361;' + addThousandSeparatorCommas(total) + ' total)';
			}
		});
	}
	
	<%-- 도넛차트 적용 --%>
	const data_cnt = Number("${fn:length(deductionStat)}");
	if(data_cnt > 0){
		let stat_labels = new Array();
		let stat_values = new Array();
		<c:forEach items="${deductionStat}" var="list" varStatus="status">
			stat_labels[${status.index}] = "${list.CATE}";
			stat_values[${status.index}] = Number("${list.CATE_AMOUNT}");
		</c:forEach>
		
		const bgColors = ['#FF8000','#FFFF00','#00FF00','#00FFFF','#0000FF','#7F00FF','#FF00FF','#FF007F'];
		const bdColors = ['#CC6600','#CCCC00','#00CC00','#00CCCC','#0000CC','#6600CC','#CC00CC','#CC0066'];
		var ctx  = document.getElementById("donutChart");
		var donutChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: stat_labels,
				datasets: [{
					data: stat_values,
					backgroundColor: bgColors,
					borderColor: bdColors,
					hoverBackgroundColor: "#FF0000",
					hoverBorderColor: "#E74A3B"
				}],
			},
			options: {
				maintainAspectRatio: false,
				tooltips: {
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#FF0000",
					borderColor: '#E74A3B',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					caretPadding: 10,
					callbacks: {
						label: function(tooltipItem, chart) {
							var datasetLabel = chart.labels[tooltipItem.index] || '';
							var datasetValue = chart.datasets[tooltipItem.datasetIndex].data[tooltipItem.index] || '';
							return datasetLabel + ": " + addThousandSeparatorCommas(datasetValue);
						}
					}
				},
				legend: {display: false},
				cutoutPercentage: 80
			}
		});
		
		for(let i=0; i<stat_labels.length; i++){
			$('#donutSummary > tbody > tr > th > i').eq(i).css("color", bgColors[i]);
		}
	}
	
});

<%-- deduction 등록 팝업레이어 --%>
function fn_insertDeductionVwP(){
	$.url = "<c:url value='/test001/finance/popup/insertDeductionVwP.do'/>";
	$.target = "iframe";
	$.width = "600";
	$.height = "420";
	$.title = "300,000 Deduction"; 
	$.callbackFn = "";
	$.formNm = "";
	$.param1 = "gbn=300000";
	popup($.url, $.target, $.width, $.height, $.title , $.callbackFn, $.formNm, $.param1);
}

<%-- deduction 등록 모달레이어 --%>
function fn_insertDeductionVwM(){
	var url = "<c:url value='/test001/finance/modal/insertDeductionVwM.do'/>";
	var target = "insertDeductionVwM";
	var params = {};
	params["gbn"] = '300000';
	modalRoad(target, url, params);
}

<%-- deduction 조회 팝업레이어 --%>
function fn_selectDeductionMonthVwP(){
	$.url = "<c:url value='/test001/finance/popup/selectDeductionMonthVwP.do'/>";
	$.target = "iframe";
	$.width = "400";
	$.height = "380";
	$.title = "300,000 Deduction"; 
	$.callbackFn = "";
	$.formNm = "";
	$.param1 = "searchYYYYMM="+document.searchFrm.searchYYYYMM.value;
	popup($.url, $.target, $.width, $.height, $.title , $.callbackFn, $.formNm, $.param1);
}

<%-- deduction 조회 모달레이어 --%>
function fn_selectDeductionMonthVwM(){
	var url = "<c:url value='/test001/finance/modal/selectDeductionMonthVwM.do'/>";
	var target = "selectDeductionVwM";
	var params = {};
	params["searchYYYYMM"] = document.searchFrm.searchYYYYMM.value;
	modalRoad(target, url, params);
}

<%-- deduction 수정 팝업레이어 --%>
function fn_updateDeductionVwP(no){
	$.url = "<c:url value='/test001/finance/popup/updateDeductionVwP.do'/>";
	$.target = "iframe";
	$.width = "600";
	$.height = "420";
	$.title = "300,000 Deduction"; 
	$.callbackFn = "";
	$.formNm = "";
	$.param1 = "gbn=300000";
	$.param2 = "no="+no;
	popup($.url, $.target, $.width, $.height, $.title , $.callbackFn, $.formNm, $.param1, $.param2);
}

<%-- deduction 수정 모달레이어 --%>
function fn_updateDeductionVwM(no){
	var url = "<c:url value='/test001/finance/modal/updateDeductionVwM.do'/>";
	var target = "updateDeductionVwM";
	var params = {};
	params["gbn"] = '300000';
	params["no"] = no;
	modalRoad(target, url, params);
}

<%-- deduction 조회 --%>
function fn_selectDeductionMonth(yyyymm){
	document.searchFrm.searchYYYYMM.value = yyyymm;
	document.searchFrm.action = "/test001/finance/f300000Deduction.do";
	document.searchFrm.submit();
}
</script>

<%-- datatables --%>
<link rel="stylesheet" href="/plugin/datatables-2.1.2/dataTables.dataTables.css" />
<script src="/plugin/datatables-2.1.2/dataTables.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page Heading -->
<h3 class="mb-0 mt-5 text-gray-800">300,000-Deduction</h3>
<hr class="mt-2 mb-4">

<!-- searchFrm -->
<form id="searchFrm" name="searchFrm" method="post" autocomplete="off">
	<input type="hidden" name="searchYYYYMM" value="${params.searchYYYYMM}" />
</form>

<div class="row">
	<!-- Period (Monthly) Card -->
	<div class="col-lg-4 mb-4">
		<div class="card border-left-primary shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Period (Monthly)</div>
						<div class="h4 mb-0 font-weight-bold text-gray-800">
							<em>${firstDate}</em> ~ <em>${lastDate}</em>
						</div>
						<c:choose>
							<c:when test="${device eq 'PC' }">
								<a class="small text-secondary" href="javascript:fn_selectDeductionMonthVwP()">Configuration &#10140;</a>
							</c:when>
							<c:when test="${device eq 'MOBILE' }">
								<button type="button" class="btn btn-sm text-secondary p-0" data-toggle="modal" data-target="#selectDeductionVwM" onclick="fn_selectDeductionMonthVwM()">Configuration &#10140;</button>
							</c:when>
							<c:otherwise>${device}</c:otherwise>
						</c:choose>
					</div>
					<div class="col-auto">
						<i class="fas fa-calendar fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Period (Monthly) Card -->
	<!-- Deduction Card -->
	<div class="col-lg-4 mb-4">
		<div class="card border-left-success shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Deduction</div>
						<div class="h4 mb-0 font-weight-bold text-gray-800">
							&#8361;<em>${deductionAmountMap.TOTAL_AMOUNT}</em>
							<c:if test="${not empty deductionAmountMap.BALANCE}">
								<span class="text-muted" style="font-size:14px;">&#40;${deductionAmountMap.BALANCE}&#41;</span>
							</c:if>
						</div>
						<c:choose>
							<c:when test="${device eq 'PC' }">
								<a class="small text-secondary" href="javascript:fn_insertDeductionVwP()">Registration &#10140;</a>
							</c:when>
							<c:when test="${device eq 'MOBILE' }">
								<button type="button" class="btn btn-sm text-secondary p-0" data-toggle="modal" data-target="#insertDeductionVwM" onclick="fn_insertDeductionVwM()">Registration &#10140;</button>
							</c:when>
							<c:otherwise>${device}</c:otherwise>
						</c:choose>
					</div>
					<div class="col-auto">
						<i class="fas fa-won-sign fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Deduction Card -->
	<!-- Progress Card -->
	<div class="col-lg-4 mb-4">
		<div class="card border-left-info shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Progress</div>
						<div class="row no-gutters align-items-center">
							<div class="col-auto">
								<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
									<em>${deductionAmountMap.TOTAL_PERCENT}%</em>
								</div>
							</div>
							<div class="col">
								<div class="progress progress-sm mr-2">
									<c:choose>
										<c:when test="${deductionAmountMap.TOTAL_PERCENT ge 80}"><c:set var="progressBg" value="bg-danger" /></c:when>
										<c:when test="${deductionAmountMap.TOTAL_PERCENT ge 40}"><c:set var="progressBg" value="bg-warning" /></c:when>
										<c:otherwise><c:set var="progressBg" value="bg-info" /></c:otherwise>
									</c:choose>
									<div class="progress-bar ${progressBg}" role="progressbar" style="width:${deductionAmountMap.TOTAL_PERCENT}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<a class="small text-secondary text-decoration-none">${deductionAmountMap.TOTAL_AMOUNT} / ${deductionAmountMap.GBN}</a>
					</div>
					<div class="col-auto">
						<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Progress Card -->
</div>

<div class="row">
	<!-- Deduction List -->
	<div class="col-lg-8 mb-8">
		<div class="card shadow mb-4 border-left-secondary">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Deduction List</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<c:choose>
						<c:when test="${device eq 'PC' }">
							<table class="table table-bordered hover" id="dataTable" width="100%" cellspacing="0" data-order='[[ 0, "desc" ]]' data-page-length='15'>
								<thead>
									<tr>
										<th>NO</th>
										<th>Category</th>
										<th>Amount</th>
										<th>Deduction Day</th>
										<th>Bigo</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${deductionList}" var="list" varStatus="status">
										<tr onclick="fn_updateDeductionVwP('${list.NO}')">
											<td>${list.RN}</td>
											<td>${list.CATE}</td>
											<td>${list.AMOUNT_VW}</td>
											<td>${list.DEDUCTION_DE_VW}</td>
											<td>${list.BIGO}</td>
										</tr>
									</c:forEach>
				                 </tbody>
				                 <tfoot>
				                 	<tr>
				                 		<th colspan="5" class="text-center">Total</th>
				                 	</tr>
				                 </tfoot>
							</table>
						</c:when>
						<c:when test="${device eq 'MOBILE' }">
							<table class="table table-bordered hover" id="dataTable" width="100%" cellspacing="0" data-order='[[ 2, "desc" ]]' data-page-length='5'>
								<thead>
									<tr>
										<th>Category</th>
										<th>Amount</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${deductionList}" var="list" varStatus="status">
										<tr data-toggle="modal" data-target="#updateDeductionVwM" onclick="fn_updateDeductionVwM('${list.NO}')">
											<td>${list.CATE}</td>
											<td>${list.AMOUNT_VW}</td>
											<td>${fn:substring(list.DEDUCTION_DE_VW, 5,10)}</td>
										</tr>
									</c:forEach>
				                 </tbody>
				                 <tfoot>
				                 	<tr>
				                 		<th colspan="3" class="text-center">Total</th>
				                 	</tr>
				                 </tfoot>
							</table>
						</c:when>
						<c:otherwise>${device}</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- //Deduction List -->
	<!-- Deduction Stat -->
	<div class="col-lg-4 mb-4">
		<div class="card shadow border-left-secondary shadow">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Deduction Stat</h6>
			</div>
			<div class="card-body">
				 <div class="chart-pie pt-4 pb-2">
				 	<canvas id="donutChart"></canvas>
				 </div>
				
				<div class="d-flex justify-content-center overflow-auto">
					<table id="donutSummary">
						<tbody>
							<c:forEach items="${deductionStat}" var="list" varStatus="status">
								<tr>
									<th><i class="fas fa-square"></i> ${list.CATE}</th>
									<td><span class="px-2">${list.CATE_AMOUNT_VW}</span><em class="text-muted font-weight-lighter">&#40;${list.CATE_STAT}&#37;&#41;</em></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- //Deduction Stat -->
</div>

<!-- modal -->
<c:import url="/test001/layoutModal.do" charEncoding="utf-8">
	<c:param name="targetId" value="insertDeductionVwM" />
</c:import>
<c:import url="/test001/layoutModal.do" charEncoding="utf-8">
	<c:param name="targetId" value="selectDeductionVwM" />
</c:import>
<c:import url="/test001/layoutModal.do" charEncoding="utf-8">
	<c:param name="targetId" value="updateDeductionVwM" />
</c:import>