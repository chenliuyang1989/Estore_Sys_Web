<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function getWindowSize_$(){
	 var scrW, scrH; 
	  if(window.innerHeight && window.scrollMaxY) {    // Mozilla    
	    scrW = window.innerWidth + window.scrollMaxX;    
	    scrH = window.innerHeight + window.scrollMaxY;  
	  } else if(document.body.scrollHeight > document.body.offsetHeight){    // all but IE Mac    
	     scrW = document.body.scrollWidth;   
	     scrH = document.body.scrollHeight;  
	   } else if(document.body) { // IE Mac    
	   scrW = document.body.offsetWidth;    
	   scrH = document.body.offsetHeight;  
	   }	  
	return {
		Width:scrW,
		Height:scrW
	}
	};
		
	//显示覆盖层
	function overlay(){
		var div=document.getElementById("overlay_incident");
		var subdiv=document.getElementById("sub_overlay_incident");			
		var client=getWindowSize_$();
		document.body.appendChild(div);
		div.style.top=0;
		div.style.left=0;
		div.style.width=client.Width;
		div.style.height=client.Height;
		div.style.backgroundColor='#EDEDED';
		div.style.visibility='visible';
	    div.style.filter="Alpha(Opacity=70)";
		div.style.display='block';
		subdiv.style.paddingTop=document.body.scrollTop+document.body.offsetHeight/3;
		return true;
	};
	
	//改变submit方法，提交前先显示覆盖层
	function overlayBeforeSubmit(){
		var theSubmitForm = document.forms[0];
		if (theSubmitForm != null && theSubmitForm != 'undefined'){
			theSubmitForm.oldSubmit = theSubmitForm.submit;
			theSubmitForm.submit=function(){											 
				theSubmitForm.oldSubmit();	
				overlay();						
			}
		}
	}	
	overlayBeforeSubmit();			
	
</script>
<div align="center" id="overlay_incident"
	style="visibility: hidden; display: none; position: absolute;">
<div id="sub_overlay_incident">Loading...</div>
</div>