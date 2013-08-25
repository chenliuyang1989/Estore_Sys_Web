$(function(){    
	
	$(".tabs-panels").live("mousedown",function(event){
 		document.oncontextmenu = function() {return true;} 
	});
	 var tab_center=document.getElementById("tab_center");	
	 $(tab_center).tabs({
		// tools: [{
		//	    iconCls:'icon-no',
		//	    handler:function(){
		//	    	$('.tabs-inner span').each(function(i,n){
		//	    	     var t = $(n).text();
		//	    	     $(tab_center).tabs('close',t);
		//	    	 });    
		//	    }

		//	  }]
	 });
	 var currTabTile="";
	 var currTab="";
	 $(".tabs li").live("mousedown",function(event){
	 	currTabTile=$(this).text();
	 	currTab=$(this);
		if(event.button==2){
			document.oncontextmenu = function() {return false;} 
			$('#mm').menu('show',{
				left:event.pageX,
				top:event.pageY
			});
		}
	});
	
	
	//关闭当前
	 $('#mm-tabclose').click(function(){
		// var currtab_title =currTabTile;
		// alert("currtab_title:"+currtab_title);
		 $(tab_center).tabs('close',currTabTile);
	 });
	/*双击关闭TAB选项卡*/
	// $(".tabs-inner").dblclick(function(){
	//	 alert(11);
	//	 var subtitle = $(this).children("span").text();
	//	 $(tab_center).tabs('close',subtitle);
	// });

	 $(".tabs-inner").bind('contextmenu',function(e){
		 $('#mm').menu('show', {
			 left: e.pageX,
			 top: e.pageY
		 });

		var subtitle =$(this).children("span").text();
		$('#mm').data("currtab",subtitle);

		return false;
	 });
 
	 //全部关闭
	 $('#mm-tabcloseall').click(function(){
		 $('.tabs-inner span').each(function(i,n){
			 var t = $(n).text();
			 $(tab_center).tabs('close',t);
		 });    
	 });
	 //关闭除当前之外的TAB
	 $('#mm-tabcloseother').click(function(){
		//var currtab_title = currTabTile;
		 $('.tabs-inner span').each(function(i,n){
			 var t = $(n).text();
			 if(t!=currTabTile)
				 $(tab_center).tabs('close',t);
		 });    
	 });
	 //关闭当前右侧的TAB
	 $('#mm-tabcloseright').click(function(){
		 var nextall = currTab.nextAll();
		 if(nextall.length==0){
			 return false;
		 }
		 nextall.each(function(i,n){
			 var t=$('a:eq(0) span',$(n)).text();
			 $(tab_center).tabs('close',t);
		 });
		 return false;
	 });
	 //关闭当前左侧的TAB
	 $('#mm-tabcloseleft').click(function(){
		 var prevall = currTab.prevAll();
			 if(prevall.length==0){
				 return false;
			 }
			 prevall.each(function(i,n){
				 var t=$('a:eq(0) span',$(n)).text();
				 $(tab_center).tabs('close',t);
			 });
			return false;
		 });
	 });


