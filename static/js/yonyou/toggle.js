$(document).ready(function() {
    /*收缩列表*/
    $(".toggleTop").toggle(function(){
        console.log("1");
        $(this).children("img").attr("src", "https://img.utiexian.com/yonyou/authentication/up.png");
        $(this).next(".toggleCon").slideUp(100);

    },function(){
        console.log("2");
        $(this).children("img").attr("src", "https://img.utiexian.com/yonyou/authentication/down.png");
        $(this).next(".toggleCon").slideDown(100);
    });
});