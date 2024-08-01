<script type="text/javascript">
$(document).ready(function() {
	var today = new Date();
	var todayVw = toStringByFormatting(today);
	$('#inline-datepicker').datepicker('update', todayVw);
	$('#picked-date').val(todayVw);
});

function fn_closePopup(){
	parent.popupClose();
}

function fn_registrPopup(){
	
}
</script>
<div style="height:100vh;background: #f2f6fc;">
    <div class="bg-dark">
    	<div class="px-4">
    		<div class="row align-items-center justify-content-between pt-3">
    			<div class="col-auto mb-3">
    				<h4 class="popup-header-title text-light">Registration Deduction</h4>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="border-top container-fluid pt-3">
        <form id="popFrm" name="popFrm" method="post">
        	<div class="row">
        		<div class="col py-2">
        			<div id="inline-datepicker" class="d-inline-block pl-4 bg-white border"></div>
        			<input type="hidden" id="picked-date" name="deductionDate" value="" />
        		</div>
        		<div class="col py-3">
        			<input type="hidden" name="gbn" value="300000" />
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">Category</span>
        				</div>
        				<input type="text" class="form-control" id="cate" name="cate" list="cateList" />
        				<datalist id="cateList">
        					<option value="점심식사" />
        					<option value="마트" />
        					<option value="스터디카페" />
        				</datalist>
        			</div>
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">Amount</span>
        				</div>
        				<input type="text" class="form-control text-right" id="amount" name="amount" onkeyup="this.value=this.value.replace(/[^0-9]/g,''); addThousandSeparatorCommas(this);" maxlength="12" />
        				<div class="input-group-append">
        					<span class="input-group-text">&#8361;</span>
        				</div>
        			</div>
        			
        			<div class="input-group input-group-sm mb-3">
        				<div class="input-group-prepend">
        					<span class="input-group-text font-weight-bold">bigo</span>
        				</div>
        				<textarea class="form-control" name="bigo" rows="5"></textarea>
        			</div>
        		</div>
        	</div>
        	<div class="text-center">
        		<button class="btn btn-primary" type="button" onclick="fn_registrPopup()" >Register</button>
				<button class="btn btn-secondary" type="button" onclick="fn_closePopup()">Cancel</button>
        	</div>
        </form>
    </div>
</div>