/*根据url中的参数获得参数值*/
	function getParam(paramName)
	{
	        paramValue ="";
	        isFound =false;
	        if (this.location.search.indexOf("?") ==0&&this.location.search.indexOf("=")>1)
	        {
	            arrSource = unescape(this.location.search).substring(1,this.location.search.length).split("&");
	            i =0;
	            while (i < arrSource.length &&!isFound)
	            {
	                if (arrSource[i].indexOf("=") >0)
	                {
	                     if (arrSource[i].split("=")[0].toLowerCase()==paramName.toLowerCase())
	                     {
	                        paramValue = arrSource[i].split("=")[1];
	                        isFound =true;
	                     }
	                }
	                i++;
	            }  
	        }
	   return paramValue;
}
	
/**
 * 给微信广告加上行为记录
 * @param memberId
 * @param code
 */
function addLog(memberId,code){
	var url = window.location.href;
	$.ajax({
        url:mobilePath+'/addLog.htm',
        type:"POST",
        data:{"url":url,"code":code,"memberId":memberId,"type":"1"},
        dataType:"text"
    }); 
}