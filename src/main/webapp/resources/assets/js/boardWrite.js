
$(function(){
        $("#categoryBtn").on("click",function(){
        console.log("category ajax 눌림!");
        cate=["","",""];
        cateDefault(1);
            $.ajax({
                url:"category.do",
                data:{value:"default"},
                type:"post",
                success:function(data){
                	firstcate(data);
                }
            });
        });


 
        $('.mySlides')
        .on("dragover",dragOver)
        .on("dragleave",dragOver)
        .on("drop",uploadFiles);
        document.getElementById('categoryBtn').addEventListener('click', onClick);
        document.querySelector('.modal_close').addEventListener('click', offClick);
        showSlides(slideIndex);
        
      
       
});

//-----------------------카테고리 부분----------------------
function onClick() {
    document.querySelector('.modal_wrap').style.display ='block';
    document.querySelector('.black_bg').style.display ='block';
}   
function offClick() {
    document.querySelector('.modal_wrap').style.display ='none';
    document.querySelector('.black_bg').style.display ='none';
}
function firstcate(e){
	console.log(e);
	var arr = e.result.split(",");
	var result ="" ;
	
	for(var i=0 ;i<arr.length;i++){
		result +='<p onclick="secondcate(this)">';
		result +=arr[i];
		result +='</p>';
	}
	
    $('#firstcate').html(result);
}

function secondcate(e){
	cate[0]=$(e).text();
	cateDefault(1);
	console.log(e.outerText);
	cateChooseColor('firstcate',e);
	$.ajax({
        url:"category.do",
        data:{value:$(e).text()},
        type:"post",
        success:function(data){
        	
        	var arr = data.result.split(",");
        	var result ="" ;
        	for(var i=0 ;i<arr.length;i++){
        		result +='<p onclick="thirdcate(this)">';
        		result +=arr[i];
        		result +='</p>';
        	}
        	
            $('#secondcate').html(result);
        }
    });
}

function thirdcate(e){
	cate[1]=$(e).text();
	
	cateChooseColor('secondcate',e);
	$.ajax({
        url:"category.do",
        data:{value:$(e).text()},
        type:"post",
        success:function(data){
      
        	if(data.result =="thisisLast!"){
        		$('#thirdcate').html('<p class="def">소분류</p>');
        		console.log("thisisLast");
        		lastcate1();
        	}else{
        		cateDefault(2);
        		var arr = data.result.split(",");
            	var result ="";
            	for(var i=0 ;i<arr.length;i++){
            		result +='<p onclick="lastcate(this)">';
            		result +=arr[i];
            		result +='</p>';
            	}
            	
                $('#thirdcate').html(result);
        	}
        	
        }
    });
}
function lastcate1(){
	cate[2]="";
	console.log("lastcate()");
	$('#cateBtn').attr('disabled',false);
	$('#cateBtn').css("opacity","1");
}

function lastcate(e){
	cateChooseColor('thirdcate',e);
	cate[2]=$(e).text();
	$('#cateBtn').attr('disabled',false);
	$('#cateBtn').css("opacity","1");
}
function checkcateBtn(){
	console.log(cate);
	var result =cate[0];
	for(var i =1;i<cate.length;i++){
		if(cate[i] !=""){
			result +=">";
			result +=cate[i];
		}
	}
	$('#cateResult').val(result);
	offClick();
}
function cateDefault(val){
	$('#cateBtn').attr('disabled',true);
	$('#cateBtn').css("opacity","0.3");
	
	if(val == 1){
		$('#secondcate').html('<p class="def">중분류</p>');
		$('#thirdcate').html('<p class="def">소분류</p>');
	}else if(val == 2){
		$('#thirdcate').html('<p class="def">소분류</p>');
	}
	
}

function cateChooseColor(cate,e){
	$('#'+cate).children('p').css({
		"color":"black"
	});
	$('#'+cate).children('p').filter(function(){return $(this).text()===e.outerText;}).css({
		"color":"lawngreen"
	});
}

//-------------------------파일 업로드 부분 -----------------------------
var fileList=new Array();

function insertBoard(){
	var formData = new FormData($('form')[0]);
	for(var i = 0;i<fileList.length;i++){
		console.log(fileList[i]);
		formData.append('file',fileList[i]);
	}
	console.log(formData);
	$.ajax({
		url:"insertBoard.do",
		ansync:false,
		method:'post',
		processData:false,
		contentType:false,
		data:formData
		
		
	});
	
	
}
function dragOver(e){
    e.stopPropagation();
    e.preventDefault();
    if(e.type=="dragover"){
        $(e.target).css({
            "background-color" : "black",
        });
    } else {
        $(e.target).css({
            "background-color" : "white",
            
        });
    }
}

