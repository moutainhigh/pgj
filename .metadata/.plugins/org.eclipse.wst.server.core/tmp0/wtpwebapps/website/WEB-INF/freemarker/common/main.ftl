[#include "/common/setting.ftl"]
<!-- 这是公共html标准内容 -->
[#macro body title='票管家官方网站' head=seoMap.homepage]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh">
	<head lang="en">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
	    <meta charset="UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <title>${head.title!title}</title>
		<meta name="keywords" content="${head.keywords!' '}">
	    <meta name="description" content="${head.description!' '}">
	    <link rel="shortcut icon" href="${image_url}/common/icon/32.png"/>
	    <link rel="icon" href="${image_url}/common/icon/32.png" sizes="32x32"/>
	    <link rel="icon" href="${image_url}/common/icon/192.png" sizes="192x192"/>
	    <link rel="apple-touch-icon-precomposed" href="${image_url}/common/icon/180.png"/>
	    <meta name="msapplication-TileImage" content="${image_url}/common/icon/270.png"/>
	    
	    <link rel="stylesheet" type="text/css" href="${pluPath}/ajaxPager/page.css"/>
	    
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/homepage.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/common/webBase.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/common/webUI.css"/>
   	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/common/flex.css">
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/left.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/tool.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/header.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/foot.css"/>
	    <link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/right.css"/>
	    
	   	<link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/newIndex.css" />
    	<link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/global.css" />
    	<link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/redPackets.css" />
	    
	    <script type="text/javascript" src="${comPath}/jquery-1.8.3.min.js"></script>
	    <script type="text/javascript" src="${jsPath}/index.js"></script>
	    <script type="text/javascript" src="${jsPath}/tab.js"></script>
		<script type="text/javascript" src="${comPath}/jquery.cookie.js"></script>
		<script type="text/javascript" src="${comPath}/jquery.uploadify.js"></script>
		<script type="text/javascript" src="${comPath}/md5.js"></script>

		<script type="text/javascript" src="${jsPath}/enum.js"></script>
		<script type="text/javascript" src="${jsPath}/visitLog.js"></script>
		<script type="text/javascript" src="${jsPath}/config.js"></script>
		<script type="text/javascript" src="${jsPath}/map.js"></script>
		
		
		<script type="text/javascript" src="${pluPath}/validation-engine/js/languages/jquery.validationEngine-zh_CN.js"></script>
		<script type="text/javascript" src="${pluPath}/validation-engine/js/jquery.validationEngine.js"></script>
	    
	    <script type="text/javascript" src="${jsPath}/left.js"></script>
	    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
	    
	    <link rel="stylesheet" href="${pluPath}/validation-engine/css/validationEngine.jquery.css" type="text/css"/>
		<link rel="stylesheet" href="${pluPath}/validation-engine/css/template.css" type="text/css"/>
	    <script type="text/javascript">
	    $(document).ready(function(){
	    	enableBootAuth();
	    });
	    
	    /** 
		 * 开启请求BOOT登录验证
		 */
		function enableBootAuth(){
			if('${member.mobile}'=='')return;
			
			var _USERNAME = '${member.mobile}';
			var _PASSWORD = hex_md5('${member.mobile}SIGN:@UTIEXIAN@50965066${member.id}');
			$(document).ajaxSend(function(e, xhr, options) {
				var _add = "_USERNAME=" + _USERNAME + "&source=PC&_PASSWORD=" + _PASSWORD;
				var _old = options.data;
				if($.trim(_old)==""){
					options.data = _add;
				}else{
					options.data += "&" + _add;
				}
			});
			$("form").append('<input type="hidden" name="_USERNAME" value="'+ _USERNAME +'" data-desc="登录校验"/>');
			$("form").append('<input type="hidden" name="_PASSWORD" value="'+ _PASSWORD +'" data-desc="登录校验"/>');
			$("form").append('<input type="hidden" name="source" value="PC" data-desc="标识来源"/>');
		}
	    
		/**
	     * boot 项目的提交
	     */
	    function bootPost(url,params){
	    	var res;
	    	$.ajax({
	    		url:url,
	    		type:"POST",
	    		data:params,
	    		dataType:"json",
	    		async: false,
	    		success:function(data){
	    			res = data;
	    		},error:function(json){
	    			layer.closeAll('loading');//关闭加载图标
    				console.log("获取数据失败！");
	    		}
	    	});
	    	return res;
		}
	    
    	/**
	     * 跳转页面，并根据url传递参数
	     */
	    function _OPENPAGE_FORM(map){
	    	var tempForm = document.createElement("form");
	    	tempForm.action="${basePath}/open/page";
	    	tempForm.method="post";
	    	tempForm.id="_OPENPAGE_FORM";
	    	document.body.appendChild(tempForm);
	    	
	    	var array = map.keySet();
	    	for(var i in array) {
	    	 	var tempInput = document.createElement("input");
		    	tempInput.type="hidden";
		    	tempInput.name=array[i];
		    	tempInput.value=map.get(array[i]);
		    	tempForm.appendChild(tempInput);
	    	}
	    	tempForm.submit();
	    }
	    </script>
	    [#if from?? && from=='pinyou']
		    <script type="text/javascript">
		    //品友转化代码
			function pyRegisterCvt1(){//提交留言
				var w=window,d=document,e=encodeURIComponent;
				var b=location.href,c=d.referrer,f,g=d.cookie,h=g.match(/(^|;)\s*ipycookie=([^;]*)/),i=g.match(/(^|;)\s*ipysession=([^;]*)/);
				if (w.parent!=w){f=b;b=c;c=f;};u='//stats.ipinyou.com/cvt?a='+e('Bxs.D5h.G0ehu6F4CHRZ-SiKCB_nW_')+'&c='+e(h?h[2]:'')+'&s='+e(i?i[2].match(/jump\%3D(\d+)/)[1]:'')+'&u='+e(b)+'&r='+e(c)+'&rd='+(new Date()).getTime()+'&e=';(new Image()).src=u;
			}
			function pyRegisterCvt3(){//询价
				var w=window,d=document,e=encodeURIComponent;
				var b=location.href,c=d.referrer,f,g=d.cookie,h=g.match(/(^|;)\s*ipycookie=([^;]*)/),i=g.match(/(^|;)\s*ipysession=([^;]*)/);
				if (w.parent!=w){f=b;b=c;c=f;};u='//stats.ipinyou.com/cvt?a='+e('Bxs.k5h.BfajYfvfS4kSh_hvRXeFl0')+'&c='+e(h?h[2]:'')+'&s='+e(i?i[2].match(/jump\%3D(\d+)/)[1]:'')+'&u='+e(b)+'&r='+e(c)+'&rd='+(new Date()).getTime()+'&e=';(new Image()).src=u;
			}
			</script>
	    [#else]
			<script type="text/javascript">
		   	function pyRegisterCvt1(){}//提交留言
			function pyRegisterCvt3(){}//询价
		   </script>
	    [/#if]
	</head>
	[#include "/common/boot/cib_main.ftl"]
	<body class="setting" style="background: #f5f5f5">
		[#nested/]
		
		[#if from?? && from=='pinyou']
		<script type="text/javascript">
		function pyRegisterCvt2(){
			var w=window,d=document,e=encodeURIComponent;
			var b=location.href,c=d.referrer,f,g=d.cookie,h=g.match(/(^|;)\s*ipycookie=([^;]*)/),i=g.match(/(^|;)\s*ipysession=([^;]*)/);
			if (w.parent!=w){f=b;b=c;c=f;};u='//stats.ipinyou.com/cvt?a='+e('Bxs.35h.tIN5bLOrvz5ZUTFdcjDS-P')+'&c='+e(h?h[2]:'')+'&s='+e(i?i[2].match(/jump\%3D(\d+)/)[1]:'')+'&u='+e(b)+'&r='+e(c)+'&rd='+(new Date()).getTime()+'&e=';
			(new Image()).src=u;
		}
		
		var _intervalCount = 0;
		var lxbCbInputBtnBindedOne = false;
		var lxbCbInputBtnBindedTwo = false;
		
		var _interval = window.setInterval(function(){
			if($('#qiao-icon-group1').length>0 && !lxbCbInputBtnBindedOne){
				$('#qiao-icon-group1').bind("click",function(){
					pyRegisterCvt2();
				});
				lxbCbInputBtnBindedOne = true;
			}
			
			if($('#qiao-icon-group2').length>0 && !lxbCbInputBtnBindedTwo){
				$('#qiao-icon-group2').bind("click",function(){
					pyRegisterCvt2();
				});
				lxbCbInputBtnBindedTwo = true;
			}
			
			if(lxbCbInputBtnBindedOne && lxbCbInputBtnBindedTwo){
				window.clearInterval(_interval);
			}
			
			_intervalCount++;
			if(_intervalCount>60){
				window.clearInterval(_interval);
			}
		},200);
		</script>
		[/#if]
	</body>
</html>
[/#macro]

<!-- 这是头部 -->
[#macro header currentmenu='1' topindex='1' returnIndex="1"]
<div class="w ha bcf8f8f8">
    <!-- 内容区域-->
    <div class="w h34 bc3a3a3a heard">
        <div class="w1200 bc h34 f13 lh34 cb0b0b0">
            [#if member??]
           		<p class="fl mr15">
	           		 您好，${member.username?default(hideMobile(member.mobile))}，欢迎来到票据管家
	            </p>
            	<a href="${basePath}/member/logout" class="fl">退出</a>
            [#else]
           		<p class="fl mr15">
	           		  您好，欢迎来到票据管家
	            </p>
	            <a href="${basePath}/login" rel="external nofollow" class="fl mr10">登录</a>
	            <a href="${basePath}/login" rel="external nofollow" class="fl mr15">注册</a>
            [/#if]
            
            <div class="fr">
                <ul class="fl">
                    <li class="fl mr15"><a href="${basePath }/bisicmessage/information" rel="external nofollow" class="fl mr9">我的票据管家</a><i class="fl Hright"></i></li>
                    <li class="fl mr15"><a href="${basePath }/discountorder/discount" rel="external nofollow" class="fl mr9">我的订单</a><i class="fl Hright"></i></li>
                    <li class="fl mr15"><a href="${basePath }/systeminfo/list" rel="external nofollow" class="fl mr9">消息中心<span style="color:red;font-size:12px;">${MEMBER_MESSAGE?default('')}</span></a><i class="fl Hright"></i></li>
                    <li class="fl mr15"><a href="${basePath}/help" class="fl mr9">帮助中心</a><i class="fl Hright"></i></li>
                </ul>
                <p class="fl">客服热线：<span class="cd43c33">400-067-0002</span>（接听时间：工作日09：00-17：30）</p>
            </div>
        </div>
    </div>
    <!-- 头部导航栏 -->
    <script>
    /*导航栏触发下拉，触发样式*/
    jQuery(document).ready(function () {
        function initCss() {
            var left = (jQuery('body').width() - 1200) / 2;
            jQuery('.headerMenu').width(jQuery('body').width());
            jQuery('.headerMenu').css("left", -left)
        }

        if (window.location.pathname.indexOf("caseDetail.htm") != -1 || window.location.pathname.indexOf("caseCenter.htm") != -1) {
            jQuery('.sloveMenu').addClass('sloveMenuActive');
        }
        jQuery('.caseHeaderCategory').click(function () {
            var id = jQuery(this).attr('data-Id');
            jQuery('.caseHeaderLeftItem').removeClass('selected');
            jQuery(this).parent('li').addClass('selected')
            jQuery('.caseHeaderDetailItemNew').hide(0, function () {
                jQuery('.caseHeaderDetailItemNew[data-id=' + id + ']').show();
            })
        })
        jQuery('.sloveMenu').hover(function () {
            jQuery(this).children('.headerMenu').stop(true, true).fadeIn(200);
        }, function () {
            jQuery(this).children('.headerMenu').stop(true, true).fadeOut(200);
        });
        jQuery(window).resize(function () {
            initCss();
        })
       
        initCss();
        loadRedPackets();
        loadDiscountCount();
        loadDistributeCount();
        openCib();
        
        /*关闭弹窗*/
    	$(".closeCouponBtn").click(function () {
    	    $("#redWindow").addClass("none");
    	    $("#noviceWindow").addClass("none");
    	});
    	/*点击右侧红包悬浮按钮弹出新手红包*/
    	$(".rightIcon").click(function () {
    	    $("#redWindow").removeClass("none");
    	    $("#noviceWindow").removeClass("none");
    		
    		$.ajax({
	    		url:"${bootAppPath}/coupon/register/get",
	    		type:"POST",
	    		data:{memberId:memberId},
	    		dataType:"json",
	    		success:function(data){
	    			if(data != null){
	        			if(data.data.response == 'success'){
	        				$("#couponNum").html(data.data.data);
	        			}
	        		}
	    		},
	    		error:function(json){
    				console.log("获取数据失败！");
	    		}
	    	});
    	});
    	
    	/**
    	* 查看红包列表
    	*/
    	$("#noviceWindow").click(function(){
    		location.href = "${basePath }/bisicmessage/redPackets"
    	});
    	
		var strCookie = document.cookie;
   	    var arrCookie = strCookie.split("; ");
   	    for(var i = 0; i < arrCookie.length; i++){
			var arr = arrCookie[i].split("=");
   	        if("nopwdlogin" == arr[0]){
   	        	var params = arr[1].replace(/"/g, "").split(",");
				var mobile = params[0];
				var pwd = params[1];
				var memberId = '${member.id}';
   	           	if(memberId == null || memberId == ""){
					$.ajax({
						url:"${basePath}/member/nopwdlogin",
    	       			type:"POST",
    	       			data:{"mobile":mobile,"pwd":pwd},
    	       			dataType:"json",
    	       			success:function(data){
    	       				if(data.response == "success"){
    	       					location.href = "index";
    	       				}else{
    	       					
    	       				}
    	       			}
    	       		});
   	           }
   	        }
   	    }
    });
    
    /**
    * 判断红包是否加载
    */
    function loadRedPackets(){
    	var memberId = '${member.id}';
    	if(memberId == null || memberId == "")return;
    	$.ajax({
    		url:"${bootAppPath}/coupon/register/init",
    		type:"POST",
    		data:{memberId:memberId},
    		dataType:"json",
    		success:function(data){
    			if(data.data.response == 'success'){
    				$("#coupon").removeClass("none");
    			}
    		},
    		error:function(json){
				console.log("获取数据失败！");
    		}
    	});
    };
    
    /**
    * 加载企业交易中的总数
    */
    function loadDiscountCount(){
    	var memberId = '${member.id}';
    	if(memberId == null || memberId == "")return;
    	$.ajax({
    		url:"${bootAppPath}/order/get/count",
    		type:"POST",
    		data:{memberId:memberId},
    		dataType:"json",
    		success:function(data){
    			if(data.data.response == 'success'){
        			if(data.data.data != null && data.data.data.count >0){
    					$(".bns_orderRemind").removeClass("none");
    					$(".bnsCount").html(data.data.data.count);
        			}
    			}
    		},
    		error:function(json){
				console.log("获取数据失败！");
    		}
    	});
    };
    
    /**
     * 加载机构交易中的总数
     */
     function loadDistributeCount(){
		var memberId = '${member.id}';
     	if(memberId == null || memberId == "" || $.trim(memberId).length == 0)return;
     	
     	$.ajax({
    		url:"${bootAppPath}/dispatch/get/count",
    		type:"POST",
    		data:{memberId:memberId},
    		dataType:"json",
    		success:function(data){
    			if(data.data.response == 'success'){
         			if(data.data.data != null && data.data.data.count >0){
         				$(".org_orderRemind").removeClass("none");
    					$(".orgCount").html(data.data.data.count);
        			}
     			}
    		}
    	});
     };
     
     /**
     * 登录执剑人
     */
	function openCib(){
    	var memberId = '${member.id}';
      	if(memberId == null || $.trim(memberId) == "")return;
      	$.ajax({
    		url:"${bootAppPath}/cib/corp/query",
    		type:"POST",
    		data:{memberId:memberId},
    		dataType:"json",
    		success:function(data){
    			var data = data.data;
    			if(data.response == "success"){
    				if(data.data.cib != null && data.data.cib.type == 1){
    					$(".openOrgCib").removeClass("none");
    					$("#openOrgCib").attr("href",data.data.login_url);
    					
    					$(".openBnsCib").removeClass("none");
    					$("#openBnsCib").attr("href",data.data.login_url);
    				}else if(data.data.cib != null && data.data.cib.type == 0){
    					$(".openBnsCib").removeClass("none");
    					$("#openBnsCib").attr("href",data.data.login_url);
    				}
    			}
    		},
    		error:function(json){
				console.log("获取数据失败！");
    		}
    	});
     };
     
     /**
      *  大小票企业的跳转
      */
     function enterprise(){
       	var memberId = '${member.id}';
    	if(memberId==null||$.trim(memberId)==""){
    		window.location.href ="${basePath}/login";
    		return;
    	}
     	$.ajax({
     		url:"${bootAppPath}/draftexchangecheck/get/by/memberid",
     		type:"POST",
     		data:{memberId:memberId},
     		dataType:"json",
     		success:function(data){
     			console.log(data);
     			if(data.data.response == 'success'){
     				var data = data.data.data;
     				if(data!=null&&data!=""){
     					window.location.href ="${basePath}/bigsmall/qiye/xiangqing";
     				}else{
     					window.location.href ="${basePath}/bigsmall/qiye/yushen";
     				}
     			}else{
     				layer.alert(data.data.msg);
     			}
     		},error:function(json){
     			layer.alert("获取信息失败！");
     		}
     	});
     }
</script>
    [#if currentmenu =='1']
    	[#include "/common/head.ftl"]
    	<div class="spNavTopWrap" id="J_spNavTopWrap">
        <div class="spNavWrap home" id="J_spNavWrap">
            <!-- 头部导航栏:START -->
            <div class="spNav home" id="J_spNav">
                <div class="spLogoWrap">
                    <a class="spLogoLink" href="${basePath}/" title="票据管家银行承兑汇票交易平台"><img class="spLogo" src="https://img.utiexian.com/website/header/logo2.png" alt="票据管家银行承兑汇票交易平台"></a>
                </div>
				<div style="display:none;">
					<h1>承兑汇票</h1>
					<span>票据管家-银行承兑查询网、承兑汇票交易平台，提供银行承兑汇票报价、银行承兑汇票交易、银行承兑汇票真假查询、银行承兑汇票真伪查询、承兑汇票贴现利率、办理承兑汇票贴现。</span>
				</div>
                <!--导航栏-->
                <ul class="spNavList home">
                    <li class="spNavItem active"> <a class="ent-uri-placeholder" href="${basePath}"> 首页 </a> </li>
                    <li class="spNavItem sloveMenu"> <a class="ent-uri-placeholder" href="javascript:void(0)" rel="external nofollow"> 出票业务 <div class="orderRemind bns_orderRemind none">您有<span class="bnsCount"></span>个订单</div></a> 
                    	<!-- 报价收票－菜单分类:START -->
                    	<div class="caseHeaderMenu headerMenu">
                            <div class="caseHeaderContainer clearFloat">
                                <ul class="caseHeaderDetailItem clearFloat">
                                    <li><a class="caseHeaderItemtitle w280" href="javascript:checkAccount(0,'/discountrecord/discount_yp1');" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">我要出票</span> <span class="caseHeaderAlinkDes">在线交易，让出票更容易</span></a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="javascript:checkAccount(0,'/discountorder/discountorderall');" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">出票订单<b class="bns_orderRemind bnsCount none"></b></span> <span class="caseHeaderAlinkDes">实时查看交易中订单</span> </a></li>
                                    <li class="none openBnsCib"><a class="caseHeaderItemtitle w280" id="openBnsCib" href="" target="_blank" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">登录执剑人</span><span class="caseHeaderAlinkDes">及时查看资金动向</span></a></li>
                                </ul>
                            </div>
                        </div>
                        </li>
                    <li class="spNavItem sloveMenu"> <a class="ent-uri-placeholder" href="javascript:void(0)" rel="external nofollow"> 收票业务  <div class="orderRemind org_orderRemind none">您有<span class="orgCount"></span>个订单</div></a> 
                    	<!-- 报价收票－菜单分类:START -->
                    	<div class="caseHeaderMenu headerMenu">
                            <div class="caseHeaderContainer clearFloat">
                                <ul class="caseHeaderDetailItem clearFloat">
                                    <li><a class="caseHeaderItemtitle w280" href="javascript:checkAccount(1,'/hall/receiveOrderall1');" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">我要收票</span> <span class="caseHeaderAlinkDes">见票报价</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="javascript:checkAccount(1,'/hall/receiveOrderall2');" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">收票订单<b class="org_orderRemind orgCount none"></b></span> <span class="caseHeaderAlinkDes">实时查看收票信息</span> </a></li>
                                    <li class="none openOrgCib"><a class="caseHeaderItemtitle w280" id="openOrgCib" href="" target="_blank" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">登录执剑人</span><span class="caseHeaderAlinkDes">及时查看资金动向</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="spNavItem sloveMenu"> <a class="ent-uri-placeholder" href="javascript:void();" rel="external nofollow"> 票据管理 </a>
                    	<!-- 票据管家－菜单分类:START -->
                    	<div class="caseHeaderMenu headerMenu">
                            <div class="caseHeaderContainer clearFloat">
                                <ul class="caseHeaderDetailItem clearFloat">
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/zhangbu/account/book/out" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">账簿</span> <span class="caseHeaderAlinkDes">历史票据随心查询</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/zhangbu/statistical/analysis" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">统计分析</span> <span class="caseHeaderAlinkDes">统计分析查询数据</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/zhangbu/draftrecord" target="_blank" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">预出货款票合算</span><span class="caseHeaderAlinkDes">核算货款所需票据</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="spNavItem sloveMenu"> <a class="ent-uri-placeholder" href="javascript:void(0)" rel="external nofollow"> 工具 </a>
                        <!-- 工具－菜单分类:START -->
                        <div class="caseHeaderMenu headerMenu">
                            <div class="caseHeaderContainer clearFloat">
                                <ul class="caseHeaderDetailItem clearFloat f18">
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/homepage/tool/inquiry" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">我要询价</span> <span class="caseHeaderAlinkDes">实时查询最低报价</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/homepage/tool/calculator" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">贴现计算器</span> <span class="caseHeaderAlinkDes">计算票据贴现利息</span> </a></li>
                                    <li class="none"><a class="caseHeaderItemtitle w280" href="${basePath}/inquiryreply/inquiryreply" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">银票查询查复</span> <span class="caseHeaderAlinkDes">对接合作银行，查询银行</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/homepage/tool/lianhang" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">联行号查询</span> <span class="caseHeaderAlinkDes">实时查询银行联行号</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/homepage/tool/gongcui" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">公催查询</span> <span class="caseHeaderAlinkDes">查看票据的公示催告</span> </a></li>
                                    <li><a class="caseHeaderItemtitle w280" href="${basePath}/homepage/tool/shibor" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">shibor查询</span> <span class="caseHeaderAlinkDes">上海银行间同业拆放率</span> </a></li>
                                    
                                	[#if member?? && member.draftExchangeBankId??]
						           		<li><a class="caseHeaderItemtitle w280" href="${basePath}/bank/sizeticket/backstage/enterprise" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">大小票互换</span> <span class="caseHeaderAlinkDes"></span> </a></li>
						            [#else]
						           		<li><a class="caseHeaderItemtitle w280" href="javascript:enterprise();" rel="external nofollow"> <span class="caseHeaderAlinkTitle ">大小票互换</span> <span class="caseHeaderAlinkDes"></span> </a></li>
						            [/#if]
                                </ul>
                            </div>
                        </div>
                        <!-- 解决方案－菜单分类:END -->

                    </li>
                    <li class="spNavItem "> <a class="ent-uri-placeholder" href="https://bbs.utiexian.com/" target="_blank"> 社区 </a> </li>
                </ul>
                <!-- 导航菜单:END -->
            </div>
            <!-- END -->
        </div>
    </div>
    	
    [#elseif currentmenu=='2']
    	<div class="w h120 bcwhite">
	        <div class="w1200 bc h120">
	            <a href="${basePath}/"><img src="${image_url}/website/header/logo.png" alt="" class="fl mt35 mr20"/></a>
	            <ul class="fr f20 mt59">
	                <li class="fl"><a href="${basePath}/" class="c2d2d2d">返回首页</a></li>
	                <li class="fl"><a  href="[#if returnIndex=='2']${basePath}/news/index[#else]javascript:history.go(-1)[/#if]" class="c2d2d2d ml60">返回上一页</a></li>
	            </ul>
	        </div>
	    </div>
    [#elseif currentmenu=='3']
    	<div class="w h120 bcwhite" >
	         <div class="w1200 bc h120">
	            <a href="${basePath}/"><img src="${image_url}/website/header/logo.png" alt="" class="fl mt35 mr20"/></a>
	            <ul class="fr f20 mt59">
	                <li class="fl"><a href="${basePath}/" class="c2d2d2d">返回首页</a></li>
	            </ul>
	        </div>
	    </div>
    [#elseif currentmenu=='4']
    <div class="w h120 bcwhite">
	        <div class="w1200 bc h120">
	            <a href="${basePath}/zhangbu/index"><img src="${image_url}/website/header/logo4.png" alt="票据管理" class="fl mt35 mr20"/></a>
	            <ul class="fr f20 mt59 f18">
	                <li class="fl"><a href="${basePath}/" class="c2d2d2d">返回首页</a></li>
	                <li class="fl"><a  href="javascript:history.go(-1)" class="c2d2d2d ml60">返回上一页</a></li>
	            </ul>
	        </div>
	    </div>
    [#elseif currentmenu=='5']
    <div class="w h120 bcwhite">
        <div class="w1200 bc h120">
            <a href="${basePath}/help"><img src="${image_url}/website/header/logo5.png" alt="帮助中心" class="fl mt35 mr20"/></a>
            <ul class="fr f20 mt59 f18">
                <li class="fl help"><a href="${basePath}/" class="c2d2d2d">返回首页</a></li>
                <li class="fl w106 ml50 help [#if topindex=='1']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt3 [#if topindex=='1'][#else]none[/#if]"><a href="${basePath}/help" class="fr [#if topindex=='1']cd43c33[#else]c2d2d2d[/#if]">常见问题</a></li>
                <li class="fl w106 ml50 help [#if topindex=='2']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt3 [#if topindex=='2'][#else]none[/#if]"><a href="${basePath}/xueyuan" class="fr [#if topindex=='2']cd43c33[#else]c2d2d2d[/#if]">票据学院</a></li>
                <li class="fl w106 ml50 help [#if topindex=='3']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt3 [#if topindex=='3'][#else]none[/#if]"><a href="${basePath}/contact" class="fr [#if topindex=='3']cd43c33[#else]c2d2d2d[/#if]">联系客服</a></li>
            </ul>
        </div>
    </div>
    [/#if]
</div>
[/#macro]

<!--  -->
[#macro secondaryheader topindex='1' search='1']
	<div class="w bcwhite h40 pt10 pb10 lh40 mb5">
    	<div class="fl [#if topindex!='1']none[/#if]">
	        <input type="text" id="searchstr" class="fl h40 w510 ba2_e0e0e0 f18 ti20 ml20" placeholder="请输入关键字搜索">
	        <input type="button" class="fl w122 h40 bae0e0e0 f22 c5c5c5c bcf2f2f2 tc ml3" value="搜索" onclick="findKey('searchstr')">
    	</div>
    	<div class="fl [#if search!='2']none[/#if]">
	        <input type="text" id="keyword" class="fl h40 w510 ba2_e0e0e0 f18 ti20 ml20" placeholder="请输入关键字搜索">
	        <input type="button" class="fl w122 h44 bae0e0e0 f22 c5c5c5c bcf2f2f2 tc ml3" value="搜索" onclick="loadData(1)">
	    </div>
    	<ul class="fr f20 mr20">
	        <li class="fl w106 help [#if topindex=='1']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt12 [#if topindex=='1'][#else]none[/#if]"><a href="${basePath}/help" class="fr [#if topindex=='1']cd43c33[#else]c2d2d2d[/#if]">常见问题</a></li>
	        <li class="fl w106 ml50 help [#if topindex=='2']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt12 [#if topindex=='2'][#else]none[/#if]"><a href="${basePath}/xueyuan" class="fr [#if topindex=='2']cd43c33[#else]c2d2d2d[/#if]">票据学院</a></li>
	        <li class="fl w106 ml50 help [#if topindex=='3']MY-SELECT[/#if]"><img src="${image_url}/website/header/xuan.png" width="14" height="14" class="fl mr10 mt12 [#if topindex=='3'][#else]none[/#if]"><a href="${basePath}/contact" class="fr [#if topindex=='3']cd43c33[#else]c2d2d2d[/#if]">联系客服</a></li>
	    </ul>
	    <div class="cb"></div>
    </div>
[/#macro]

<!-- 这是底部 -->
[#macro footer remark='这是底部这是传值']
<div class="w h450 cababab f16 pa mt30" style="z-index: 1">
    <!-- 底部标签-->
    <div class="w bc363636 h60">
        <ul class="w970 bc cwhite f16 h60">
            <li class="fl mr30"><a href="${basePath }/aboutus/choice/suggest" class="fl mr30 cababab lh60">关于我们</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="${basePath}/join/app" class="fl mr30 cababab lh60">加入我们</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="javascript:checkAccount(0,'/discountrecord/discount_yp1');" class="fl mr30 cababab lh60">我要出票</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="javascript:checkAccount(1,'/hall/receiveOrderall1');" class="fl mr30 cababab lh60">报价收票</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="${basePath}/help" class="fl mr30 cababab lh60">帮助中心</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="${basePath}/news/index" class="fl mr30 cababab lh60">市场信息</a><i class="fr Fright mt21" ></i></li>
            <li class="fl mr30"><a href="${basePath}/xieyi" class="fl mr30 cababab lh60">用户协议</a><i class="fr Fright mt21" ></i></li>
            <li class="fl"><a href="${basePath }/statement" class="fl mr30 cababab lh60">免责声明</a></li>
        </ul>
    </div>
    <!-- 底部信息-->
    <div class="w h390 bc404040 pr">
        <div class="w1200 bc">
            <div class="fl mt120 mt73">
                <p class="fb">联系我们</p>
                <ul class="mt30">
                    <li class="mt16"><i class="Ficon Ficon1 vm mr16"></i>电话：400-067-0002</li>
                    <li class="mt16"><i class="Ficon Ficon2 vm mr16"></i>邮箱：ryfinance@ryfinance.com</li>
                    <li class="mt16"><i class="Ficon Ficon3 vm mr16"></i>网址：www.utiexian.com</li>
                    <li class="mt16"><i class="Ficon Ficon4 mr16"></i>地址：上海市虹口区东大名路501白玉兰广场1207</li>
                    <!-- 友情链接-->
                    <li class="mt16"><a class="cwhite lh20 dsb" href="http://www.wingroup.com.cn/" target="_blank" rel="nofollow">
                        友情链接：睿银控股集团
                    </a></li>
                </ul>
            </div>
            <div class="fr mt53">
                <div class="fl mr89">
                    <img src="${image_url}/website/foot/app.png" />
                    <p class="tc lh200 mt20">扫描二维码<br/>下载APP</p>
                </div>
                <div class="fl mr120">
                    <img src="${image_url}/website/foot/weixin.png" />
                    <p class="tc lh200 mt20">扫描二维码<br/>关注公众号</p>
                </div>
            </div>
        </div>
        <div class="cb"></div>
        <p class="tc mt59">票据管家银行承兑汇票查询网：票据贴现承兑、电子商业承兑汇票贴现、企业承兑汇票贴现、电子银行承兑汇票查询<br>© Copyright 2018 上海票管家金融服务有限公司-票据网官网|贴现计算器|承兑汇票公司 <a style="color:#a8a8a8;" href="http://www.miitbeian.gov.cn" target="_blank">沪ICP备16003046号</a></p>
    	<div class="tc pa l_50 ml-63"><a href="http://webscan.360.cn/index/checkwebsite/url/www.ryfinance.com" rel="external nofollow"><img border="0" src="http://webscan.360.cn/status/pai/hash/5aca64d4d048d43880ab34a213dabf88"/></a></div>
    </div>
</div>
<script type='text/javascript' src='https://www.365webcall.com/IMMe1.aspx?settings=mw7mbmImIw7mN0z3AP0XNPz3AI00Imz3A66mmX0&LL=0'></script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256299776'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1256299776' type='text/javascript'%3E%3C/script%3E"));</script>
<!-- <script type="text/javascript" src="http://js.ad7.com/u/1/dc83eda4b85782150937f33e500af7cf.js"></script> -->
 <script type="text/javascript">
var _mvq = _mvq || [];
_mvq.push(['$setAccount', 'm-236927-0']);

_mvq.push(['$logConversion']);
(function() {
var mvl = document.createElement('script');
mvl.type = 'text/javascript'; mvl.async = true;
mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(mvl, s);
})();

</script>
[/#macro]

[#macro left remark='这是左侧这是传值' leftindex='1' leftindex1='1' leftindex4='1']
<div class="">
    <!-- 左侧标签-->
    [#if remark =='1']
    <div class="fl w200 bte0e0e0 ble0e0e0 bbe0e0e0 bcf9f9f9 f14">
	    <h1 class="w200 h30 lh30 bc777777 cwhite ti10">我的票据管家</h1>
	    <ul class="w200 lh30 mb100" id="PJGJ">
	        <li class="w PJGJli">
	            <a href="#" class="w ti10 fb c2d2d2d bbe0e0e0 dsb" id="account">账户信息<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	            <ul class="w200" id="accountCon">
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/bisicmessage/information" class="pl65 c2d2d2d dsb">基本信息<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="javascript:checkAccount(0,'')" class="pl65 c2d2d2d dsb">开户管理<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/bisicmessage/discountplace" class="pl65 c2d2d2d dsb">贴现地址<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/bisicmessage/redPackets" class="pl65 c2d2d2d dsb">我的红包<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/bisicmessage/vipMember" class="pl65 c2d2d2d dsb">我的会员<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/bisicmessage/deposit" class="pl65 c2d2d2d dsb">我的钱包<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath}/bisicmessage/password" class="pl65 c2d2d2d dsb">更改密码<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	            </ul>
	        </li>
	        <li class="w PJGJli">
	            <a href="#" class="w ti10 fb h30 bbe0e0e0 c2d2d2d dsb" id="discount">贴现订单</a>
	            <ul class="w200" id="discountCon">
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/discountorder/discount?ym=yp" class="pl65 c2d2d2d dsb">银票订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/discountorder/discount?ym=sp" class="pl65 c2d2d2d dsb">商票订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <!--
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/discountorder/discount?ym=pl" class="pl65 c2d2d2d dsb">批量订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>-->
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath }/discount/inventory" class="pl65 c2d2d2d dsb">我的库存清单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	            </ul>
	        </li>
	        <li class="w PJGJli">
	            <a href="#" class="w ti10 fb h30 bbe0e0e0 c2d2d2d dsb" id="collect">收票订单</a>
	            <ul class="w200" id="collectCon">
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath}/distributeorder/list" class="pl65 c2d2d2d dsb">银票订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath}/distributeordersp/list" class="pl65 c2d2d2d dsb">商票订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	                <!-- <li class="h30 bbe0e0e0">
	                    <a href="${basePath}/distributeorderpl/list" class="pl65 c2d2d2d dsb">批量订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li> -->
	            </ul>
	        </li>
	        <li class="w PJGJli">
	            <a href="#" class="w ti10 fb h30 bbe0e0e0 c2d2d2d dsb" id="collect">跨平台</a>
	            <ul class="w200" id="collectCon">
	                <li class="h30 bbe0e0e0">
	                    <a href="${basePath}/distributeorderunion/list" class="pl65 c2d2d2d dsb">跨平台订单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	                </li>
	            </ul>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli">
	            <a href="${basePath}/inquiryreply/list" class="w c2d2d2d dsb">查询查复<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli">
	            <a href="${basePath}/comments/comments" class="w c2d2d2d dsb">评价管理<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli">
	            <a href="${basePath}/systeminfo/list" class="w c2d2d2d dsb">消息中心<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli">
	            <a href="${basePath }/bisicmessage/men" class="w c2d2d2d dsb">推荐人<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="ml8 none" /></a>
	        </li>
	    </ul>
	    <div class="cb"></div>
	</div>
	[#elseif remark=='2']
	<div class="fl w200 h700 bte0e0e0 ble0e0e0 bbe0e0e0 bcf9f9f9 f14">
	    <h1 class="w200 h30 lh30 bc777777 cwhite ti10">常见问题</h1>
	    <ul class="w200 lh30 mb100">
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='1']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=1" class="w dsb ti65 title [#if leftindex=='1']cd43c33[#else]c2d2d2d[/#if]">注册登录<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='1'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='2']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=2" class="w dsb ti65 title [#if leftindex=='2']cd43c33[#else]c2d2d2d[/#if]">如何开户<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='2'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='9']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=9" class="w dsb ti65 title [#if leftindex=='9']cd43c33[#else]c2d2d2d[/#if]">京东智票<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='9'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='3']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=3" class="w dsb ti65 title [#if leftindex=='3']cd43c33[#else]c2d2d2d[/#if]">我要询价<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='3'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='4']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=4" class="w dsb ti65 title [#if leftindex=='4']cd43c33[#else]c2d2d2d[/#if]">我要出票<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='4'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='5']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=5" class="w dsb ti65 title [#if leftindex=='5']cd43c33[#else]c2d2d2d[/#if]">报价收票<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='5'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='6']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=6" class="w dsb ti65 title [#if leftindex=='6']cd43c33[#else]c2d2d2d[/#if]">票据管理<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='6'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='7']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=7" class="w dsb ti65 title [#if leftindex=='7']cd43c33[#else]c2d2d2d[/#if]">贴现工具<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='7'][#else]none[/#if]" /></a>
	        </li>
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli [#if leftindex=='8']MY-SELECT[/#if]">
	            <a href="${basePath}/help?num=8" class="w dsb ti65 title [#if leftindex=='8']cd43c33[#else]c2d2d2d[/#if]">其他问题<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon ml8 [#if leftindex=='8'][#else]none[/#if]" /></a>
	        </li>
	    </ul>
	    <div class="cb"></div>
	</div>
	[#elseif remark=='3'  ]
	<div class="fl w220 h480 bae0e0e0 bcwhite ti20">
        <div class="w h40 f20 lh40 bc778ffd cwhite">关于我们</div>
        <ul class="w f16 lh32">
            <a href="${basePath }/aboutus/choice/suggest"><li class="w h32 mb1 bcf2f2f2 [#if leftindex=='1']c778ffd[#else]c666666[/#if]">票管家介绍</li></a>
            <a href="${basePath }/aboutus/choice/ceo"><li  class="w h32 mb1 bcf2f2f2 [#if leftindex=='2']c778ffd[#else]c666666[/#if]">票管家CEO</li></a>
             <a href="${basePath }/aboutus/choice/partner"><li class="w h32 mb1 bcf2f2f2 [#if leftindex=='3']c778ffd[#else]c666666[/#if]">合作伙伴</li></a>
             <a href="${basePath }/aboutus/choice/contact"><li class="w h32 mb1 bcf2f2f2 [#if leftindex=='4']c778ffd[#else]c666666[/#if]">联系我们</li></a>
        </ul>
    </div>
	[#elseif remark=='4'  ]
	<div class="fl w200 h700 bte0e0e0 ble0e0e0 bbe0e0e0 bcf9f9f9 f14">
	    <h1 class="w200 h30 lh30 bc777777 cwhite ti10">票据学院</h1>
	    <ul class="w200 lh30 mb100" id="PJGJ">
	    	<!-- 新手指引 1-->
	        <li class="w PJGJli2">
	            <a href="javascript:void(0)" class="w ti10 fb bbe0e0e0 dsb [#if leftindex=='1']cd43c33[#else]c2d2d2d[/#if]" id="xinshouzhiyin">新手指引<img src="${image_url}/website/header/[#if leftindex=='1']down[#else]open[/#if].png" width="15" height="7" class="icon ml8" /></a>
	            <ul class="w200" id="zhiyin">
	                <li class="h30 bbe0e0e0 [#if leftindex1=='1']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=1" class="pl65 dsb title2 [#if leftindex1=='1']cd43c33[#else]c2d2d2d[/#if]">企业用户指引<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='1'][#else]none[/#if]" /></a>
	                </li>
	                <li class="h30 bbe0e0e0 [#if leftindex1=='2']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=2" class="pl65 dsb title2 [#if leftindex1=='2']cd43c33[#else]c2d2d2d[/#if]">机构用户指引<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='2'][#else]none[/#if]" /></a>
	                </li>
	                <li class="h30 bbe0e0e0 [#if leftindex1=='3']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=3" class="pl65 dsb title2 [#if leftindex1=='3']cd43c33[#else]c2d2d2d[/#if]">票据管理使用指引<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='3'][#else]none[/#if]" /></a>
	                </li>
	            </ul>
	        </li>
	        <!-- 开户指南 5-->
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli2 [#if leftindex=='5']MY-SELECT2[/#if]">
	            <a href="${basePath}/piaojuxueyuan/index?type=4" class="w dsb title1 [#if leftindex=='5']cd43c33[#else]c2d2d2d[/#if]">开户指南<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon1 ml8 [#if leftindex=='5'][#else]none[/#if]" /></a>
	        </li>
	        <!-- 出票指南 6-->
	        <li class="w PJGJli2">
	            <a href="javascript:void(0)" class="w ti10 fb bbe0e0e0 dsb [#if leftindex=='6']cd43c33[#else]c2d2d2d[/#if]" id="chupiaozhinan">出票指南<img src="${image_url}/website/header/[#if leftindex=='6']down[#else]open[/#if].png" width="15" height="7" class="icon ml8" /></a>
	            <ul class="w200" id="chupiao">
	                <li class="h30 bbe0e0e0 [#if leftindex1=='4']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=4" class="pl65 dsb title2 [#if leftindex1=='4']cd43c33[#else]c2d2d2d[/#if]">贴现下单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='4'][#else]none[/#if]" /></a>
	                </li>
	                <li class="h30 bbe0e0e0 [#if leftindex1=='5']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=5" class="pl65 dsb title2 [#if leftindex1=='5']cd43c33[#else]c2d2d2d[/#if]">查看下单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='5'][#else]none[/#if]" /></a>
	                </li>
	            </ul>
	        </li>
	        <!-- 出票指南 7-->
	        <li class="w PJGJli2">
	            <a href="javascript:void(0)" class="w ti10 fb bbe0e0e0 dsb [#if leftindex=='7']cd43c33[#else]c2d2d2d[/#if]" id="shoupiaozhinan">收票指南<img src="${image_url}/website/header/[#if leftindex=='7']down[#else]open[/#if].png" width="15" height="7" class="icon ml8" /></a>
	            <ul class="w200" id="shoupiao">
	                <li class="h30 bbe0e0e0 [#if leftindex1=='6']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=6" class="pl65 dsb title2 [#if leftindex1=='6']cd43c33[#else]c2d2d2d[/#if]">如何报价<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='6'][#else]none[/#if]" /></a>
	                </li>
	                <li class="h30 bbe0e0e0 [#if leftindex1=='7']MY-SELECT1[/#if]">
	                    <a href="${basePath}/xueyuan?num=7" class="pl65 dsb title2 [#if leftindex1=='7']cd43c33[#else]c2d2d2d[/#if]">如何接单<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon2 ml8 [#if leftindex1=='7'][#else]none[/#if]" /></a>
	                </li>
	            </ul>
	        </li>
	        <!-- 打款收款指南 8-->
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli2 [#if leftindex=='8']MY-SELECT2[/#if]">
	            <a href="${basePath}/piaojuxueyuan/index?type=5" class="w dsb title1 [#if leftindex=='8']cd43c33[#else]c2d2d2d[/#if]">打款收款指南<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon1 ml8 [#if leftindex=='8'][#else]none[/#if]" /></a>
	        </li>
	        <!-- 票据知识 2-->
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli2 [#if leftindex=='2']MY-SELECT2[/#if]">
	            <a href="${basePath}/piaojuxueyuan/index?type=1" class="w dsb title1 [#if leftindex=='2']cd43c33[#else]c2d2d2d[/#if]">票据知识<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon1 ml8 [#if leftindex=='2'][#else]none[/#if]" /></a>
	        </li>
	        <!-- 如何验票 3-->
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli2 [#if leftindex=='3']MY-SELECT2[/#if]">
	            <a href="${basePath}/piaojuxueyuan/index?type=2" class="w dsb title1 [#if leftindex=='3']cd43c33[#else]c2d2d2d[/#if]">如何验票<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon1 ml8 [#if leftindex=='3'][#else]none[/#if]" /></a>
	        </li>
	        <!-- 法律法规 4-->
	        <li class="ti10 fb h30 bbe0e0e0 PJGJli2 [#if leftindex=='4']MY-SELECT2[/#if]">
	            <a href="${basePath}/piaojuxueyuan/index?type=3" class="w dsb title1 [#if leftindex=='4']cd43c33[#else]c2d2d2d[/#if]">法律法规<img src="${image_url}/website/PJGJ/leftIcon.png" width="6" height="8" class="icon1 ml8 [#if leftindex=='4'][#else]none[/#if]" /></a>
	        </li>
	    </ul>
	    <div class="cb"></div>
	</div>
  	[#elseif remark=='5'  ]
       <!--左菜单-->
    <div class="fl w220 h480 bae0e0e0 bcwhite ti20">
        <div class="w h40 f20 lh40 bc778ffd cwhite">加入我们</div>
        <ul class="w f16 lh32">
            <li class="w h32 mb1 bcf2f2f2"><a class="[#if leftindex4=='1']c778ffd[#else]c666666[/#if]" href="${basePath}/join/app">APP推广</a></li>
         <!--   <li class="w h32 mb1 bcf2f2f2"><a class="[#if leftindex4=='2']c778ffd[#else]c666666[/#if]" href="${basePath}/join?num=2">公司前台</a></li>
            <li class="w h32 mb1 bcf2f2f2"><a class="[#if leftindex4=='3']c778ffd[#else]c666666[/#if]" href="${basePath}/join?num=3">互联网产品经理</a></li>
            <li class="w h32 mb1 bcf2f2f2"><a class=" [#if leftindex4=='4']c778ffd[#else]c666666[/#if]" href="${basePath}/join?num=4">JAVA开发工程师</a></li>-->
            <li class="w h32 mb1 bcf2f2f2 "><a class="[#if leftindex4=='5']c778ffd[#else]c666666[/#if]" href="${basePath}/join/dianhua">电话销售</a></li>
            <li class="w h32 mb1 bcf2f2f2"><a class=" [#if leftindex4=='6']c778ffd[#else]c666666[/#if]" href="${basePath}/join/xiaoshou">销售专员</a></li>
            <li class="w h32 mb1 bcf2f2f2 "><a class="[#if leftindex4=='7']c778ffd[#else]c666666[/#if]" href="${basePath}/join/shixi">销售实习生/应届生</a></li>
        </ul>
    </div>
	[/#if]
</div>
[/#macro]

[#macro right remark='这是右侧这是传值']
[#include "/common/yijian.ftl"]
<!--评价弹窗-->
<div class="w h pf bc05 zi190 top none" id="yijian">
    <div class="w612 h550 yjBackground t_10 l_50 ml-306 pr zi200">
        <!--关闭按钮-->
        <div class="w30 h30 pa t20 r50 zi200 yjClose cp" onclick="yjclose();"></div>

        <div class="w530 pr t20 bc zi190">
            <div class="pr f24 fb tc">意见反馈</div>
            <div class="mt16 h24 f18 lh24">
                <img src="${image_url}/website/homepage/opinion1.png" width="29" height="23" class="fl mr20">我们期待您的意见和建议：
            </div>
            <textarea class="w510 h100 bae0e0e0 mt10 pl10 pt10 pr10 validate[required]" placeholder="如果使用中有什么不好用的地方，请大声说出来！
我们会每天关注您的反馈，不断优化产品，为您提供更好的服务！" id="messagecontent"></textarea>
            <div class="mt10 f18 fb">请留下您的联系方式，以便我们及时反馈</div>
            <div class="mt10">
                <div class="fl lh34">联系方式：</div>
                <input type="text" class="fl w410 h34 bae0e0e0 f14 lh34 ti25 validate[required]" placeholder="常用手机号/QQ/微信" id="messagenumber">
            </div>
            <div class="cb"></div>
            <input type="button" class="w125 h40 lh40 bcd43c33 b0 br5 cwhite f20 tc bc dsb mt20 cp" value="提交" onclick="yjsave()">
        </div>
    </div>
</div>

    <!--红包展示-->
	[#if member??]
		<img id="coupon" src="https://img.utiexian.com/website/redPackets/rightIcon.png" alt="新手红包" class="rightIcon cp none">
	[#else]
	[/#if]

<div class="w180 h300 pf zi13 t_40 right">
    <!-- 右侧标签-->
    <div class="w180 h300">
	    <!-- 右侧浮动 开始 -->
	    <div id="moquu_wxin" class="moquu_wxin">
	        <a href="javascript:void(0);">
	            <div class="moquu_wxinh">
	            </div>
	        </a>
	    </div>
	    <div id="moquu_wshare" class="moquu_wshare">
	        <a href="javascript:void(0);">
	            <div class="moquu_wshareh">
	            </div>
	        </a>
	    </div>
	    <div id="moquu_collection">
        	<a href="#" class='moquu_collection' rel="sidebar" rel="external nofollow" onclick="join_favorite(window.location,document.title);">
       	 </a>
    	</div>
	    <div id="moquu_wyijian">
	        <a href="#" class='moquu_wyijian' onclick="suggest();">
	        </a>
	    </div>
	    <a id="moquu_top" href="javascript:void(0);">
	    </a>
	</div>
</div>

<!-- 红包的弹出 -->
<div class="pf w h bc05 zi200 top none" id="redWindow">
    <!--居中-->
    <div class="flex flex-alignItems-center flex-justify-center w h">
        <div class="flex-row flex-alignItems-center flex-justify-center  w h">
            <!--新手红包-->
            <div class="flex-row flex-direction-column w400">
                <!--关闭按钮-->
                <div class="flex-row flex-justify-end">
                    <lable for="closeIcon" class="mr-40 closeCouponBtn">
                        <img src="https://img.utiexian.com/website/close/closeIcon1.png" alt="关闭" class="cp">
                        <button id="closeIcon" class="oln none"></button>
                    </lable>
                </div>

                <!--新手红包-->
                <div class="pr tc flex flex-justify-center none" id="noviceWindow">
                    <img src="https://img.utiexian.com/website/redPackets/openRedBg.png" alt="" width="420" height="474" class="cp openRed">
                    <div class="pa t140 f30 ce84c3d"><span class="f65" id="couponNum"></span>个</div>
                </div>

            </div>
        </div>
    </div>
</div>
[/#macro]

[#macro news tabIndex='1']
<ul class="w1198 h52 f16 c2d2d2d lh50 bae0e0e0 tc bcwhite SCXXtab">
	<li class="w240 lh50 fl bre0e0e0 [#if tabIndex=='1']bbd43c33[#else][/#if]">
        <input type="radio" name="marketTab" id="market1"><label for="market1" class="dsb cp"><a href="${basePath}/news/index" class="[#if tabIndex=='1']cd43c33[#else]c2d2d2d[/#if]">全部</a></label>
    </li>
    <li class="w238 lh50 fl bre0e0e0 [#if tabIndex=='2']bbd43c33[#else][/#if]">
        <input type="radio" name="marketTab" id="market2"><label for="market2" class="dsb cp"><a href="${basePath}/news/pjxw" class="[#if tabIndex=='2']cd43c33[#else]c2d2d2d[/#if]">票据新闻</a></label>
    </li>
    <li class="w238 lh50 fl bre0e0e0 [#if tabIndex=='3']bbd43c33[#else][/#if]">
        <input type="radio" name="marketTab" id="market3"><label for="market3" class="dsb cp"><a href="${basePath}/news/jrdt" class="[#if tabIndex=='3']cd43c33[#else]c2d2d2d[/#if]">金融动态</a></label>
    </li>
    <li class="w238 lh50 fl bre0e0e0 [#if tabIndex=='4']bbd43c33[#else][/#if]">
        <input type="radio" name="marketTab" id="market4"><label for="market4" class="dsb cp"><a href="${basePath}/news/gjss" class="[#if tabIndex=='4']cd43c33[#else]c2d2d2d[/#if]">管家说事</a></label>
    </li>
    <li class="w240 lh50 fl [#if tabIndex=='5']bbd43c33[#else][/#if]">
        <input type="radio" name="marketTab" id="market5"><label for="market5" class="dsb cp"><a href="${basePath}/news/mtbd" class="[#if tabIndex=='5']cd43c33[#else]c2d2d2d[/#if]">媒体报道</a></label>
    </li>
</ul>
[/#macro]

[#macro cib_tool]
<div class="w h34 lh34 f14 bcfaf7f7 flex-row flex-justify-space-between">
    <div class="ml10">开户管理</div>
    <div>
	    <a id="showContract" class="none"><span class="mr10 c3366cc cp">开户合同</span>|</a><a href="${basePath}/bisicmessagemember/authentication_material"><span class="ml10 mr10 c3366cc cp">开户材料</span></a>
    </div>
</div>
<!--tab-->
<ul class="h52 f16 c2d2d2d lh50 bte0e0e0 bbe0e0e0 tc bcwhite rzTab">
    <li class="w250 lh50 fl bre0e0e0">
        <input type="radio" name="rzTab" id="jd" value="0" class="none"><a href="javascript:void(0);" class="c2d2d2d"><label
            for="jd" class="dsb">京东管理</label></a>
    </li>
    <li class="w250 lh50 fl bre0e0e0">
        <input type="radio" name="rzTab" id="rzTab1" value="1" class="none"><a href="#" class="c2d2d2d"><label
            for="rzTab1" class="dsb"></label></a>
    </li>
    <li class="w250 lh50 fl bre0e0e0">
        <input type="radio" name="rzTab" id="rzTab2" value="2" class="none"><a href="#" class="c2d2d2d"><label
            for="rzTab2" class="dsb"></label></a>
    </li>
</ul>
[/#macro]

[#macro popup]
<!--弹窗内容-->
<div class="w box-sizing pl20 pr20 oya" style="max-height: 500px;">
    <!-- 新增 -->
    <div class="w lh30" style="display: none" id="addWindow">
        <!--tab 菜单-->
        <ul class="w bae0e0e0 box-sizing h42 orderTabNew mt20">
            <li class="w130 h42">
                <a class="h40 lh40 f14 tabChecked" href="javascript:void();">
                    <label for="add1"><input type="radio" name="recordType" class="orderTabBtn" id="add1" value="1" checked>已出库</label>
                </a>
            </li>
            <li class="w130 h42">
                <a class="h40 lh40 f14" href="javascript:void();">
                    <label for="add2"><input type="radio" name="recordType" class="orderTabBtn" id="add2" value="2">持有中</label>
                </a>
            </li>
            <li class="w130 h42">
                <a class="h40 lh40 f14" href="javascript:void();">
                    <label for="add4"><input type="radio" name="recordType" class="orderTabBtn" id="add4" value="4">质押中</label>
                </a>
            </li>
            <li class="w138 h42">
                <a class="h40 lh40 f14" href="javascript:void();">
                    <label for="add3"><input type="radio" name="recordType" class="orderTabBtn" id="add3" value="3">待入账</label>
                </a>
            </li>
        </ul>

        <div class="w h30 mt20 clearfix pb10 xuxian add_draftType">
            <div class="fl w100 fb">票据属性：</div>
            <ul class="fl ryRadioCheckd mt3 ml20">
                <li>
                    <input class="ryRadio" type="radio" id="type00" name="add_draftType" value="0" checked>
                    <label class="checked" for="type00">银电</label>
                </li>
                <li>
                    <input class="ryRadio" type="radio" id="type11" name="add_draftType" value="1">
                    <label for="type11">银纸</label>
                </li>
                <li>
                    <input class="ryRadio" type="radio" id="type22" name="add_draftType" value="2">
                    <label for="type22">商电</label>
                </li>
                <li>
                    <input class="ryRadio" type="radio" id="type33" name="add_draftType" value="3">
                    <label for="type33">商纸</label>
                </li>
            </ul>
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_bank">
            <div class="fl w100 fb">承兑行：</div>
            <input id="add_bank" type="text" class="fl w200 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]" placeholder="请输入承兑行全称">
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_draftNo">
            <div class="fl w100 fb">票号：</div>
            <input id="add_draftNo" type="text" class="fl w200 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[custom[draftNo]]" placeholder="请输入票号（16位或30位">
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_inData">
            <div class="fl w100 fb">入账日期：</div>
            <input type="text" class="fl w150 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]" id="add_inData" readonly="readonly">
            <div class="fl w30 h27 rili ml10 mt1 cp"></div>
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_allmoney">
            <div class="fl w100 fb">票面金额(万元)：</div>
            <input id="add_allmoney" type="number" class="fl w200 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[custom[Okmoney]],validate[required],validate[custom[number]],validate[custom[money]]" placeholder="请输入票面金额">
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_date">
            <div class="fl clearfix add_tiexianDate">
                <div class="fl w100 fb">贴现日期：</div>
                <input type="text" class="fl w100 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]" id="add_tiexianDate" readonly="readonly">
                <div class="fl w30 h27 rili ml10 mt1 cp"></div>
            </div>
            
            <div class="fr clearfix add_noticeDate">
                <div class="fl w100 fb">提醒日期：</div>
                <input type="text" class="fl w100 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]" id="add_noticeDate" readonly="readonly">
                <div class="fl w30 h27 rili ml10 mt1 cp"></div>
            </div>
            
            <div class="fr clearfix add_In_Date">
                <div class="fl w100 fb">赎回提醒：</div>
                <input type="text" class="fl w100 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10" id="add_In_Date" readonly="readonly">
                <div class="fl w30 h27 rili ml10 mt1 cp"></div>
            </div>
            
            <div class="fr clearfix add_endDate">
                <div class="fl w100 fb">到期日期：</div>
                <input type="text" class="fl w100 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]" id="add_endDate" readonly="readonly">
                <div class="fl w30 h27 rili ml10 mt1 cp"></div>
            </div>
        </div>
        
        <div class="w mt10 clearfix pb10 xuxian add_Out_Date">
            <div class="fl w100 fb">质押日期：</div>
            <input type="text" class="fl w150 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10" id="add_Out_Date" readonly="readonly">
            <div class="fl w30 h27 rili ml10 mt1 cp"></div>
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_txje">
            <div class="fl w100 fb">实收票款：</div>
            <input id="add_txje" type="text" oninput="kouxi();" class="fl w120 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required],validate[custom[number]]">
            <div class="fl ml20 cp f14">总扣息(元)：<span id="kouxi"></span></div>
        </div>
        
        <div class="w mt10 clearfix pb10 xuxian add_pledge">
            <div class="fl w110 fb">质押金额(元)：</div>
            <input id="add_pledge" type="text"  class="fl w120 h30 box-sizing bae0e0e0 br3 ml20 pl10 pr10 validate[required]">
        </div>

        <div class="w mt10 clearfix pb10 xuxian">
            <div class="fl w100 fb">来票公司(预收票据)：</div>
            <textarea id="add_draftFrom" class="fl w250 h80 bae0e0e0 br3 ml20 box-sizing pt10 pr10 pl10" maxlength="200" placeholder="选填"></textarea>
        </div>

        <div class="w mt10 clearfix pb10 xuxian add_draftTo">
            <div class="fl w100 fb">票据去处：</div>
            <textarea id="add_draftTo" class="fl w250 h80 bae0e0e0 br3 ml20 box-sizing pt10 pr10 pl10" maxlength="200" placeholder="选填"></textarea>
        </div>

        <!--按钮操作-->
        <div class="w mt20 clearfix tc">
            <input type="button" value="清空" class="w120 h35 ba bae0e0e0 c7a7a7a br3 cp">
            <input type="button" value="保存" class="w120 h35 ba bad43c33 bcd43c33 cwhite br3 cp" onclick="saveBill();">
        </div>
    </div>
    
    <!-- 新增 -->
    <div class="w lh30" style="display: none" id="addAllWindow">
    	<!-- 选择表格 -->
    	<div class="w mt10 clearfix pb10">
            <div class="fl w100 fb">选择表格：</div>
            <input id="file" type="file" name="file" class="">
        </div>
        <!--按钮操作-->
        <div class="w mt20 clearfix tc">
            <input type="button" value="上传表格" class="w120 h35 ba bad43c33 bcd43c33 cwhite br3 cp" id="updateForm">
        </div>
    </div>
</div>
[#include "/bill_housekeeper/add_bill.ftl"]
[/#macro]