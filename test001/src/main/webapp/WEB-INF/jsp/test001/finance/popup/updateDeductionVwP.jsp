<script type="text/javascript">
$(document).ready(function() {
	$('#inline-datepicker').datepicker('update', document.popFrm.deductionDe.value);
});

function fn_closePopup(){
	parent.popupClose();
}

function fn_editPopup(){
	if(confirm("edit deduction?")){
		var params = $("#popFrm").serialize();
		$.ajax({
			url: '/test001/finance/popup/updateDeduction.do',
			type: 'post',
			timeout: 10000,
			//dataType: 'json' ,
			data: params,
			async: false,
			success: function(data){
				if(data.result=="success"){
					alert("complete edit");
					parent.location.reload(true);
				} else{
					alert("fail edit");
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
<div style="height:100vh;background: #f2f6fc;">
    <div class="bg-dark">
    	<div class="px-4">
    		<div class="row align-items-center justify-content-between pt-3">
    			<div class="col-auto mb-3">
    				<h4 class="popup-header-title text-light">Edit Deduction</h4>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="border-top container-fluid pt-3">
        <form id="popFrm" name="popFrm" method="post" autocomplete="off">
        	<div class="row">
        		<div class="col py-2">
        			<div id="inline-datepicker" class="d-inline-block pl-4 bg-white border"></div>
        			<input type="hidden" id="picked-date" name="deductionDe" value="${deductionMap.DEDUCTION_DE_VW}" />
        		</div>
        		<div class="col py-3">
        			<input type="hidden" name="gbn" value="${deductionMap.GBN}" />
        			<input type="hidden" name="no" value="${deductionMap.NO}" />
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">Category</span>
        				</div>
        				<input type="text" class="form-control" id="cate" name="cate" list="cateList" value="${deductionMap.CATE}" />
        				<datalist id="cateList">
        					<c:forEach items="${cateGroupList}" var="list" varStatus="status">
        						<option value="${list.CATE}" />
        					</c:forEach>
        				</datalist>
        			</div>
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">Amount</span>
        				</div>
        				<input type="text" class="form-control text-right" id="amount" name="amount" onkeyup="this.value=this.value.replace(/[^0-9]/g,''); addThousandSeparatorCommas(this);" maxlength="12" value="${deductionMap.AMOUNT_VW}" />
        				<div class="input-group-append">
        					<span class="input-group-text">&#8361;</span>
        				</div>
        			</div>
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">bigo</span>
        				</div>
        				<textarea class="form-control" name="bigo" rows="5">${deductionMap.BIGO}</textarea>
        			</div>
        		</div>
        	</div>
        	<div class="text-center">
        		<button class="btn btn-primary" type="button" onclick="fn_editPopup()" >Edit</button>
				<button class="btn btn-secondary" type="button" onclick="fn_closePopup()">Cancel</button>
        	</div>
        </form>
    </div>
</div>