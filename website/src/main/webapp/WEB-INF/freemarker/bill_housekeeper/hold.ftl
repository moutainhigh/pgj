[#import "/common/main.ftl" as main]
[#include "/common/setting.ftl"]
[@main.body title='票管家-票据管理']
[@main.header currentmenu='1' topindex='4'/]
<script type="text/javascript" src="https://static.utiexian.com/plugins/highcharts/highcharts.js"></script>
<script type="text/javascript" src="https://static.utiexian.com/plugins/highcharts/modules/exporting.js"></script>
<script type="text/javascript" src="https://static.utiexian.com/plugins/data/laydate.js"></script>

<div class="w1200 bc">
    <!-- 票据管理菜单 -->
    <div class="w clearfix tc c3366cc mt20 f12">
        <!-- 新增票据 -->
        <div class="bcwhite box-sizing box-shadow w110 h60 fl pt10 cp" id="addBill">
            <img src="https://img.utiexian.com/website/manage/add.png" alt="新增票据">
            <p>新增票据</p>
        </div>
        <!-- 批量导入票据 -->
        <div class="bcwhite box-sizing box-shadow w110 h60 fl ml20 pt10 cp" id="addAllBill">
            <img src="https://img.utiexian.com/website/manage/add.png" alt="批量导入票据">
            <p>批量导入票据</p>
        </div>
        <!-- 票据提醒 -->
        <div class="bcwhite box-sizing box-shadow w110 h60 fl ml20 pt10 cp">
            <a href="${basePath}/zhangbu/main"><img src="https://img.utiexian.com/website/manage/tixing.png" alt="票据提醒"></a>
            <p><a href="${basePath}/zhangbu/main">票据提醒</a></p>
        </div>
    </div>
    <!-- 票据管理菜单 end -->

    <!-- 到期日期提醒 -->
    <div class="w mt20 bcwhite box-shadow box-sizing pl20 pt20 pr20 pb20" id="endDates">
        <div class="f16 lh20">
            <div class="bl3_d43c33 pl14">到期日提醒</div>
            <p class="f16 c636262 mt10">以下票据即将到期：</p>
        </div>

        <!-- 列表 -->
        <div class="box-sizing bte0e0e0 ble0e0e0 bre0e0e0 tc mt20">
            <div class="h60 lh60 bcf9f9f9 f14 c717583 clearfix bbe0e0e0 box-sizing">
                <div class="fl w290 bre0e0e0 box-sizing">承兑行</div>
                <div class="fl w138 bre0e0e0 box-sizing">票面金额（元）</div>
                <div class="fl w130 bre0e0e0 box-sizing">到期日</div>
                <div class="fl w460 bre0e0e0 box-sizing">来票公司</div>
                <div class="fl w140">票据提醒</div>
            </div>
            <ul id="endDatesList"></ul>
        </div>
    </div>
    <!-- 到期日期提醒 end -->
    <!-- 分页 -->
    <div class="oh tc">
        <div class="clearfix" id="pager"></div>
    </div>
</div>

<!--弹窗-->
<div class="w h pf bc05 zi10 top" style="display: none" id="maskWindow">
    <div class="bc w590 bcwhite bae0e0e0 br3 box-sizing pb20 mt170">
        <div class="w h57 lh57 box-sizing pl20 pr20 bbe0e0e0 clearfix">
            <!--弹窗名称-->
            <div class="fl" id="windowTitle"></div>
            <!--关闭按钮-->
            <label for="closeIcon" class="fr cp mt20 dsb" id="closeBtn">
                <img src="https://img.utiexian.com/website/PJGJ/authentication/closeIcon.png" alt="关闭">
                <button id="closeIcon" class="oln none"></button>
            </label>
        </div>
        [@main.popup/]
    </div>
</div>
<script type="text/javascript" src="${pluPath}/data/laydate.js"></script>
<script type="text/javascript" src="${comPath}/handlebars.js"></script>
<script type="text/javascript" src="${pluPath}/ajaxPager/jquery-ajax-pager.js"></script>
<script type="text/javascript" src="${pluPath}/ajaxPager/js-extend.js"></script>
<script type="text/x-handlebars-template" id="HOLD">
{{#each list}}
	<li class="pr bbe0e0e0 box-sizing">
		<div class="pa top left z12 w44 h44">
			<img src="https://img.utiexian.com/website/180606/shangdian.png" class="{{toDraftType draftType 1}}" width="44" height="44" alt="商票电票">
			<img src="https://img.utiexian.com/website/180606/shangzhi.png" class="{{toDraftType draftType 2}}" width="44" height="44" alt="商票纸票">
			<img src="https://img.utiexian.com/website/180606/yindian.png" class="{{toDraftType draftType 3}}" width="44" height="44" alt="银票电票">
			<img src="https://img.utiexian.com/website/180606/yinzhi.png" class="{{toDraftType draftType 4}}" width="44" height="44" alt="银票纸票">
		</div>
		<div class="clearfix f15 h86 lh86">
			<div class="fl w290 bre0e0e0 box-sizing pl35 pr10 pt20 pb15 h">
				<span class="lh24 text-line2">{{bank}}</span>
			</div>
			<div class="fl w138 bre0e0e0 box-sizing">{{toAllmoney allmoney}}</div>
			<div class="fl w130 bre0e0e0 box-sizing">{{formatDate expiryDate}}</div>
			<div class="fl w460 bre0e0e0 box-sizing pl35 pr10 pt20 pb15 h">
				<span class="lh24 text-line2">{{draftFrom}}</span>
			</div>
			<div class="fl w140">{{formatDate noticeDate}}</div>
		</div>
	</li>
{{/each}}
</script>
<script>
/**
* 票据图标（订单类型：银纸、银电、商纸、商电）
*/
Handlebars.registerHelper('toDraftType', function(draftType,num, options) {
	if(draftType == "YZ"){
		if(num != 4){
			return "none";
		}
	}else if(draftType == "YD"){
		if(num != 3){
			return "none";
		}
	}else if(draftType == "SZ"){
		if(num != 2){
			return "none";
		}
	}else if(draftType == "SD"){
		if(num != 1){
			return "none";
		}
	}
});

/**
* 时间格式化
*/
Handlebars.registerHelper('formatDate', function(num, options) {
    if(num!=null){
        num = num.replace(/-/g, "/");
        var d = new Date(num);
        return d.format('yyyy-MM-dd');
    }else{
        return "--";
    }
});

/**
*金额格式化
*/
Handlebars.registerHelper('toAllmoney', function(allmoney, options) {
    return fmoney(allmoney,2);
});

var memberId = '${member.id}';
$(document).ready(function() {
	loadDate();
});

/* 关闭弹窗 */
$("#closeBtn , .closeBtn").on("click",function(){
    $("#windowTitle").html("");
    $("#maskWindow").hide();
    $("#addWindow").hide();
    $("#addAllWindow").hide();
});

/**
 * 加载票据提醒 （到期日）
 */
function loadDate(){
	var data = {memberId:memberId,recordType:"HOLD"};
	$("#pager").sjAjaxPager({
        url: "${bootAppPath}/draftrecord/page/notice",
        pageSize:10,
        myTotalType:"BOOT",
        searchParam: data,
        beforeSend: function () {
        	
        },success: function (data) {
       		var source = $("#HOLD").html();
            var template = Handlebars.compile(source);
            var html = template(data.data.data);
            $("#endDatesList").html(html);
        },complete: function(){
        }
    });
};

//贴现日期
var add_start = {
    elem : '#add_tiexianDate',
    format : 'YYYY-MM-DD',
    //min: laydate.now(), //设定最小日期为当前日期
    min : '1900-01-01', //设定最小日期
    max : '2099-06-16', //最大日期
    istoday : false,
    choose : function(datas) {
        add_end.min = datas; //开始日选好后，重置结束日的最小日期
        add_end.start = datas //将结束日的初始值设定为开始日
    }
};

//到期日期
var add_end = {
    elem : '#add_endDate',
    format : 'YYYY-MM-DD',
    min : laydate.now(),
    max : '2099-06-16',
    istoday : false,
    choose : function(datas) {
        add_start.max = datas; //结束日选好后，充值开始日的最大日期
        $("#add_endDate").val(datas);
        updateEndDate();
    }
};

var add_inData = {
    elem : '#add_inData',
    format : 'YYYY-MM-DD',
    //min: laydate.now(), //设定最小日期为当前日期
    min : '1900-01-01', //设定最小日期
    max : '2099-06-16', //最大日期
    istoday : false,
    choose : function(datas) {
        end.min = datas; //开始日选好后，重置结束日的最小日期
        $("#add_inData").val(datas); //将结束日的初始值设定为开始日
    }
};
	
var noticedate = {
    elem : '#add_noticeDate',
    format : 'YYYY-MM-DD',
    //min: laydate.now(), //设定最小日期为当前日期
    min : '1900-01-01', //设定最小日期
    max : '2099-06-16', //最大日期
    istoday : false,
    choose : function(datas) {
        end.min = datas; //开始日选好后，重置结束日的最小日期
        $("#add_noticeDate").val(datas); //将结束日的初始值设定为开始日
    }
};

//票据质押的时间
var add_Out_Date = {
	elem : '#add_Out_Date',
	format : 'YYYY-MM-DD',
	//min: laydate.now(), //设定最小日期为当前日期
	min : '1900-01-01', //设定最小日期
	max : '2099-06-16', //最大日期
	istoday : false,
	choose : function(datas) {
	   
	}
};

//票据赎回时间
var add_In_Date = {
	elem : '#add_In_Date',
	format : 'YYYY-MM-DD',
	//min: laydate.now(), //设定最小日期为当前日期
	min : '1900-01-01', //设定最小日期
	max : '2099-06-16', //最大日期
	istoday : false,
	choose : function(datas) {
	   
	}
};

laydate(add_start);
laydate(add_end);
laydate(add_inData);
laydate(add_Out_Date);
laydate(add_In_Date);
laydate(noticedate);
</script>
[@main.footer/]
[/@main.body]