setTimeout(SelectMN, 100);
function SelectMN(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET",cp+"/moim/SelectMoimNum.mo",true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				txt = txt.trim();
				moimnum = txt;
			}		
		}
	}
}

setTimeout(InsertMember, 300);
function InsertMember(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET",cp+"/moim/InsertMember.mo?userid="+login_id+"&&moimnum="+moimnum,true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
			}		
		}
	}
}

var cnt = 31;

function countDown() {
	if (cnt != 0) {
		cntspan.innerHTML = cnt-1;
		cnt--;
	}
	else {
		location.replace(cp+"/index.jsp")
		clearInterval(repeat);
	}
}

cntspan.innerHTML = cnt-1;
var repeat = setInterval(countDown, 1000);


function noEvent() { // 새로 고침 방지
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;


function animateCSS(element, animationName, callback) {
    const node = document.querySelector(element)
    node.classList.add('animated', animationName)

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName)
        node.removeEventListener('animationend', handleAnimationEnd)

        if (typeof callback === 'function') callback()
    }

    node.addEventListener('animationend', handleAnimationEnd)
}
animateCSS(".animate__heartBeat", 'bounce')