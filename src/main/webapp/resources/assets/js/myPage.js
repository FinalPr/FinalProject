
	  	$(function(){
	  		console.log("myPage.js!");
	  		getLookList();
	  		getZzimList();
	  	});
	  	
	  	
	  	
	  	function boardWrite(){
	  		location.href="boardWrite.do";
	  	}
	  	
	  	 var search =0;
	  	function getZzimList(){
	  		
	  		var $div1;
	  		var $div2;
	  		var $div3;
	  		var $div4;
	  		var today = new Date();
	  		
	  		let year = today.getFullYear();
	  		let month = today.getMonth()+1;
	  		let date = today.getDate();
	  		let day = today.getDay();
	  		let compare = month+"월 "+date+", "+year
	  		let curpage = 1;
	  		let count = 6;
	  		
	  		$.ajax({
	  			url:"getZzimList.do",
	  			dataType:"json",
	  			type:"post",
	  			data:{"count": count,"curpage":curpage},
	  			success:function(boardList){
	  				console.log(boardList);
	  				
	  					for(var j=0;j<boardList.length;j++){
	  						image =boardList[j].renameFileName.split(",");
	  						console.log(boardList[j].insert_date);
	  						$div1 = $('<div class="col-xl-4 col-lg-4 col-md-6">');
	  						$div2 = $('<div class="single-product mb-60">');
	  						$div3 = $(' <div class="product-img">');
	  						$div3.append('<img src=\"/spring/resources/'+boardList[j].category+"/"+boardList[j].no+"/"+image[0]+'\" width="300" height="300" alt="">');
	  						$div4 = $('<div class="new-product">');
	  						if(compare == boardList[j].insert_date ){
	  						$div4.append('<span>New</span>');
	  						}
	  						if(login !=""){
	  							$div4.append(' <span class="heart" onclick="insertZzim(this)"><input type="hidden" value = \"'+boardList[j].no+','+boardList[j].category+'\">♥</span>');
	  							if(boardList[j].checkZzim==1){
	  							$div4.children('.heart').css("color","red");
	  							}
	  						}
	  						$div3.append($div4);
	  						$div2.append($div3);
	  						$div3 = $(' <div class="product-caption">');
	  						$div4 = $('<div class="product-ratting">');
	  						$div3.append('<h2 ><a style="color:black;" href=\"getBoardDetail.do?no='+boardList[j].no+'&category='+boardList[j].category+'\">'+boardList[j].title+'</a></h2>');
	  						$div4 = $('  <div class="price">');
	  						$div4.append('<ul><li>가격 : '+boardList[j].price+'</li></ul>');
                            $div3.append($div4);
                            $div2.append($div3);
                            $div1.append($div2);
                            $('#zzim').children('.row').append($div1);
	  					}
	  					
	  				
	  			},
	  			error:function(data){
	  				console.log("에러!");
	  			}
	  		});
	  		
	  	}
	  	
	  	function insertZzim(e){
	  		console.log($(e).children('input').val());
	  		var arr = $(e).children('input').val().split(',');
	  		var no= arr[0];
	  		var category= arr[1];
	  		$.ajax({
	  			
	  			url:"zzim.do",
	  			type:"post",
	  			data:{"no":no,"category":category},
	  			success:function(result){
	  				console.log("결과!!");
	  				if(result=="insert"){
	  					$(e).css({
	  						color : "red"
	  					});
	  				}else if(result=="delete"){
	  					$(e).css({
	  						color : "white"
	  					});
	  				}else{
	  					alert("찜 실패 !");
	  				}
	  				
	  			}
	  			
	  		});
	  	}
	  	
	  	function getBuyList(check){
	  		
	  		var $tr;
	  		var $td;
	  		
	  		let count = 8;
	  		$.ajax({
	  			url:"getBuyList.do",
	  			type:"post",
	  			data:{"count":count},
	  			success:function(boardList){
	  				for(var i=0 ; i<boardList.length;i++ ){
	  					boardList[i]
	  					$tr=$('<tr>');
	  					$td=$('<td>');
	  					$td.text(boardList[i].title);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].writer);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].price);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text("거래완료");
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].trade_date);
	  					$tr.append($td);
	  					$('#buyListArea').append($tr);
	  				}
	  			}
	  			
	  		});
	  	}
	  	
	  	function getSellList(check){
	  		
	  		var $tr;
	  		var $td;
	  		
	  		let count = 8;
	  		$.ajax({
	  			url:"getSellList.do",
	  			type:"post",
	  			data:{"count":count},
	  			success:function(boardList){
	  				for(var i=0 ; i<boardList.length;i++ ){
	  					boardList[i]
	  					$tr=$('<tr>');
	  					$td=$('<td>');
	  					$td.text(boardList[i].title);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].trade_id);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].price);
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text("거래완료");
	  					$tr.append($td);
	  					$td=$('<td>');
	  					$td.text(boardList[i].trade_date);
	  					$tr.append($td);
	  					$('#buyListArea').append($tr);
	  				}
	  			}
	  			
	  		});
	  	}
	  	
	  	
	  	function getLookList(){
	  		
	  		var $div1;
	  		var $div2;
	  		var $div3;
	  		var $div4;
	  		var today = new Date();
	  		
	  		let year = today.getFullYear();
	  		let month = today.getMonth()+1;
	  		let date = today.getDate();
	  		let day = today.getDay();
	  		let compare = month+"월 "+date+", "+year
	  		let curpage = 1;
	  		let count = 6;
	  		
	  		$.ajax({
	  			url:"getLookList.do",
	  			dataType:"json",
	  			type:"post",
	  			data:{"count": count,"curpage":curpage},
	  			success:function(boardList){
	  				console.log(boardList);
	  				
	  					for(var j=0;j<boardList.length;j++){
	  						image =boardList[j].renameFileName.split(",");
	  						console.log(boardList[j].insert_date);
	  						$div1 = $('<div class="col-xl-4 col-lg-4 col-md-6">');
	  						$div2 = $('<div class="single-product mb-60">');
	  						$div3 = $(' <div class="product-img">');
	  						$div3.append('<img src=\"/spring/resources/'+boardList[j].category+"/"+boardList[j].no+"/"+image[0]+'\" width="300" height="300" alt="">');
	  						$div4 = $('<div class="new-product">');
	  						if(compare == boardList[j].insert_date ){
	  						$div4.append('<span>New</span>');
	  						}
	  						if(login !=""){
	  							$div4.append(' <span class="heart" onclick="insertZzim(this)"><input type="hidden" value = \"'+boardList[j].no+','+boardList[j].category+'\">♥</span>');
	  							if(boardList[j].checkZzim==1){
	  							$div4.children('.heart').css("color","red");
	  							}
	  						}
	  						$div3.append($div4);
	  						$div2.append($div3);
	  						$div3 = $(' <div class="product-caption">');
	  						$div4 = $('<div class="product-ratting">');
	  						$div3.append('<h2 ><a style="color:black;" href=\"getBoardDetail.do?no='+boardList[j].no+'&category='+boardList[j].category+'\">'+boardList[j].title+'</a></h2>');
	  						$div4 = $('  <div class="price">');
	  						$div4.append('<ul><li>가격 : '+boardList[j].price+'</li></ul>');
                            $div3.append($div4);
                            $div2.append($div3);
                            $div1.append($div2);
                            $('#look').children('.row').append($div1);
	  					}
	  					
	  				
	  			},
	  			error:function(data){
	  				console.log("에러!");
	  			}
	  		});
	  		
	  	}
	  	
	  	function insertZzim(e){
	  		console.log($(e).children('input').val());
	  		var arr = $(e).children('input').val().split(',');
	  		var no= arr[0];
	  		var category= arr[1];
	  		$.ajax({
	  			
	  			url:"zzim.do",
	  			type:"post",
	  			data:{"no":no,"category":category},
	  			success:function(result){
	  				console.log("결과!!");
	  				if(result=="insert"){
	  					$(e).css({
	  						color : "red"
	  					});
	  				}else if(result=="delete"){
	  					$(e).css({
	  						color : "white"
	  					});
	  				}else{
	  					alert("찜 실패 !");
	  				}
	  				
	  			}
	  			
	  		});
	  	}
	  