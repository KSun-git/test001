<script type="text/javascript">
$(document).ready(function() {
	//$('#collapsePages').addClass("show");
});

function sampleModal(){
	var url = "<c:url value='/test001/sampleModal.do'/>";
	var target = "sample";
	var params = {};
	params["param1"] = 'apple';
	params["param2"] = 'banana';
	modalRoad(target, url, params);
}
</script>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">Blank Page</h1>
<div>sysdate : ${sysdate}</div>
<form name="frm" id="frm" method="post" action="/test001/ttt.do">
</form>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sample" onclick="sampleModal()">Launch modal sample</button>

<c:import url="/test001/layoutModal.do" charEncoding="utf-8">
	<c:param name="targetId" value="sample" />
</c:import>