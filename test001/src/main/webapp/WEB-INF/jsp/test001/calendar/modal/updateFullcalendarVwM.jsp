<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="updateFcModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h5 class="modal-title">일정변경</h5>
    			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    		</div>
    		<div class="modal-body" style="color:#333;">
    			<form name="updFrm" id="updFrm" method="post" action="">
    				<input type="hidden" class="seqNo" name="seqNo" />
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
    			<button type="button" class="btn btn-danger" onclick="fn_removeSchedule()">삭제</button>
    			<button type="button" class="btn btn-info" onclick="fn_changeSchedule()">수정</button>
    			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
    		</div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		<%-- 모달닫기 이벤트 --%>
		$('#updateFcModal').on('hidden.bs.modal', function (event) {
			$('#updateFcModal .isAllDay').prop("checked", false);
			$('#updateFcModal .title').val("");
			$('#updateFcModal .startDate').val("");
			$('#updateFcModal .startDe').val("");
			$('#updateFcModal .startHour').prop("disabled", false);
			$('#updateFcModal .startMinute').prop("disabled", false);
			$('#updateFcModal .startDate').val("");
			$('#updateFcModal .endDe').val("");
			$('#updateFcModal .endDe').prop("disabled", false);
			$('#updateFcModal .endHour').prop("disabled", false);
			$('#updateFcModal .endMinute').prop("disabled", false);
			$('#updateFcModal .bgColor').val("");
			$('#updateFcModal .pickedColor').addClass("d-none");
			$('#updateFcModal .selWhite').removeClass("d-none");
		});
		
		<%-- 종일 클릭 이벤트 --%>
		$('#updateFcModal .isAllDay').on('click', function (event) {
			if($(this).is(":checked")){
				$('#updateFcModal .startHour').prop("disabled", true);
				$('#updateFcModal .startMinute').prop("disabled", true);
				$('#updateFcModal .endDe').prop("disabled", true);
				$('#updateFcModal .endHour').prop("disabled", true);
				$('#updateFcModal .endMinute').prop("disabled", true);
			} else {
				$('#updateFcModal .startHour').prop("disabled", false);
				$('#updateFcModal .startMinute').prop("disabled", false);
				$('#updateFcModal .endDe').prop("disabled", false);
				$('#updateFcModal .endHour').prop("disabled", false);
				$('#updateFcModal .endMinute').prop("disabled", false);
			}
		});
		
	});
	
	<%-- 팔레트 클릭 이벤트 --%>
	$('#updateFcModal .palette').click(function(e){
		var index = $('#updateFcModal .palette').index(this);
		var bgColor = $('#updateFcModal .pickedColor').eq(index).text();
		$('#updateFcModal .pickedColor').addClass("d-none").eq(index).removeClass("d-none");
		if(bgColor == "none"){
			$('#updateFcModal input[name="bgColor"]').val("");
		} else {
			$('#updateFcModal input[name="bgColor"]').val(bgColor);
		}
	});
	
	<%-- 일정수정(검증) --%>
	function valid_changeSchedule(){
		if(document.updFrm.title.value == ""){
			alert("일정이름을 입력하세요.");
			document.updFrm.title.focus();
			return false;
		}
		if(document.updFrm.startDe.value == ""){
			alert("시작시간을 입력하세요.");
			document.updFrm.startDe.focus();
			return false;
		}
		
		if($('#updateFcModal .isAllDay').is(":checked")){
			//종일인 경우 검증완료
			$('#updateFcModal .startDate').val(dayjs(document.updFrm.startDe.value).format('YYYY-MM-DD HH:mm'));
			$('#updateFcModal .endDate').val(dayjs(document.updFrm.startDe.value).add(1, 'day').format('YYYY-MM-DD HH:mm'));
			return true;
		}
		
		if(document.updFrm.endDe.value == ""){
			alert("종료시간을 입력하세요.");
			document.updFrm.endDe.focus();
			return false;
		}
		
		var sDate = String(document.updFrm.startDe.value).replaceAll("-","")
					+String(document.updFrm.startHour.value)
					+String(document.updFrm.startMinute.value);
		var eDate = String(document.updFrm.endDe.value).replaceAll("-","")
					+String(document.updFrm.endHour.value)
					+String(document.updFrm.endMinute.value);
		if(eDate < sDate){
			alert("종료시간이 시작시간보다 빠를 수 없습니다.");
			return false;
		}
		
		$('#updateFcModal .startDate').val(String(document.updFrm.startDe.value) + " " + String(document.updFrm.startHour.value) + ":" + String(document.updFrm.startMinute.value));
		$('#updateFcModal .endDate').val(String(document.updFrm.endDe.value) + " " + String(document.updFrm.endHour.value) + ":" + String(document.updFrm.endMinute.value));
		return true;
	}
	
	<%-- 일정수정(수행) --%>
	function fn_changeSchedule(){
		if(valid_changeSchedule()){
			const id = document.updFrm.seqNo.value;
			if(calendar.getEventById(id)==null){
				alert("대상 일정을 찾을 수 없습니다.");
				$('#updateFcModal').modal("hide");
				return false;
			}
			
			var params = {};
			params["fcSeq"] = id;
			params["fcTitle"] = document.updFrm.title.value;
			params["fcAllday"] = ($('#updateFcModal .isAllDay').is(":checked")) ? "Y" : "N";
			params["fcStartDate"] = dayjs(document.updFrm.startDate.value, "YYYY-MM-DD HH:mm").format("YYYYMMDDHHmmss");
			params["fcEndDate"] = dayjs(document.updFrm.endDate.value, "YYYY-MM-DD HH:mm").format("YYYYMMDDHHmmss");
			params["fcBgColor"] = document.updFrm.bgColor.value;
			
			$.ajax({
				url: "<c:url value='/test001/calendar/updateCalendarEvent.do'/>",
				type: 'post',
				timeout: 60000,
				data: params,
				async: false,
				success: function(res){
					if(res.code == "success"){
						console.log("수정완료")
					} else {
						alert("수정 실패하였습니다.");
					}
				},
				error: function (request, status, error) {
					alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
				},
				complete : function() {
					//close modal
					$('#updateFcModal').modal("hide");
					//reload fullcalendar
					iniView = calendar.view.type;
					fn_renderCalendar();
				}
			});
		}
	}
	
	<%-- 일정삭제(수행) --%>
	function fn_removeSchedule(){
		const id = document.updFrm.seqNo.value;
		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		if(calendar.getEventById(id)==null){
			alert("대상 일정을 찾을 수 없습니다.");
			$('#updateFcModal').modal("hide");
			return false;
		}
		
		calendar.getEventById(id).remove();
		$('#updateFcModal').modal("hide");
	}
	
</script>