var $= jQuery.noConflict();

/* 팝업호출함수 */
var popup = function() {
	var href = '';
	var type = '';
	var width = '';
	var height = '';
	var callback = '';
	var formId = '';
	var title = '';
	var obj = [];
	var closedFunction;
	
	for (i = 0; i < arguments.length; i++) {
		switch (i) {
			case 0:
				href = arguments[i];
				break;
			case 1:
				type = arguments[i];
				break;
			case 2:
				width = arguments[i];
				break;
			case 3:
				height = arguments[i];
				break;
			case 4:
				title = arguments[i];
				break;
			case 5:
				callback = arguments[i];
				obj.push('callback=' + callback);
				break;
			case 6:
				if (arguments[i] != '') {
					formId = $('#' + arguments[i]).serialize();
					obj.push(formId);
				}
				break;
			default:
				if (arguments[i] != '') {
					(typeof(arguments[i]) == 'function') ? closedFunction = arguments[i] : obj.push(arguments[i]) ;
				}
				break;
		}
	}
	
	if(type == 'iframe-noneClose') {
		if(width == '' && height == '') {
			$.fancybox({
				fitToView 	: true,
				autoSize 	: true,
				autoDimensions : true,
				autoScale 	: true,
				closeBtn 	: false,
				closeClick 	: false,
				href 			: href + '?' + obj.join("&"),
				type 			: 'iframe',
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		} else {
			$.fancybox({
				fitToView 	: false,
				autoSize 	: false,
				autoDimensions : false,
				width 		: width,
				height 		: height,
				closeBtn 	: false,
				closeClick 	: false,
				href 			: href + '?' + obj.join("&"),
				type 			: 'iframe',
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		}
	} else if (type == 'iframe') {
		if(width == '' && height == '') {
			$.fancybox({
				fitToView 	: true,
				autoSize 	: true,
				autoDimensions : true,
				autoScale 	: true,
				href 			: href + '?' + obj.join("&"),
				type 			: type,
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		} else {
			$.fancybox({
				fitToView 	: false,
				autoSize 	: false,
				autoDimensions : false,
				width 		: width,
				height 		: height,
				href 			: href + '?' + obj.join("&"),
				type 			: type,
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		}
	} else if (type == "image") {
		if(width == '' && height == '') {
			$.fancybox({
				fitToView 	: true,
				autoSize 	: true,
				autoDimensions : true,
				autoScale 	: true,
				href 			: href + '?' + obj.join("&"),
				type 			: type,
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		} else {
			$.fancybox({
				fitToView 	: false,
				autoSize 	: false,
				autoDimensions : false,
				width 		: width,
				height 		: height,
				href 			: href + '?' + obj.join("&"),
				type 			: type,
				padding 		: [0, 0, 0, 0],
				helpers 		: {overlay : { closeClick : false }},
				beforeClose	: function(){if(typeof(closedFunction) != "undefined"){ closedFunction(); }},
				title 			: (title == "") ? "TEST001" : title
			});
		}
	}
}
var popupClose = function() {
	$.fancybox.close(false);
}


/* datepicker */
$(function() {
    $( "[id^='datepicker']" ).datepicker({
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
		, todayHighlight  : true //오늘날짜하이라이트
		, todayBtn : true //오늘날짜버튼
    });
	
	$( "[id^='inline-datepicker']" ).datepicker({
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
		if($(this).next("input[id^='picked']").length == 1){
			$(this).next("input[id^='picked']").val(toStringByFormatting(e.date));
		}
	});
	
});

/* javascript Date format */
function leftPad(value) {
	let result = "";
	(value >= 10) ? result = value : result =  "0" + value;
    return result;
}
function toStringByFormatting(source, delimiter = '-') {
    const year = source.getFullYear();
    const month = leftPad(source.getMonth() + 1);
    const day = leftPad(source.getDate());
    return [year, month, day].join(delimiter);
}

function addThousandSeparatorCommas(num) {
	switch(typeof(num)){
		case "object" : 
			return num.value = $.number(num.value);
		case "number" :
			return $.number(num);
		case "string" :
			return $.number(Number(num));
		default:
			return num;
	}
}