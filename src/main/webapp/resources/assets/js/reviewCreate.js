/**
 * 상세페이지 내 댓글 쓰기
 */

const detail = document.querySelector("#review-detail");
const rootDiv = document.querySelector("#reviews");
const btn = document.querySelector("#submit");
const mainCommentCount = document.querySelector('#count');

function showComment(comment){
	
	const userName = document.createElement('div');
	const inputValue = document.createElement('span');
	const countSpan = document.createElement('span');
	const commentList = document.createElement('div');
	
	commentList.appendChild(userName);
	commentList.appendChild(inputValue);
	rootDiv.prepend(commentList);
	
	console.dir(rootDiv);
	
}

function pressBtn(){
	const curentVal = inputBar.value;
	
	if(!currentVal.length){
		alert("댓글을 입력하시오")
	}else{
		showComment(currentVal);
		mainCommentCount.innerHTML ++;
		inputBar.value = '';
	}
	
}

btn.onclick = pressBtn;