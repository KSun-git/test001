<%-- FullCalendar --%>
<script src="/plugin/fullcalendar-6.1.15/dist/index.global.min.js"></script>
<script src="/plugin/fullcalendar-6.1.15/packages/google-calendar/index.global.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/fullcalendar-custom.css" />

<script type="text/javascript">
$(document).ready(function() {
	iniDate = '${fn:substring(sysdate,0,10)}';
	iniView = "dayGridMonth";
	fn_renderCalendar();
});

var calendar = null;
var iniDate = null;
var iniView = null;

<%-- 캘린더 로드 --%>
function fn_renderCalendar(){
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		initialDate: iniDate, //기준일자
		locale: 'ko',
		height: '850px',
		expandRows: true,	//화면에맞게 높이 재설정
		slotMinTime: '08:00', //시작시간
		slotMaxTime: '20:00', //종료시간
		/*일정시간표기설정*/
		eventTimeFormat: {
			hour: 'numeric',
			minute: '2-digit',
			meridiem: false
	  	},
	  	/*버튼텍스트변경*/
	  	buttonText: {
			dayGridMonth: '월',
			timeGridWeek: '주',
			timeGridDay: '일',
			listWeek: '목록'
		},
		/*커스텀버튼구성*/
		customButtons: {
			myCustomButton:{
				text:'추가',
				click: function(){$('#insertFcModal').modal("show");}
			},
			mySaveButton:{
				text:'전체저장',
				click: function(){fn_saveCalendarAll(calendar.getEvents());}
			},
			myTodayButton:{
				text:'오늘',
				click: function(){fn_moveCalendar('today');}
			},
			myPrevButton:{
				icon: 'chevron-left',
				click: function(){fn_moveCalendar('prev');}
			},
			myNextButton:{
				icon: 'chevron-right',
				click: function(){fn_moveCalendar('next');}
			},
		},
		/*헤더툴바구성*/
		headerToolbar: {
			start: 'myPrevButton,myTodayButton,myNextButton myCustomButton',
			center: 'title',
			end: 'dayGridMonth,timeGridWeek,listWeek'
		},
		initialView: iniView,	//기본설정(달)
		navLinks: true,	//날짜선택가능
		navLinkDayClick: "timeGridWeek", //날짜선택시띄울것
		editable: false,	//일정드래그,리사이즈여부
		selectable: true,	//날짜영역선택가능여부
		nowIndicator: true,	//현재시간마크
		dayMaxEvents: true,	//높이에맞춰 이벤트수 제한
		/*구글캘린더로 공휴일설정*/
		googleCalendarApiKey: '<spring:message code="Globals.googleCalendar.apiKey"/>',
		eventSources:[
			{
				googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
				className: 'ko-holiday',
				startEditable: false,
				durationEditable: false,
				resourceEditable: false,
				display: 'background'
			}
		],
		events: function(info, successCallback, failureCallback){
			$.ajax({
				url: "<c:url value='/test001/calendar/selectCalendarEventAll.do'/>",
				type: 'post',
				timeout: 60000,
				data: {
					start: dayjs(info.start).format('YYYYMMDDHHmmss'),
					end: dayjs(info.end).format('YYYYMMDDHHmmss')
				},
				async: false,
				success: function(res){
					if(res.code == "success"){
						var eventArray = [];
						var data = res.data;
						for(var i=0; i<data.length; i++){
							eventArray.push({
								id: data[i].FC_SEQ,
								title: data[i].FC_TITLE,
								start: data[i].FC_START_DATE_VW,
								end: data[i].FC_END_DATE_VW,
								backgroundColor: data[i].FC_BG_COLOR,
								allDay: (data[i].FC_ALLDAY == "Y") ? true : false,
								className: 'my-schedule',
							});
						}
						successCallback(eventArray);
					} else{
						alert("이벤트리스트 조회 실패하였습니다.");
					}
				},error: function (request, status, error) {
					alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
				}
			});
		},
		/*캘린더 날짜영역 선택 이벤트*/
		select: function(obj) {
			fn_selectDateCalendar(obj);
		},
		/*캘린더 일정 클릭시 이벤트*/
		eventClick: function(obj){
			fn_updateCalendarEventVwM(obj.event);
		},
		/*캘린더 일정추가 이벤트 callBack*/
		eventAdd: function(obj) {
			fn_insertCalendarEvent(obj.event);
		},
		/*캘린더 일정삭제 이벤트 callBack*/
		eventRemove: function(obj){
			fn_deleteCalendarEvent(obj.event);
		},
		/*캘린더 일정변경 이벤트 callBack*/
		eventChange: function(obj) {
			//일정드래그,리사이즈여부 false
		},
	});
    calendar.render();
}

