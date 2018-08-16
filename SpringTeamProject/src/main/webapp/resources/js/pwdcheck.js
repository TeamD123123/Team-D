$(document).ready(() => {
	var pwd = $('#pwd');
	var repwd = $('#repwd');
	
	var result = $('#check-result');
	
	var submitBtn = $('.signUp-button').children('input');
	
	repwd.on('keyup', () => {
		var pwd1 = pwd.val();
		var pwd2 = repwd.val();
		
		if(pwd1==pwd2){
			result.html('비밀번호가 같습니다.');
			submitBtn.removeAttr('disabled');
		}else{
			result.html('비밀번호가 다릅니다.');
			submitBtn.attr('disabled', 'disabled');
		}
	})
});