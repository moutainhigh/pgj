[#import "/common/main.ftl" as main]
[#include "/common/setting.ftl"]
[#include "/common/data.ftl" ]
[@main.body head=seoMap.piaoju2]
<link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/help.css"/>
[@main.header currentmenu='1'/]

<!--如何接单-->
<div class="w1200 bc ha pb20 bcwhite bae0e0e0 mb20">
	[@main.secondaryheader topindex="2"/]
    <!--左菜单-->
    [@main.left remark='4' leftindex='7' leftindex1='6'/]
    <!--右侧内容 -->
    <div class="fl w997 pb20 bcwhite bae0e0e0" style="min-height:700px;">
        <div class="w997 h34 lh34 f14 bcfaf7f7">
            <div class="fl ml10"> 如何接单</div>
        </div>
        <div class="wa ha">
            <img alt="" src="${image_url}/website/help/piaojuxuyuan/shoupiao/offer1.jpg" width="900" height="718" class="mt25 bc dsb">
            <img alt="" src="${image_url}/website/help/piaojuxuyuan/shoupiao/offer2.jpg" width="900" height="503" class="mt25 bc dsb">
            <img alt="" src="${image_url}/website/help/piaojuxuyuan/shoupiao/offer3.jpg" width="900" height="613" class="mt25 bc dsb">
        </div>
    </div>
    <div class="cb"></div>
</div>
[@main.right /]
<script type="text/javascript">
</script>
<!--foot-->
[@main.footer/]
[/@main.body]