<%-- 캘린더 이동 --%>
function fn_moveCalendar(gbn){
	switch(gbn){
		case "today":
			if(dayjs(iniDate, 'YYYY-MM-DD').isValid()){
				iniDate = dayjs().format('YYYY-MM-DD');
				iniView = calendar.view.type;
				fn_renderCalendar();
			} else { alert("incorrect iniDate"); }
			break;
		case "prev":
			if(dayjs(iniDate, 'YYYY-MM-DD').isValid()){
				const nowView = calendar.view.type;
				if(nowView == "dayGridMonth"){iniDate = dayjs(iniDate, 'YYYY-MM-DD').subtract(1, 'month').date(1).format('YYYY-MM-DD');}
				else{iniDate = dayjs(iniDate, 'YYYY-MM-DD').subtract(1, 'week').format('YYYY-MM-DD');}
				iniView = nowView;
				fn_renderCalendar();
			} else { alert("incorrect iniDate"); }
			break;
		case "next":
			if(dayjs(iniDate, 'YYYY-MM-DD').isValid()){
				const nowView = calendar.view.type;
				if(nowView == "dayGridMonth"){iniDate = dayjs(iniDate, 'YYYY-MM-DD').add(1, 'month').date(1).format('YYYY-MM-DD');}
				else{iniDate = dayjs(iniDate, 'YYYY-MM-DD').add(1, 'week').format('YYYY-MM-DD');}
				iniView = nowView;
				fn_renderCalendar();
			} else { alert("incorrect iniDate"); }
			break;
		default:
			alert("incorrect move gbn");
			break;
	}
}

<%-- 캘린더 날짜영역 클릭시 일정추가모달 연계 --%>
function fn_selectDateCalendar(obj){
	const startDe = dayjs(obj.start).format('YYYY-MM-DD');
	const startHour = dayjs(obj.start).format('HH');
	const startMinute = dayjs(obj.start).format('mm');
	const endDe = dayjs(obj.end).format('YYYY-MM-DD');
	const endHour = dayjs(obj.end).format('HH');
	const endMinute = dayjs(obj.end).format('mm');
	
	if(obj.allDay){
		$('#insertFcModal .isAllDay').click();
	} else {
		$('#insertFcModal .endDe').val(endDe);
		$('#insertFcModal .startHour').val(startHour).prop('selected',true);
		$('#insertFcModal .startMinute').val(startMinute).prop('selected',true);
		$('#insertFcModal .endHour').val(endHour).prop('selected',true);
		$('#insertFcModal .endMinute').val(endMinute).prop('selected',true);
	}
	
	$('#insertFcModal .startDe').val(startDe);
	$('#insertFcModal').modal("show");
}

<%-- 캘린더 일정클릭시 일정수정모달 연계 --%>
function fn_updateCalendarEventVwM(event){
	var params = {};
	params["seqNo"] = event.id;
	
	$.ajax({
		url: "<c:url value='/test001/calendar/selectCalendarEvent.do'/>",
		type: 'post',
		timeout: 60000,
		data: params,
		async: false,
		success: function(res){
			if(res.code == "success"){
				var data = res.data;
				
				if(data.FC_ALLDAY == "Y"){
					$('#updateFcModal .isAllDay').click();
				} else {
					$('#updateFcModal .startHour').val(data.FC_START_HOUR_VW).prop('selected',true);
					$('#updateFcModal .startMinute').val(data.FC_START_MINUTE_VW).prop('selected',true);
					$('#updateFcModal .endDe').val(data.FC_END_DE_VW);
					$('#updateFcModal .endHour').val(data.FC_END_HOUR_VW).prop('selected',true);
					$('#updateFcModal .endMinute').val(data.FC_END_MINUTE_VW).prop('selected',true);
				}
				
				$('#updateFcModal .seqNo').val(data.FC_SEQ);
				$('#updateFcModal .title').val(data.FC_TITLE);
				$('#updateFcModal .startDe').val(data.FC_START_DE_VW);
				if(data.FC_BG_COLOR != ""){
					$('#updateFcModal .bgColor').val(data.FC_BG_COLOR);
					$('#updateFcModal .pickedColor').each(function(){ ($(this).text() == data.FC_BG_COLOR) ? $(this).removeClass("d-none") : $(this).addClass("d-none"); });
				}
				
				$('#updateFcModal').modal("show");
			} else {
				alert("일정조회 실패하였습니다.");
			}
		},
		error: function (request, status, error) {
			alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
		}
	});
}

