function validateStrongPassword(pwdObj,length ){
	  var msg="";
	  var value= pwdObj.val();
	  var ret=true;
	  var upp_regex=/.*?[A-Z]+.*/;
	  var low_regex=/.*?[a-z]+.*/;
	  var num_regex=/.*?[0-9]+.*/;
	  var spe_regex=/.*?[\W]+.*/;
	  
	  if(value.length < length){
	  		msg+='密码至少为八位'+'\n';
	    ret=false;
	  }
	  if(!upp_regex.exec(value)){
	    msg+='密码必须包含大写字母'+'\n';
	    ret=false;
	  }
	  if(!low_regex.exec(value)){
	   msg+='密码必须包含小写字母'+'\n';
	    ret=false;
	  }
	  if(!num_regex.exec(value)){
	    msg+='密码必须包含数字'+'\n';
	    ret=false;
	  }
	  if(!spe_regex.exec(value)){
	    msg+='密码必须包含特殊字符（如~!@#$%^等）'+'\n';
	    ret=false;
	  }
	  if(ret==false){
	  	 alert(msg);
	  	pwdObj[0].focus();
	   }
	  return ret;   
}  