var cate = new Array(3);


$(function(){
	console.log("여긴 헤더 !");
	start();
	submenuScroll();
	console.log("두번째!");
	$("#Search").on('keypress',function(event){
		console.log("실행되나요 ?!!");
		if(event.keyCode == 13){
			
			search1();
		}
	});
	
});

function search1(){
	console.log($('#Search').val());
	category="검색>"+$('#Search').val();
	var $form = $('<form id="cateForm" action="openBoardList.do" type="post">');
	$form.append('<input  type="hidden" name="category" value=\"'+category+'\">');
	console.log($form);
	$('body').append($form);
	$('#cateForm').submit();
}

function submenuScroll(event){
	$('.submenu').on('scroll touchmove mousewheel', function(event) {
		  event.preventDefault();
		  event.stopPropagation();
		  return false;
		});
	
}

function start(){
    $.ajax({
        url:"category.do",
        data:{value:"default"},
        type:"post",
        success:function(data){
        	category = data.result.split(",");
        	headFirstcate(category);
        	
        }
    });
}

function headFirstcate(arr){
	
	var ffirst =0;
	var flast =6;
	var $li;
	var $a ;
	$('#navigation').html("");
	for(var i=0 ;i<6;i++){
		$li = $('<li>');
		$a = $('<a>');
		$a.text(arr[i]);
		$a.on('mouseover',function(){headSecondcate(this)});
		$li.append($a);
		$li.append('<ul class="submenu"></ul>');
		$('#navigation').append($li);
	}
   
	 $('#navigation').off();
    $('#navigation').on('scroll touchmove mousewheel', function(event) {
		  event.preventDefault();
		  event.stopPropagation();
  		if (event.originalEvent.wheelDelta >= 0) {
//      	        console.log('Scroll up');
  			if(ffirst >0){
  				ffirst--;
  				 $('#navigation').children('li:last').remove();
  				$li = $('<li>');
  				$a = $('<a>');
  				$a.text(arr[ffirst]);
  				$a.on('mouseover',function(){headSecondcate(this)});
  				$li.append($a);
  				$li.append('<ul class="submenu"></ul>');
  				$('#navigation').prepend($li);
	      	       flast--;
	      	       
  			}
  	     
  	    }else{
//      	        console.log('Scroll down');
  	    	if(flast <arr.length){
  	    		$('#navigation').children('li:first').remove();
  	    		$li = $('<li>');
	  	  		$a = $('<a>');
	  	  		$a.text(arr[flast]);
	  	  		$a.on('mouseover',function(){headSecondcate(this)});
	  	  		$li.append($a);
	  	  		$li.append('<ul class="submenu"></ul>');
	  	  		$('#navigation').append($li);
	       	       flast++;
	       	       ffirst++;
  	    	}
  	    }
		  return false;
		});
}

