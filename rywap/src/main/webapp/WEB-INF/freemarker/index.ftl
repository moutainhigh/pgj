[#import "/common/main.ftl" as main]
[#include "/common/setting.ftl"]

[@main.body title="票据管家"]
[@main.header currentmenu='1'/]
<header class="header">
	<a class="head-left-logo" href="#"></a>
	<h2 class="head-title" href="tel:400-067-0002">400-067-0002</h2>
	<div class="" style="position: absolute;right: 6px;top: 7px;">
	<a class="" href="tel:400-067-0002">
		<img src="${imagePath}/rywap/head/call.png" class="vam" alt="" style="width: 30px;height: 30px;margin-right: 4px"/>
	</a>
	<a class="" href="https://app.utiexian.com/down.html">
		<img src="${imagePath}/rywap/head/download.png" class="vam" alt="" style="width: 30px;height: 30px;margin-right: 4px"/>
	</a>
	<a class="" href="https://www.utiexian.com/index">
		<img src="${imagePath}/rywap/head/pc.png" class="vam" alt="" style="width: 30px;height: 30px;"/>
	</a></div>
</header>
<div class="wrapper">
<!-- 功能-->
<div class="bcwhite tac choseIcon">
	<ul class="row">
		<li class="flex1" onclick="inquiry();"><img src="${imagePath}/rywap/tool/xunjia.png" alt="询价"/><div>询价</div></li>
		<li class="flex1" onclick="calculator();"><img src="${imagePath}/rywap/tool/jisuanqi.png" alt="计算器"/><div>计算器</div></li>
		<li class="flex1" onclick="downLoadApp();"><img src="${imagePath}/rywap/index/icon-chafu.png" alt="银票查询查复"/><div>银票查询查复</div></li>
		<li class="flex1" onclick="urge();"><img src="${imagePath}/rywap/tool/gongcui.png" alt="公催查詢"/><div>公催查询</div></li>
	</ul>
</div>

<!-- banner-->
<div class="banner">
	<img src="${imagePath}/rywap/index/banner.png" class="vam" alt=""/>
</div>

<!-- 公告栏-->
<div class="gonggao row tac">
	<div class="flex1 allMoneyDiv">
		<div class="zhipiaoTitle font14">100万以下电票</div>
		<div class="cgray yuelilvTitle">年利率（%）</div>
		<ul class="yuelilv">
			<li>国股：<span class="guogu">--</span></li>
			<li>城商：<span class="chengshang">--</span></li>
			<li>农商：<span class="nongshang">--</span></li>
		</ul>
	</div>
	<div class="flex1 dianpiaoDiv">
		<div class="dianpiaoTitle font14">100万以上买断电票</div>
		<div class="cgray nianlilvTitle">年利率（%）</div>
		<ul class="nianlilv">
			<li>国股：<span class="guogu">--</span></li>
			<li>城商：<span class="chengshang">--</span></li>
			<li>农商：<span class="nongshang">--</span></li>
		</ul>
	</div>
</div>

<!--票据指数 -->
<div class="mt10">
	<div class="cred titleIcon">
		<img src="${imagePath}/rywap/index/titleIcon.png" class="vam" alt=""/>
		<span>票据指数</span>
	</div>
    <div class="w100p bcwhite">
		<!-- tab标签-->
		<div class="title_bar">
			<ul id="pagenavi1" class="tabTitle tac row">
				<li class="SETCHART flex1 selectbar" data-type="1"><a href="javascript:void(0);" id="item0">一个月</a></li>
				<li class="SETCHART flex1" data-type="3"><a href="javascript:void(0);" id="item1">三个月</a></li>
			</ul>
		</div>
		<!-- tab内容-->
		<div class="swiper-container tabCon zhishuCon">
			<!-- <canvas id="myChart" width="400" height="200"></canvas> -->
			<div id="container" style="min-width:360px;height:200px;margin-top: 10px"></div>
		</div>
	</div>
</div>

<!-- 日历图-->
<div class="mt10">
	<div class="cred titleIcon">
		<img src="${imagePath}/rywap/index/titleIcon.png" alt="" class="vam"/>
		<span>日历图</span>
    </div>
    <div class="w100p bcwhite">
		<div class="title_bar">
			<ul id="pagenavi2" class="tabTitle tac row">
				<li class="flex1 selectbar"><a href="#" id="rili0">纸票半年期</a></li>
				<li class="flex1"><a href="#" id="rili1">电票半年期</a></li>
				<li class="flex1"><a href="#" id="rili2">电票一年期</a></li>
			</ul>
		</div>
		<div class="swiper-container tabCon riliCon">
			<div class="swiper-wrapper">
				[#if result.rilis??]
					[#list result.rilis as rili]
						<div class="swiper-slide">
							<img src="${imagePath}/${rili.path}" alt="日历图" class="vam rilitu"/>
						</div>
					[/#list]
				[/#if]
			</div>
		</div>
    </div>
</div>
</div>
<script type="text/javascript" src="https://www.utiexian.com/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${staticPath}/js/rywap/chartjs/Chart.bundle.js"></script>
<script type="text/javascript" src="${staticPath}/js/rywap/chartjs/utils.js"></script>
<script type="text/javascript">
/* var ctx = document.getElementById("myChart").getContext("2d"); */
$(document).ready(function(){
	piaoju(1);//获取票据指数（类型1表示一个月，具体规则参考后台实体类）
	getPrice();//获取报价
	
});

/**
 * 获取报价
 */
function getPrice(){
	$.ajax({
		url:"${basePath}/wap/index/price",
		type:"POST",
		dataType:"json",
		success:function(data){
			if(data.response=="success"){
				var price = data.historypriceList;
				if(price==null)return;
				$.each(price,function(n,hp){
					if (hp!=null && hp.type2 == 1) {//大票
			            var type1 = hp.type1;
			            var type6 = hp.type6;
			            var price = hp.price;
			            if (type6 == 2 && type1 == 1) {//大票电票国股
			                $(".nianlilv .guogu").html(price);
			            }else if (type6 == 2 && type1 == 2) {//大票电票城商
			                $(".nianlilv .chengshang").html(price);
			            }else if (type6 == 2 && type1 == 4) {//大票电票农商
			                $(".nianlilv .nongshang").html(price);
			            }
			        }else{//小票
			        	var type1 = hp.type1;
                        var type6 = hp.type6;
                        var type2 = hp.type2;
                        var price = hp.price;
			        	if (type2 == 4 && type6 == 2 && type1 == 1) {//50万以下电票国股
			                $(".yuelilv .guogu").html(price);
			            }else if (type2 == 4 && type6 == 2 && type1 == 2) {//50万以下电票城商
			                $(".yuelilv .chengshang").html(price);
			            }else if (type2 == 4 && type6 == 2 && type1 == 4) {//50万以下电票农商
			                $(".yuelilv .nongshang").html(price);
			            }
			        }
				});
			}
		}
	});
}

/**
 * 获取票据指数（_t）
 * @param 类型（一个月1、三个月3）
 */
function piaoju(months) {
	$.ajax({
		url: 'https://api.utiexian.com:8989/out/historyprice/chart',
		type: 'POST',
		dataType: 'json',
		data: {'months':months},
		success: function(data){
			if(data.data.response=="success")
			highcharts(data.data);
		}
	});
	
}

/**
 * 填充票据指数图表
 */
//票据指数
 function highcharts(obj) { 
 	var priceStr=String(obj.data.price);//原始字符串  
     var priceStrArr=priceStr.split(",");//分割成字符串数组  
     var priceIntArr=[];//保存转换后的整型字符串 
     priceStrArr.forEach(function(data,index,arr){  
     	priceIntArr.push(+data);  
     });  
     for(var i =0;i<priceIntArr.length;i++){
 		  if(priceIntArr[i] == 0){
 			priceIntArr[i] =null;
 		  }
 		}
     
     var price1Str=String(obj.data.price_1);//原始字符串  
     var price1StrArr=price1Str.split(",");//分割成字符串数组  
     var price1IntArr=[];//保存转换后的整型字符串 
     price1StrArr.forEach(function(data,index,arr){ 
     	price1IntArr.push(+data); 
     });
     for(var i =0;i<price1IntArr.length;i++){
 		  if(price1IntArr[i] == 0){
 			price1IntArr[i] =null;
 		  }
 		}
     
     var price2Str=String(obj.data.price_2);//原始字符串  
     var price2StrArr=price2Str.split(",");//分割成字符串数组  
     var price2IntArr=[];//保存转换后的整型字符串 
     price2StrArr.forEach(function(data,index,arr){  
     	price2IntArr.push(+data);  
     });
     /* price2IntArr=price2StrArr.map(function(data){
     	return +data;
    	}); */
     for(var i =0;i<price2IntArr.length;i++){
 		  if(price2IntArr[i] == 0){
 			price2IntArr[i] =null;
 		  }
 		}
 	
     $('#container').highcharts({
         chart: {
             zoomType: 'xy'
         },
         title: {
             text: '国股年利率/转贴现利率 (‰)'
         },
         xAxis: [{
         	categories: eval(obj.data.dates),
             crosshair: true,
             tickInterval: 0
         }],
         yAxis: [{
             title: {
                 text: ''
             },
             crosshair: true
         }],
         tooltip: {
             shared: true
         },
         credits : {
 			text : 'www.utiexian.com',
 			href : 'https://www.utiexian.com'
 		},
 		/*数据点设置*/
         plotOptions: {
             series: {
                 marker: {
                 	enabled: false, /*数据点是否显示*/
                 },
             }
         },
         legend: {
             align: 'left',
             x: 120,
             verticalAlign: 'top',
             y: 20,
             floating: true
         },
         series: [{
             name: '2016',
             type: 'spline',
             data: price2IntArr,
             tooltip: {
                 valueSuffix: '‰'
             },
             color:'#7790fe',
             lineWidth:0.5,
             connectNulls: true
         }, {
             name: '2017',
             type: 'spline',
             data: price1IntArr,
             tooltip: {
                 valueSuffix: '‰'
             },
             color:'#3ad45a',
             lineWidth:0.5,
             connectNulls: true
         }, {
             name: '2018',
             type: 'spline',
             data: priceIntArr,
             tooltip: {
                 valueSuffix: '‰'
             },
             color:'#d43c33',
             lineWidth: 2,
             connectNulls: true
         }]
     });
 }; 

$(".SETCHART").bind("click",function(){
	if($(this).hasClass("selectbar"))return;
	$(".SETCHART").removeClass("selectbar");
	$(this).addClass("selectbar");
	
	piaoju($(this).attr("data-type"));
});

var index;
var page = 'pagenavi2';
var as = document.getElementById(page).getElementsByTagName('a');
var mySwiper2 = new Swiper('.riliCon', {
	loop : false,
	onSlideChangeStart : function(swiper) {
		$("#rili" + swiper.activeIndex).parent().addClass("selectbar");
		for (var i = 0; i <= as.length; i++) {
			if (i != swiper.activeIndex) {
				$("#rili" + i).parent().removeClass();
			}
		}
	}
});
for (var i = 0; i <= as.length; i++) {
	(function() {
		var j = i;
		$('#rili' + j).click(function() {
			mySwiper2.slideTo(j, 500, false);

			for (var i = 0; i <= as.length; i++) {
				$("#rili" + i).parent().removeClass();
			}
			$("#rili" + j).parent().addClass("selectbar");
		});
	})();
}
</script>
[@main.footer/]
[/@main.body]