//west关闭
function iframeWidthResize(){
	var northWid=document.getElementById("north_tab").style.width;
	var westWid=document.getElementById("tab_west").style.width;
	westWid=westWid.substring(0,westWid.length-2);
	northWid=northWid.substring(0,northWid.length-2);
	northWid=parseInt(northWid)-28;
	northWid=northWid+"px";
	document.getElementById("tab_center").style.width=northWid;
	$("#tab_center").children("div.tabs-header")[0].style.width=northWid;
	$("#tab_center").children("div.tabs-panels")[0].style.width=northWid;;
	var fram=$("#tab_center").children("div.tabs-panels").find("[name=frameId]");
	if(fram!=null && fram.length>0){
		for(var i=0;i<fram.length;i++){
			$("#tab_center").find(".panel-body")[i].style.width=northWid;
			fram[i].width=northWid;
		}
	}
}
//west打开
function iframeWidthResizeClose(){
	var northWidClose=document.getElementById("north_tab").style.width;
	var westWid=document.getElementById("tab_west").style.width;
	northWidClose=northWidClose.substring(0,northWidClose.length-2);
	westWid=westWid.substring(0,westWid.length-2);
	northWidClose=parseInt(northWidClose)-parseInt(westWid)-3;
	northWidClose=northWidClose+"px";
	document.getElementById("tab_center").style.width=northWidClose;
	$("#tab_center").children("div.tabs-header")[0].style.width=northWidClose;
	$("#tab_center").children("div.tabs-panels")[0].style.width=northWidClose;
	var fram=$("#tab_center").children("div.tabs-panels").find("[name=frameId]");
	if(fram!=null && fram.length>0){
		for(var i=0;i<fram.length;i++){
			$("#tab_center").find(".panel-body")[i].style.width=northWidClose;
			fram[i].width=northWidClose;
		}
	}
}
function selectOverTab(obj,url,title){
	$(obj).tabs("select",title);  
	$(obj).tabs("close",title);  

}
function addNewTabPri(obj,url,title){
	$(obj).tabs('add',{
		id:1,
		title:title ,
		closable:true,
		selected:true,
		content:'<iframe frameborder="0" name="frameId" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="yes" src ="'+url+'" ></iframe>'
		
	});
}
function newTab(url,title,over){
	var tab_center=document.getElementById("tab_center");	
	var tabCount = $(tab_center).tabs('tabs').length;
	var defalutUser=document.getElementById("defalutUser").value;
	if(url.indexOf("?")!=-1){
		url=url+"&defalutUser="+defalutUser;
	}else{
		url=url+"?defalutUser="+defalutUser;
	}
	if(over=="true"){
		if($(tab_center).tabs("exists",title)){
			selectOverTab(tab_center,url,title);
			addNewTabPri(tab_center,url,title);
		} else if(tabCount<10){
			addNewTabPri(tab_center,url,title);
		}else if(tabCount>=10){
			alert("最多只能有10个窗口");
		}
	}else{
		if(tabCount<10){
			addNewTabPri(tab_center,url,title);
		}else if(tabCount>=10){
			alert("最多只能有10个窗口");
		}
	}
	return false;
}
function addTab(url,title,over){//over-是否覆盖已打开的窗口
	url=$.trim(url);
	if(url.indexOf("pageSize=")==-1){
		if(url.indexOf("?")!=-1){
			url=url+"&pageSize=10";
		}else{
			url=url+"?pageSize=10";
		}
	}
	newTab(url,title,over);
}
function addNewTab(url,paramId,paramValueObj,title,over){
	url=$.trim(url);
	if(url.indexOf("?")!=-1){
		url=url+"&pageSize=10";
	}else{
		url=url+"?pageSize=10";
	}
	var paramValue=$(paramValueObj).parent().find("[name="+paramId+"]").eq(0).val();
	//paramValue=paramValue.replace(".","_");
	url=url+"&"+paramId+"="+paramValue;
	if(over=="false")title=title+paramValue;
	newTab(url,title,over);
}
function addNewTabArr(url,paramIds,paramValues,title,titleValue,over){
	url=$.trim(url);
	if(url.indexOf("?")!=-1){
		url=url+"&pageSize=10";
	}else{
		url=url+"?pageSize=10";
	}
	if(paramIds!=null && paramIds!=""){
		for(var i=0;i<paramIds.length;i++){
			url=url+"&"+paramIds[i]+"="+paramValues[i];
		}
	}
	if(over=="false")title=title+titleValue;
	newTab(url,title,over);
}
function addNewTabForA(url,title,over){
	url=$.trim(url);
	if(url.indexOf("?")!=-1){
		url=url+"&pageSize=10";
	}else{
		url=url+"?pageSize=10";
	}
	if(over=="false")title=title+titleValue;
	newTab(url,title,over);
}
function changeMenu(url){
	url=$.trim(url);
	var tab_center=document.getElementById("westf");	
	tab_center.src=url;
	return true;
}