function headSecondcate(e){
	cate[0] = $(e).text();
	$.ajax({
        url:"category.do",
        data:{value:$(e).text()},
        type:"post",
        success:function(data){
        	var sfirst =0;
        	var slast =10;
        	var count ;
        	var $li;
        	var $a ;
        	var arr = data.result.split(",");
        	var result="";
        	if(arr.length >= 10){
        		count = 10;
        		
        	}else{
        		count = arr.length;
        	}
        	$(e).closest('li').children('ul').html("");
        	for(var i=0 ;i<count;i++){
        		$li = $('<li>');
        		$a = $('<a onclick="sendCate(this)">');
        		$a.text(arr[i]);
        		$a.on('mouseover',function(){headThirdcate(this)});
        		$li.append($a);
        		$li.append('<ul class="submenu" style="margin-left:150px;top:0%" ></ul>');
        		$(e).closest('li').children('ul').append($li);
        	}
        	$(e).closest('li').children('ul').off();
        	$(e).closest('li').children('ul').on('scroll touchmove mousewheel', function(event) {
      		  event.preventDefault();
      		  event.stopPropagation();
	      		if (event.originalEvent.wheelDelta >= 0) {
	//      	        console.log('Scroll up');
	      			if(sfirst >0){
	      				 slast--;
	      				 $(e).closest('li').children('ul').children('li:last').remove();
	      				$li = $('<li>');
	            		$a = $('<a onclick="sendCate(this)">');
	            		$a.text(arr[sfirst]);
	            		$a.on('mouseover',function(){headThirdcate(this)});
	            		$li.append($a);
	            		$li.append('<ul class="submenu" style="margin-left:150px;top:0%" ></ul>');
	            		$(e).closest('li').children('ul').prepend($li);
		  	      	       sfirst--;
	      			}
	      	     
	      	    }else{
	//      	        console.log('Scroll down');
	      	    	if(slast <arr.length){
	      	    		$(e).closest('li').children('ul').children('li:first').remove();
	      	    		$li = $('<li>');
	            		$a = $('<a onclick="sendCate(this)">');
	            		$a.text(arr[slast]);
	            		$a.on('mouseover',function(){headThirdcate(this)});
	            		$li.append($a);
	            		$li.append('<ul class="submenu" style="margin-left:150px;top:0%" ></ul>');
	            		$(e).closest('li').children('ul').append($li);
	 	       	    	slast++;
		 	       	    sfirst++;
	      	    	}
	      	    	
	      	    	
	      	    }
	      		event.cancelBubble = true;
      		  return false;
      		});
        }
    });
}

function headThirdcate(e){
	cate[1]=$(e).text()
	$.ajax({
        url:"category.do",
        data:{value:$(e).text()},
        type:"post",
        success:function(data){
        	var tfirst =0;
        	var tlast =5;
        	var arr = data.result.split(",");
        	if(arr[0] =="thisisLast!" ){
        		cate[2] = "thisisLast!";
        	}
        	var $li;
        	var $a;
        	var count=0;
        	if(arr.length >= 5){
        		count = 5;
        	}else{
        		count = arr.length;
        	}
        	 $(e).closest('li').children('ul').html("");
        	for(var i=0 ;i<count;i++){
        		$li = $('<li>');
        		$a = $('<a onclick="sendCate(this)">');
        		$a.text(arr[i]);
        		$li.append($a);
        		$(e).closest('li').children('ul').append($li);
        	}
        	
        	
        	$(e).closest('li').children('ul').off();
        	$(e).closest('li').children('ul').on('scroll touchmove mousewheel', function(event) {
        		  event.preventDefault();
        		  event.stopPropagation();
  	      		if (event.originalEvent.wheelDelta >= 0) {
  	//      	        console.log('Scroll up');
  	      			if(tfirst >0){
  	      			 tfirst--;
  	      				 $(e).closest('li').children('ul').children('li:last').remove();
  	  	      	       $(e).closest('li').children('ul')
  	  	      	       .prepend('<li><a onclick="sendCate(this)">'+arr[tfirst]+'</a></li>');
  	  	      	       tlast--;
  	  	      	      
  	      			}
  	      	     
  	      	    }else{
  	//      	        console.log('Scroll down');
  	      	    	if(tlast <arr.length){
  	      	    		$(e).closest('li').children('ul').children('li:first').remove();
  	      	    		$(e).closest('li').children('ul')
  	 	       	       .append('<li><a onclick="sendCate(this)">'+arr[tlast]+'</a></li>');
  	 	       	       tlast++;
  	 	       	       tfirst++;
  	      	    	}
  	      	    }
        		  return false;
        		});
        }
    });
}

function sendCate(e){
	if(!cate[2] && cate[1] == $(e).text() ){
		return;
	}
	var category="";
	if(cate[2] =="thisisLast!"){
		category=cate[0]+">"+cate[1];
	}else{
		category=cate[0]+">"+cate[1]+">"+$(e).text();
	}
	
	var $form = $('<form id="cateForm" action="openBoardList.do" type="post">');
	$form.append('<input  type="hidden" name="category" value=\"'+category+'\">');
	console.log($form);
	$('body').append($form);
	$('#cateForm').submit();
}







