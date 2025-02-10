<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="insertFcModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h5 class="modal-title">일정추가</h5>
    			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    		</div>
    		<div class="modal-body" style="color:#333;">
    			<form name="insFrm" id="insFrm" method="post" action="">
	    			<div>
	    				<label for="isAllDay" style="width:90px;"><i class="bi bi-dot"></i>종일</label>
	    				<input type="checkbox" class="isAllDay" name="isAllDay" aria-describedby="isAllDay" />
	    			</div>
	    			<div>
	    				<label for="title" style="width:90px;"><i class="bi bi-dot"></i>일정이름<em class="text-danger">*</em></label>
	    				<input type="text" class="title" name="title" aria-describedby="title" style="width:245px;" />
	    			</div>
	    			<div>
	    				<label for="startDe" style="width:90px;"><i class="bi bi-dot"></i>시작시간<em class="text-danger">*</em></label>
	    				<input type="hidden" class="startDate" name="startDate" />
	    				<input type="date" class="startDe" name="startDe" aria-describedby="startDe" />
	    				<select class="startHour" name="startHour" style="height:30px;">
	    					<c:forEach var="hour" begin="8" end="20" step="1" >
	    						<c:set var="fmtHour"><fmt:formatNumber value="${hour}" pattern="00"/></c:set>
	    						<c:choose>
	    							<c:when test="${hour eq 9}">
	    								<option value="${fmtHour}" selected>${fmtHour}</option>
	    							</c:when>
	    							<c:otherwise>
	    								<option value="${fmtHour}">${fmtHour}</option>
	    							</c:otherwise>
	    						</c:choose>
	    					</c:forEach>
	    				</select>
	    				<em>:</em>
	    				<select class="startMinute" name="startMinute" style="height:30px;">
	    					<c:forEach var="minute" begin="0" end="55" step="5" >
	    						<c:set var="fmtMinute"><fmt:formatNumber value="${minute}" pattern="00"/></c:set>
	    						<option value="${fmtMinute}">${fmtMinute}</option>
	    					</c:forEach>
	    				</select>
	    			</div>
	    			<div>
	    				<label for="endDe" style="width:90px;"><i class="bi bi-dot"></i>종료시간<em class="text-danger">*</em></label>
	    				<input type="hidden" class="endDate" name="endDate" />
	    				<input type="date" class="endDe" name="endDe" aria-describedby="endDe" />
	    				<select class="endHour" name="endHour" style="height:30px;">
	    					<c:forEach var="hour" begin="8" end="20" step="1" >
	    						<c:set var="fmtHour"><fmt:formatNumber value="${hour}" pattern="00"/></c:set>
	    						<c:choose>
	    							<c:when test="${hour eq 18}">
	    								<option value="${fmtHour}" selected>${fmtHour}</option>
	    							</c:when>
	    							<c:otherwise>
	    								<option value="${fmtHour}">${fmtHour}</option>
	    							</c:otherwise>
	    						</c:choose>
	    					</c:forEach>
	    				</select>
	    				<em>:</em>
	    				<select class="endMinute" name="endMinute" style="height:30px;">
	    					<c:forEach var="minute" begin="0" end="55" step="5" >
	    						<c:set var="fmtMinute"><fmt:formatNumber value="${minute}" pattern="00"/></c:set>
	    						<option value="${fmtMinute}">${fmtMinute}</option>
	    					</c:forEach>
	    				</select>
	    			</div>
	    			<div>
	    				<label for="bgColor" style="width:50px;"><i class="bi bi-dot"></i>색상</label>
	    				<input type="hidden" class="bgColor" name="bgColor" aria-describedby="bgColor" readonly />
	    				<span>
	    					<em class="pickedColor text-muted selWhite">none</em>
	    					<em class="pickedColor d-none text-primary selPrimary">#007bff</em>
	    					<em class="pickedColor d-none text-success selSuccess">#28a745</em>
	    					<em class="pickedColor d-none text-danger selDanger">#dc3545</em>
	    					<em class="pickedColor d-none text-warning selWarning">#ffc107</em>
	    					<em class="pickedColor d-none text-info selInfo">#17a2b8</em>
	    					<em class="pickedColor d-none text-secondary selSecondary">#6c757d</em>
	    					<em class="pickedColor d-none text-dark selDark">#343a40</em>
	    				</span>
	    				<div class="d-flex flex-wrap justify-content-start">
	    					<div role="button" class="palette p-2 bg-white border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-primary border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-success border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-danger border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-warning border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-info border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-secondary border"><i class="bi bi-eyedropper p-2"></i></div>
	    					<div role="button" class="palette p-2 bg-dark border"><i class="bi bi-eyedropper p-2"></i></div>
	    				</div>
	    			</div>
    			</form>
    		</div>
    		<div class="modal-footer">
    			<button type="button" class="btn btn-primary" onclick="fn_addSchedule()">추가</button>
    			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
    		</div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		<%-- 모달닫기 이벤트 --%>
		$('#insertFcModal').on('hidden.bs.modal', function (event) {
			$('#insertFcModal .isAllDay').prop("checked", false);
			$('#insertFcModal .title').val("");
			$('#insertFcModal .startDate').val("");
			$('#insertFcModal .startDe').val("");
			$('#insertFcModal .startHour').prop("disabled", false);
			$('#insertFcModal .startMinute').prop("disabled", false);
			$('#insertFcModal .startDate').val("");
			$('#insertFcModal .endDe').val("");
			$('#insertFcModal .endDe').prop("disabled", false);
			$('#insertFcModal .endHour').prop("disabled", false);
			$('#insertFcModal .endMinute').prop("disabled", false);
			$('#insertFcModal .bgColor').val("");
			$('#insertFcModal .pickedColor').addClass("d-none");
			$('#insertFcModal .selWhite').removeClass("d-none");
		});
		
		<%-- 종일 클릭 이벤트 --%>
		$('#insertFcModal .isAllDay').on('click', function (event) {
			if($(this).is(":checked")){
				$('#insertFcModal .startHour').prop("disabled", true);
				$('#insertFcModal .startMinute').prop("disabled", true);
				$('#insertFcModal .endDe').prop("disabled", true);
				$('#insertFcModal .endHour').prop("disabled", true);
				$('#insertFcModal .endMinute').prop("disabled", true);
			} else {
				$('#insertFcModal .startHour').prop("disabled", false);
				$('#insertFcModal .startMinute').prop("disabled", false);
				$('#insertFcModal .endDe').prop("disabled", false);
				$('#insertFcModal .endHour').prop("disabled", false);
				$('#insertFcModal .endMinute').prop("disabled", false);
			}
		});
		
	});
	
	<%-- 팔레트 클릭 이벤트 --%>
	$('#insertFcModal .palette').click(function(e){
		var index = $('#insertFcModal .palette').index(this);
		var bgColor = $('#insertFcModal .pickedColor').eq(index).text();
		$('#insertFcModal .pickedColor').addClass("d-none").eq(index).removeClass("d-none");
		if(bgColor == "none"){
			$('#insertFcModal input[name="bgColor"]').val("");
		} else {
			$('#insertFcModal input[name="bgColor"]').val(bgColor);
		}
	});
	
	<%-- 일정추가(검증) --%>
	function valid_addSchedule(){
		if(document.insFrm.title.value == ""){
			alert("일정이름을 입력하세요.");
			document.insFrm.title.focus();
			return false;
		}
		if(document.insFrm.startDe.value == ""){
			alert("시작시간을 입력하세요.");
			document.insFrm.startDe.focus();
			return false;
		}
		
		if($('#insertFcModal .isAllDay').is(":checked")){
			//종일인 경우 검증완료
			$('#insertFcModal .startDate').val(dayjs(document.insFrm.startDe.value).format('YYYY-MM-DD HH:mm'));
			$('#insertFcModal .endDate').val(dayjs(document.insFrm.startDe.value).add(1, 'day').format('YYYY-MM-DD HH:mm'));
			return true;
		}
		
		if(document.insFrm.endDe.value == ""){
			alert("종료시간을 입력하세요.");
			document.insFrm.endDe.focus();
			return false;
		}
		
		var sDate = String(document.insFrm.startDe.value).replaceAll("-","")
					+String(document.insFrm.startHour.value)
					+String(document.insFrm.startMinute.value);
		var eDate = String(document.insFrm.endDe.value).replaceAll("-","")
					+String(document.insFrm.endHour.value)
					+String(document.insFrm.endMinute.value);
		if(eDate < sDate){
			alert("종료시간이 시작시간보다 빠를 수 없습니다.");
			return false;
		}
		
		$('#insertFcModal .startDate').val(String(document.insFrm.startDe.value) + " " + String(document.insFrm.startHour.value) + ":" + String(document.insFrm.startMinute.value));
		$('#insertFcModal .endDate').val(String(document.insFrm.endDe.value) + " " + String(document.insFrm.endHour.value) + ":" + String(document.insFrm.endMinute.value));
		return true;
	}
	
	<%-- 일정추가(수행) --%>
	function fn_addSchedule(){
		if(valid_addSchedule()){
			$.ajax({
				url: "<c:url value='/test001/calendar/selectCalendarSeq.do'/>",
				type: 'post',
				timeout: 60000,
				data: {},
				async: false,
				success: function(res){
					if(res.code == "success"){
						var scheduleParams = {};
						scheduleParams["id"] = res.seqNo;
						scheduleParams["allDay"] = $('#insertFcModal .isAllDay').is(":checked");
						scheduleParams["title"] = document.insFrm.title.value;
						scheduleParams["start"] = document.insFrm.startDate.value;
						scheduleParams["end"] = document.insFrm.endDate.value;
						scheduleParams["backgroundColor"] = document.insFrm.bgColor.value;
						calendar.addEvent(scheduleParams);
					} else {
						alert("시퀀스 조회 실패하였습니다.");
					}
				},
				error: function (request, status, error) {
					alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
				},
				complete : function() {
					//close modal
					$('#insertFcModal').modal("hide");
				}
			});
		}
	};
</script>