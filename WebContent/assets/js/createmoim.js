$(document).ready(function(){SelectPN();});
function SelectPN(){
	let placenum = document.getElementById("placenum");
	let xhr = new XMLHttpRequest();
	xhr.open("GET",cp+"/moim/SelectPlaceNum.mo",true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				//문자열.trim() : 문자열의 양쪽에 있는 공백 제거
				txt = txt.trim();
				placenum.setAttribute('value', txt);
			}		
		}
	}
}


function sendmoim(){
	let moimform = document.moimform;
	let moimname = moimform.moimname;
	let moimbudget = moimform.moimbudget;
	let moimstartdate = moimform.moimstartdate;
	let moimenddate = moimform.moimenddate;
	
	// 오늘 날짜
	let today = new Date();   
	let year = today.getFullYear(); 	// 년도
	let month = today.getMonth() + 1;  	// 월
	let date = today.getDate();  		// 날짜
	
	let startYear = moimstartdate.value.substr(0, 4); // 시작날짜 연도
	let startMonth = moimstartdate.value.substr(5, 2); // 시작날짜 월
	let startDay = moimstartdate.value.substr(8, 2); // 시작날짜 일

	let endYear = moimenddate.value.substr(0, 4); // 끝날짜 연도
	let endMonth = moimenddate.value.substr(5, 2); // 끝날짜 월
	let endDay = moimenddate.value.substr(8, 2); // 끝날짜 일
	
	let todate = new Date(year, month, date);
	let startdate = new Date(startYear, startMonth, startDay);
	let enddate = new Date(endYear, endMonth, endDay);
	
	if(moimname.value == ""){
		alert("모임 이름을 입력해주세요.");
		moimname.focus();
		return false;
	}
	if(moimbudget.value == ""){
		alert("모임 예산을 입력해주세요.");
		moimbudget.focus();
		return false;
	}
	if(moimbudget.value > 999999999){
		alert("예산은 10,000,000,000원을 초과할 수 없습니다.");
		moimbudget.focus();
		return false;
	}
	if(moimstartdate.value == ""){
		alert("모임이 시작하는 날짜를 설정해주세요.");
		return false;
	}
	if(moimenddate.value == ""){
		alert("모임이 끝나는 날짜를 설정해주세요.");
		return false;
	}
	if(todate > startdate){
		alert("모임이 시작하는 날짜를 다시 확인해주세요.");
		return false;
	}
	if(todate > enddate){
		alert("모임이 끝나는 날짜를 다시 확인해주세요.");
		return false;
	}
	if(startdate > enddate){
		alert("모임 시작날짜와 모임이 끝나는 날짜를 다시 확인해주세요.");
		return false;
	}
	return true;
}