function allCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	let confirm = document.getElementById('confirm');
	let userName = document.getElementById('userName');
	let postcode = document.getElementById('postcode');
	let detailAddress = document.getElementById('detailAddress');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(pw.value != confirm.value){
		alert("비밀번호가 일치하지 않습니다.")
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else if(postcode.value == ""){
		alert('주소는 필수 항목입니다.');
	}else if(detailAddress.value == ""){
		alert('주소는 필수 항목입니다.');
	}else{
      let xhr = new XMLHttpRequest();
       xhr.open("GET", "/checkDuplicate?id=" + id.value, true);
       xhr.onreadystatechange = function () {
           if (xhr.readyState == 4 && xhr.status == 200) {
               let response = xhr.responseText;
               if (response === "duplicate") {
                   alert('이미 사용중인 아이디 입니다.');
               } else {
                   var f = document.getElementById('f');
                   f.submit();
                   alert('회원가입이 완료되었습니다. 다시 로그인해주세요.');
               }
           }
       };
       xhr.send();
   }
}

function pwCheck(){
	let pw = document.getElementById('pw');
	let confirm = document.getElementById('confirm');
	let label = document.getElementById('label');
	 if(pw.value == confirm.value){
		 label.innerHTML = '일치'
	 }else{
		 label.innerHTML = '불일치'
	 }
	// window.alert('pwCheck 호출')
}

function loginCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function updateCheck(){
	
	let pw = document.getElementById('pw');
	let confirm = document.getElementById('confirm');
	let userName = document.getElementById('userName');
	
	if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.')
	}else if(pw.value != confirm.value){
		alert("비밀번호가 일치하지 않습니다.")
	}else{
		var f = document.getElementById('f');
		f.submit();	
		alert('회원수정이 완료되었습니다. 다시 로그인해주세요.');
	}
}

function deleteCheck(){
	
	let pw = document.getElementById('pw');
	let confirm = document.getElementById('confirm');
	
    if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(pw.value != confirm.value){
		alert("비밀번호가 일치하지 않습니다.");
	}else {
		var f = document.getElementById('f');
		f.submit();	
		//alert('회원탈퇴가 완료되었습니다.');
	}

}