function uploadFiles(e){
    e.files
    uploadFile(e);
}

function uploadFile(e){
    e.stopPropagation();
    e.preventDefault();
    console.log(e);
    dragOver(e);
    console.log("uploadFile");
    e.dataTransfer = e.originalEvent.dataTransfer;
    var files = e.target.files || e.dataTransfer.files;
    
    
    if(files[0].type.match(/image.*/)){
        
        for(i = 0; i < files.length ;i++){
            fileList.push(files[i]);
            console.log(fileList);
            	if(fileList.length == 10){
            		alert('최대 10개까지 가능합니다!');
            		return;
            	}
            
	            if(fileList.length == 1 ){
		            $(e.target).css({
		                "background-image":"url("+window.URL.createObjectURL(files[i])+")",
		                "outline" : "none",
		                "background-size":"100% 100%"
		            });
		            $(e.target).children('.numbertext').text("1");
		            $(e.target).children('div:contains("Caption")').text("Caption one");
		            $('#slideSelector').append('<span class="dot" onclick="currentSlide('+1+')">'+1+'</span>');
	            }else{
	            	console.log("들어왔어 !!");
	            	$('.mySlides:last').after('<div class="mySlides fade" draggable="true" ondragstart="dragStart_(event)" ondrag="drag_(event)" ><div class="numbertext">'+fileList.length+'</div><div class="text">Caption '+NumToSpell(fileList.length)+'</div></div>');
	            	$('.mySlides:last').css({
	            		"background-image":"url("+window.URL.createObjectURL(files[i])+")",
		                "outline" : "none",
		                "background-size":"100% 100%"
	            	}).on("dragover",dragOver)
	                .on("dragleave",dragOver)
	                .on("drop",uploadFiles);
	            	$('#slideSelector').append('<span class="dot" onclick="currentSlide('+fileList.length+')">'+fileList.length+'</span>');
	            	showSlides(slideIndex=fileList.length);
	            }
        }
            
    }else{
        alert('이미지가 아닙니다.');
        return;
    }
  
}

function delFile(num){
	$('.numbertext').filter(function(){return $(this).text()==num;}).closest('.mySlides').remove();
	$('.dot').filter(function(){return $(this).text()==num;}).remove();
	fileList.splice(num-1,1);
	
	for(var i = parseInt(num)+1;i<=fileList.length+1;i++){
		
		$('.numbertext').filter(function(){return $(this).text()==String(i);}).next().text("Caption "+NumToSpell(i-1));
		$('.numbertext').filter(function(){return $(this).text()==String(i);}).text(""+(i-1));
		$('.dot').filter(function(){return $(this).text()==String(i);}).remove();
		$('#slideSelector').append('<span class="dot" onclick="currentSlide('+(i-1)+')">'+(i-1)+'</span>');
	}
	
	if(fileList.length == 0){
		console.log('delFile 0')
		$('#slideContain').prepend('<div class="mySlides fade" draggable="true" ondragstart="dragStart_(event)" ondrag="drag_(event)" ><div class="numbertext">0</div><div class="text">Caption</div></div>')
		.on("dragover",dragOver)
        .on("dragleave",dragOver)
        .on("drop",uploadFiles);
		showSlides(slideIndex=fileList.length);
		return;
	}
	showSlides(slideIndex=num);
	
}

function NumToSpell(num){
	switch(num){
	case 1:
		return 'one';
	case 2:
		return 'two';
	case 3:
		return 'three';
	case 4:
		return 'four';
	case 5:
		return 'five';
	case 6:
		return 'six';
	case 7:
		return 'seven';
	case 8:
		return 'eight';
	case 9:
		return 'nine';
	case 10:
		return 'teen';
	}
}

//---------------------내부 드래그앤 드롭 ----------------

function dragStart_(e){
    var num= $(e.target).children('.numbertext').text();
    console.warn('drag Start');
    e.dataTransfer.setData("num",num);
}
function drag_(e){
}

function dragOver_(e){
	e.preventDefault();
}

function drop_(e){
	var num = e.dataTransfer.getData("num");
	console.log(num);
	delFile(num);
}

//---------------------------------여기부턴 슬라이드 넘긱기 ---------------------
var slideIndex = 1;

showSlides(slideIndex);


function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
