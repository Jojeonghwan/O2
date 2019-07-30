/**
 * 
 */
function qnaInsertCheckform(){
	if($("#q_select option:selected").val() == 0){
		alert("주제를 선택해주세요");
		return false;
	}
}