<%-- 캘린더에 추가된 일정 저장 --%>
function fn_insertCalendarEvent(event){
	var params = {};
	params["fcSeq"] = event.id;
	params["fcTitle"] = event.title;
	params["fcAllday"] = (event.allDay == true) ? "Y" : "N";
	params["fcStartDate"] = dayjs(event.start).format('YYYYMMDDHHmmss');
	params["fcEndDate"] = dayjs(event.end).format('YYYYMMDDHHmmss');
	params["fcBgColor"] = event.backgroundColor;
	
	$.ajax({
		url: "<c:url value='/test001/calendar/insertCalendarEvent.do'/>",
		type: 'post',
		timeout: 60000,
		data: params,
		async: false,
		success: function(res){
			(res.code == "success") ? console.log("추가완료") : alert("추가 실패하였습니다.");
		},
		error: function (request, status, error) {
			alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
		},
		complete : function() {
			iniView = calendar.view.type;
			fn_renderCalendar();
		}
	});
}

<%-- 캘린더에 표기된 일정 전체저장 --%>
function fn_saveCalendarAll(events){
	if(!comfirm("전체저장 하시겠습니까?")){
		return false;
	}
	
	var params = {};
	var eventCnt = 0;
	$.each(events, function(index, item){
		if(item.url==undefined || item.url==""){
			//일정리스트
			params["claendarVoList["+eventCnt+"].fcSeq"] = item.id;
			params["claendarVoList["+eventCnt+"].fcTitle"] = item.title;
			params["claendarVoList["+eventCnt+"].fcAllday"] = (item.allDay == true) ? "Y" : "N";
			params["claendarVoList["+eventCnt+"].fcStartDate"] = dayjs(item.start).format('YYYYMMDDHHmmss');
			params["claendarVoList["+eventCnt+"].fcEndDate"] = dayjs(item.end).format('YYYYMMDDHHmmss');
			params["claendarVoList["+eventCnt+"].fcBgColor"] = item.backgroundColor;
			eventCnt++;
		} else {
			//공휴일리스트
		}
	});
	
	if(eventCnt == 0){
		alert("저장할 일정이 없습니다.");
		return false;
	}
	
	$.ajax({
		url: "<c:url value='/test001/calendar/insertCalendarEventAll.do'/>",
		type: 'post',
		timeout: 60000,
		data: params,
		async: false,
		success: function(res){
			(res.code == "success") ? console.log("저장완료") : alert("저장 실패하였습니다.");
		},
		error: function (request, status, error) {
			alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
		},
		complete : function() {
			iniView = calendar.view.type;
			fn_renderCalendar();
		}
	});
}

<%-- 캘린더에 삭제된 일정 갱신 --%>
function fn_deleteCalendarEvent(event){
	var params = {};
	params["fcSeq"] = event.id;
	
	$.ajax({
		url: "<c:url value='/test001/calendar/deleteCalendarEvent.do'/>",
		type: 'post',
		timeout: 60000,
		data: params,
		async: false,
		success: function(res){
			(res.code == "success") ? console.log("삭제완료") : alert("삭제 실패하였습니다.");
		},
		error: function (request, status, error) {
			alert("에러가 발생하였습니다.\n" + request.status + "(" + error + ")");
		},
		complete : function() {
			iniView = calendar.view.type;
			fn_renderCalendar();
		}
	});
}
</script>
<!-- Page Heading -->
<form name="frm" id="frm" method="post" action="">
	<div id='calendar'></div>
</form>

<%@ include file="/WEB-INF/jsp/test001/calendar/modal/insertFullcalendarVwM.jsp" %>
<%@ include file="/WEB-INF/jsp/test001/calendar/modal/updateFullcalendarVwM.jsp" %>