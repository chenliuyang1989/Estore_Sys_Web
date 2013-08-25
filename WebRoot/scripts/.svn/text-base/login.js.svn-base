  
    function saveUsername(theForm) {
        var expires = new Date();
        expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
        setCookie("username",theForm.j_username.value,expires,"<c:url value="/"/>");
    }
    
    function validateForm(form) {                                                               
        return validateRequired(form); 
    } 
    function validateRequired(form) {                                    
        var bValid = true;
        var focusField = null;
        var i = 0;                                                                                          
        var fields = new Array();                                                                           
        oRequired = new required();                                                                         
                                                                                                            
        for (x in oRequired) {   
            if ((form[oRequired[x][0]].type == 'text' || form[oRequired[x][0]].type == 'textarea' || form[oRequired[x][0]].type == 'select-one' || form[oRequired[x][0]].type == 'radio' || form[oRequired[x][0]].type == 'password') && form[oRequired[x][0]].value == '') {
               if (i == 0)
                  focusField = form[oRequired[x][0]]; 
               fields[i++] = document.getElementById(form[oRequired[x][0]].id.replace("j_","li_")).innerText.replace("*"," ")+oRequired[x][1];
                //  fields[i++] = document.getElementById(form[oRequired[x][0]].id.replace("j_","li_")).innerText.replace("*"," ")+"";
              // fields[i++] = oRequired[x][1];
               bValid = false;                                                                             
            }                                                                                               
        }                                                                                                   
                                                                                                           
        if (fields.length > 0) {
           focusField.focus();
           alert(fields.join('\n'));                                                                      
        }                                                                                                   
                                                                                                           
        return bValid;                                                                                      
    }
    function passwordHint() {
        if ($("j_username").value.length == 0) {
          //  alert("<fmt:message key='errors.required'><fmt:param><fmt:message key='label.username'/></fmt:param></fmt:message>");
        	alert("用户:为必填项");
            $("j_username").focus();
        } else {
            location.href="<c:url value='/passwordHint.do'/>?username=" + $("j_username").value;     
        }
    }
    
    function required () { 
        //this.aa = new Array("j_username", "<fmt:message key='errors.required'><fmt:param><fmt:message key='label.username'/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
        //this.ab = new Array("j_password", "<fmt:message key='errors.required'><fmt:param><fmt:message key='label.password'/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
        
        this.aa = new Array("j_username", "为必填项", new Function ("varName", " return this[varName];"));
        this.ab = new Array("j_password", "为必填项", new Function ("varName", " return this[varName];"));
    } 
    function checkPassword(obj){
    	if(validateForm(obj)){
    		var ret=validateStrongPassword(document.getElementById("j_password").value,8);
	    	if(!ret){
	    		alert("您的密码太简单,请及时修改密码！\n密码规则: 至少为八位，且必须包含大小写字母，数字，特殊符号(如~!@#$%^等)");
	    	}
    	}else{
    		return false;
    	}
    }
    function validateStrongPassword(value,length ){
  	  var ret=true;
  	  var upp_regex=/.*?[A-Z]+.*/;
  	  var low_regex=/.*?[a-z]+.*/;
  	  var num_regex=/.*?[0-9]+.*/;
  	  var spe_regex=/.*?[\W]+.*/;
  	  
  	  if(value.length < length){
  	    ret=false;
  	  }
  	  if(!upp_regex.exec(value)){
  	    ret=false;
  	  }
  	  if(!low_regex.exec(value)){
  	    ret=false;
  	  }
  	  if(!num_regex.exec(value)){
  	    ret=false;
  	  }
  	  if(!spe_regex.exec(value)){
  	    ret=false;
  	  }
  	  return ret;   
  }  
