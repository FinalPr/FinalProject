
	  	var count =1;
	  	$(function(){
	  		console.log("boardList.js");
	  		(function($){

	  		    /**
	  		     * Copyright 2012, Digital Fusion
	  		     * Licensed under the MIT license.
	  		     * http://teamdf.com/jquery-plugins/license/
	  		     *
	  		     * @author Sam Sehnert
	  		     * @desc A small plugin that checks whether elements are within
	  		     *       the user visible viewport of a web browser.
	  		     *       can accounts for vertical position, horizontal, or both
	  		     */
	  		    var $w=$(window);
	  		    $.fn.visible = function(partial,hidden,direction,container){

	  		        if (this.length < 1)
	  		            return;
	  			
	  			// Set direction default to 'both'.
	  			direction = direction || 'both';
	  			    
	  		        var $t          = this.length > 1 ? this.eq(0) : this,
	  								isContained = typeof container !== 'undefined' && container !== null,
	  								$c				  = isContained ? $(container) : $w,
	  								wPosition        = isContained ? $c.position() : 0,
	  		            t           = $t.get(0),
	  		            vpWidth     = $c.outerWidth(),
	  		            vpHeight    = $c.outerHeight(),
	  		            clientSize  = hidden === true ? t.offsetWidth * t.offsetHeight : true;

	  		        if (typeof t.getBoundingClientRect === 'function'){

	  		            // Use this native browser method, if available.
	  		            var rec = t.getBoundingClientRect(),
	  		                tViz = isContained ?
	  														rec.top - wPosition.top >= 0 && rec.top < vpHeight + wPosition.top :
	  														rec.top >= 0 && rec.top < vpHeight,
	  		                bViz = isContained ?
	  														rec.bottom - wPosition.top > 0 && rec.bottom <= vpHeight + wPosition.top :
	  														rec.bottom > 0 && rec.bottom <= vpHeight,
	  		                lViz = isContained ?
	  														rec.left - wPosition.left >= 0 && rec.left < vpWidth + wPosition.left :
	  														rec.left >= 0 && rec.left <  vpWidth,
	  		                rViz = isContained ?
	  														rec.right - wPosition.left > 0  && rec.right < vpWidth + wPosition.left  :
	  														rec.right > 0 && rec.right <= vpWidth,
	  		                vVisible   = partial ? tViz || bViz : tViz && bViz,
	  		                hVisible   = partial ? lViz || rViz : lViz && rViz,
	  				vVisible = (rec.top < 0 && rec.bottom > vpHeight) ? true : vVisible,
	  		                hVisible = (rec.left < 0 && rec.right > vpWidth) ? true : hVisible;

	  		            if(direction === 'both')
	  		                return clientSize && vVisible && hVisible;
	  		            else if(direction === 'vertical')
	  		                return clientSize && vVisible;
	  		            else if(direction === 'horizontal')
	  		                return clientSize && hVisible;
	  		        } else {

	  		            var viewTop 				= isContained ? 0 : wPosition,
	  		                viewBottom      = viewTop + vpHeight,
	  		                viewLeft        = $c.scrollLeft(),
	  		                viewRight       = viewLeft + vpWidth,
	  		                position          = $t.position(),
	  		                _top            = position.top,
	  		                _bottom         = _top + $t.height(),
	  		                _left           = position.left,
	  		                _right          = _left + $t.width(),
	  		                compareTop      = partial === true ? _bottom : _top,
	  		                compareBottom   = partial === true ? _top : _bottom,
	  		                compareLeft     = partial === true ? _right : _left,
	  		                compareRight    = partial === true ? _left : _right;

	  		            if(direction === 'both')
	  		                return !!clientSize && ((compareBottom <= viewBottom) && (compareTop >= viewTop)) && ((compareRight <= viewRight) && (compareLeft >= viewLeft));
	  		            else if(direction === 'vertical')
	  		                return !!clientSize && ((compareBottom <= viewBottom) && (compareTop >= viewTop));
	  		            else if(direction === 'horizontal')
	  		                return !!clientSize && ((compareRight <= viewRight) && (compareLeft >= viewLeft));
	  		        }
	  		    };

	  		})(jQuery);
	  		more();
	  		//console.log("실행");
	  	/* 	window.onbeforeunload = function () {
	  		  window.scrollTo(0, 0);
	  		} */
		  	$(window).on('scroll',function(){
		  		if($("#moreBtn").visible()){
		  			console.log($('html, body').offset().top + $('html, body').height()/(2*(count)));
		  			console.log($('html, body').height()/(2*(count)));
		  		 $('html, body').animate({scrollTop: $('html, body').offset().top + $('html, body').height()/(2*(count))}, 200);
		  			//$('html, body').animate({scrollTop: 0}, 200);
		  			more(count++);
		  		}
		  	});
		 
	  	});
	  	
	  	
	  	
	  	function boardWrite(){
	  		location.href="boardWrite.do";
	  	}
	  	
	  	 var search =0;
	  	function more(check){
	  		
	  		var searchTitleinList="";
	  		var searchPrice1="";
	  		var searchPrice2="";
	  		var searchCount="";
	  		var searchSort="";
	  		
	  		
	  		if(check || search == 1){
	  			console.log("check");
	  			searchTitleinList=$('#searchTitleinList').val();
	  			searchPrice1=$('#searchPrice1').val();
	  			searchPrice2=$('#searchPrice2').val();
	  			searchCount=$('#searchCount').val();
	  			searchSort=$('#searchSort').val();
	  			search =1;
	  		}
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
	  		$.ajax({
	  			url:"getBoardList.do",
	  			dataType:"json",
	  			type:"post",
	  			data:{"curpage": count,"category":boardListCategory,"searchTitleinList":searchTitleinList,"searchPrice1":searchPrice1,"searchPrice2":searchPrice2,"searchCount":searchCount,"searchSort":searchSort},
	  			success:function(boardList){
	  				console.log(boardList);
	  				
	  				if(boardList.length ==0){
						$('#moreBtn').remove();
						search = 0;
					}
	  				
	  				var image;
	  				if(check && search ==1){
	  					 $('#nav-home').children('.row').remove();
	  					$('#nav-home').append('<div class="row"></div>');
	  				}
	  				if(boardList.length < 18){
						$('#moreBtn').remove();
						search = 0;
					}
	  				
	  					//$('#nav-tabContent').append('<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"><div class="row"></div></div>');
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
	  						$div4.append(' <i class="far fa-star"></i>');
	  						$div4.append(' <i class="far fa-star"></i>');
	  						$div4.append(' <i class="far fa-star"></i>');
	  						$div4.append(' <i class="far fa-star"></i>');
	  						$div4.append(' <i class="far fa-star low-star"></i>');
	  						$div3.append($div4);
	  						$div3.append('<h2 ><a  href=\"getBoardDetail.do?no='+boardList[j].no+'&category='+boardList[j].category+'\">'+boardList[j].title+'</a></h2>');
	  						$div4 = $('  <div class="price">');
	  						$div4.append('<ul><li>가격 : '+boardList[j].price+'</li></ul>');
                            $div3.append($div4);
                            $div2.append($div3);
                            $div1.append($div2);
                            $('#nav-home').children('.row').append($div1);
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
	  	
	  