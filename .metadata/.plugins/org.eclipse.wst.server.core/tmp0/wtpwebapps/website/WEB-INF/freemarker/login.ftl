[#import "/common/main.ftl" as main]
[#include "/common/setting.ftl"]
[@main.body title='票管家-登录']
<link rel="stylesheet" type="text/css" href="https://static.utiexian.com/css/website/login.css"/>
[@main.header currentmenu='1' topindex="0"/]

<!--登录-->
<div class="w1200 bc bcwhite f16 mb20">
    <!--登录-->
    <div class="w599 fl f24">
        <!--表头-->
        <div class="w600 h68 fl LGtop">
            <i class="w40 h34 iconLogin fl ml225 mt17 mr15"></i>
            <p class="fl c778ffd lh35 mt17">用户登录</p>
        </div>
        <div class="cb"></div>
        <!-- 登录tab表单 -->
        <div class="bc w460 h508 pr pr69 mt10 ml70 bre0e0e0">
            <!-- tab标签切换-->
            <div class="h35 bbe0e0e0 pr">
                <div class="h35 pa b0 f16 left" id="switch">
                    <a class="w226 tc cd43c33 dsib h35 lh35 oln switch_btn_focus" id="login1" href="javascript:void(0);" tabindex="7">快速登录</a>
                    <a class="w226 tc c2d2d2d dsib h35 lh35 oln switch_btn" id="login2" href="javascript:void(0);" tabindex="8">密码登录</a>
                    <div class="pa w230 b-2 bbd43c33" id="switch_bottom" ></div>
                </div>
            </div>
            <div class="pr oh" id="login1Div">
                <!--快速登录-->
                <div class="w460 pr" id="web_login">
                    <div class="login-box">
                        <div class="w460 bc">
                            <form name="loginform" accept-charset="utf-8" id="login_form" class="w460" method="post">
                                <input type="hidden" name="did" value="0"/>
                                <input type="hidden" name="to" value="log"/>
                                <div class="pr h45 f14 lh44 mt30 zi10">
                                    <label class="fl w110 h44 dsb lh45 mr10 tr" for="phone1">手机号</label>
                                    <input type="text" id="phone1" name="mobile" class="fl w250 h44 bae0e0e0 br3 ti15 validate[custom[phone]]" placeholder="请输入您的手机号"/>
                                </div>
                                <div class="pr h45 f14 lh44 mt30 zi10">
                                    <label class="fl w110 h44 dsb lh45 mr10 tr" for="imgCode1">图形验证码</label>
                                    <input type="text" id="imgCode1" name="imgCode" class="fl w120 h44 bae0e0e0 br3 ti15 validate[required]" placeholder="验证码"/>
                                    <img id="dlimg" class="fl w120 h44 bae0e0e0 br3 ml10" src="${basePath}/member/image"/>
                                    <a href="#" class="f14 c3366cc lh45 ml10 blue" onclick="change();">换一个</a>
                                </div>
                                <div class="pr h45 f14 lh44 mt30 zi10">
                                    <label class="fl w110 h44 dsb lh45 mr10 tr" for="phoneCode1">手机验证码</label>
                                    <input type="text" id="phoneCode1" name="code" class="fl w120 h44 bae0e0e0 br3 ti15 validate[required]" placeholder="手机验证码"/>
                                    <input type="button" id="phoneBtn1" class="fl w120 h44 bcf2f2f2 c727272 bae0e0e0 br3 ml10 cp" value="获取验证码" onClick="yanzheng()">
                                </div>
                                <div class="f12 mt30 ml40">
                                    <input type="checkbox" name="YHXY1" id="YHXY1" class="fl w13 h13 checkbox1 mr10" checked="checked">
                                    <label for="YHXY1" class="cblack fl">我已阅读并同意<a href="javascript:void(0)" class="cd43c33" onclick="tan()">《票管家用户协议》</a>和<a href="javascript:void(0)" class="cd43c33" onclick="tan1()">《票管家社区协议》</a></label>
                                </div>
                                <input type="hidden" id="redirect_url1" name="redirect_url" value="${redirect_url}" data-remark="这是登录前url标示">
                                <input type="button" value="登录" class="w246 h44 bce84c3d b0 br3 cwhite f16 lh45 tc bc mt30 ml107 cp" onclick="quicklogin()"/>
                            </form>
                        </div>
                    </div>
                </div>
                <!--登录end-->
            </div>
            <!--密码登录-->
            <div class="none" id="login2Div">
                <div class="web_login">
                    <form name="form2" id="regUser" accept-charset="utf-8"  method="post">
                    <input type="hidden" name="to" value="reg"/>
                    <input type="hidden" name="did" value="0"/>
                    <div class="pr h45 f14 lh44 mt30 zi10">
                        <label class="fl w110 h44 dsb lh45 mr10 tr" for="phone2">手机号</label>
                        <input type="text" id="phone2" name="mobile" class="fl w250 h44 bae0e0e0 br3 ti15 validate[custom[phone]]" placeholder="请输入您的手机号"/>
                    </div>
                    <div class="pr h45 f14 lh44 mt30 zi10">
                        <label class="fl w110 h44 dsb lh45 mr10 tr" for="password1">密码</label>
                        <input type="password" id="password1" name="pwd" class="fl w250 h44 bae0e0e0 br3 ti15 validate[required]" placeholder="请输入您的密码"/>
                    </div>
                    <div class="cb"></div>
                    	<a href="${basePath}/member/forgetpwd" class="fr f12 cd43c33 mt10 mr89">忘记密码？</a>
                    <div class="cb"></div>
                    <div class="f12 mt30 ml80">
                    	<span>密码保存 ：</span>
                        <label for="sessionDay" class="cblack dsib"><input type="radio" name="sessionTime" id="sessionDay" class="w12 h12 radio2 mr5" value="1">一天</label>
                        
                        <label for="sessionWeek" class="cblack dsib ml20"><input type="radio" name="sessionTime" id="sessionWeek" class="w12 h12 radio2 mr5" value="7">一周</label>
                        
                        <label for="sessionMouth" class="cblack dsib ml20"><input type="radio" name="sessionTime" id="sessionMouth" class="w12 h12 radio2 mr5" value="30">一月</label>
                    </div>
                    
                    <div class="f12 mt30 ml80">
                        <input type="checkbox" name="YHXY2" id="YHXY2" class="fl w14 h14 checkbox1 mr10" checked="checked">
                        <label for="YHXY2" class="cblack fl">我已阅读并同意<a href="javascript:void(0)" class="cd43c33" onclick="tan()">《票管家用户协议》</a>和<a href="javascript:void(0)" class="cd43c33" onclick="tan1()">《票管家社区协议》</a></label>
                    	<div class="cb"></div>
                    </div>
                    <input type="hidden" id="redirect_url" name="redirect_url" value="${redirect_url}" data-remark="这是登录前url标示">
                    <input type="button" id="login1" value="登录" class="w246 h44 bce84c3d b0 br3 cwhite f16 lh45 tc bc mt30 ml107 cp" onclick="login()"/>
                    </form>
                </div>
            </div>
            <!--密码登录end-->
        </div>
    </div>
    <!--注册-->
    <div class="w_50 fl f24 pb30">
        <!--表头-->
        <div class="w600 h68 fl LGtop">
            <i class="w40 h34 iconRegister fl ml212 mr15 mt17"></i>
            <p class="fl lh35 mt17 c778ffd">用户注册</p>
        </div>
        <div class="cb"></div>
        <div class="w460 ml70">
        	<form action="" id="register" method="post">
            <div class="pr h45 f14 lh44 mt30 zi10">
                <label class="fl w110 h44 dsb lh45 mr10 tr" for="phone3">手机号</label>
                <input type="text" id="phone3" name="phone3" class="fl w250 h44 bae0e0e0 br3 ti15 validate[custom[phone]]" placeholder="请输入您的手机号"/>
            </div>
            <div class="pr h45 f14 lh44 mt30 zi10">
                <label class="fl w110 h44 dsb lh45 mr10 tr" for="password2">设置密码</label>
                <input type="password" id="password2" name="password2" maxlength="11" class="fl w250 h44 bae0e0e0 br3 ti15 validate[required,custom[pwd]]" placeholder="请设置您的密码"/>
            </div>
            <div class="pr h45 f14 lh44 mt30 zi10">
                <label class="fl w110 h44 dsb lh45 mr10 tr" for="imgCode2">图形验证码</label>
                <input type="text" id="imgCode2" name="imgCode2" class="fl w120 h44 bae0e0e0 br3 ti15  validate[required]" placeholder="验证码"/>
                <img id="dlimg1" class="fl w120 h44 bae0e0e0 br3 ml10" src="${basePath}/member/image1"/>
                <a href="#" class="f14 c3366cc lh45 ml10 blue" onclick="change1();">换一个</a>
            </div>
            <div class="pr h45 f14 lh44 mt30 zi10">
                <label class="fl w110 h44 dsb lh45 mr10 tr" for="phoneCode2">手机验证码</label>
                <input type="text" id="phoneCode2" name="phoneCode2" class="fl w120 h44 bae0e0e0 br3 ti15 validate[required]" placeholder="手机验证码"/>
                <input type="button" id="phoneBtn2" class="fl w120 h44 bcf2f2f2 c727272 bae0e0e0 br3 ml10 cp" value="获取验证码" onClick="yanzheng1()">
            </div>
            <div class="pr h45 f14 lh44 mt30 zi10">
                <label class="fl w110 h44 dsb lh45 mr10 tr" for="invite">邀请码</label>
                <input type="text" id="invite" name="invite" class="fl w250 h44 bae0e0e0 br3 ti15 validate[custom[inviteNum]]" placeholder="请输入邀请码"/>
            </div>
            <div class="f12 mt30 ml120">
                <input type="checkbox" name="YHXY2" id="YHXY3" class="fl w14 h14 checkbox1 mr10" checked="checked">
                <label for="YHXY3" class="cblack fl">我已阅读并同意<a href="javascript:void(0)" class="cd43c33" onclick="tan()">《票管家用户协议》</a>和<a href="javascript:void(0)" class="cd43c33" onclick="tan1()">《票管家社区协议》</a></label>
            </div>
            <input type="button" id="zhuce" value="注册" class="w246 h44 bce84c3d b0 br3 cwhite f16 lh45 tc bc mt30 ml107 cp" onclick="reg(this);"/>
        	</form>
        </div>
    </div>
    <div class="cb"></div>
</div>
[@main.right /]
<!--用户协议弹窗-->
<div class="w h pf bc05 zi190 top none" id="xieyi">
    <div class="w758 h608 bcfc4d42 br5 mt_5 l_50 ml-385 pr zi190">
        <!--关闭按钮-->
        <div class="w37 h37 pa t-15 r-15 zi200 redClose cp" id="redClose"></div>
        <div class="w750 h600 pr t4 l4 bcf5f5f5 zi190">
        	<div class="wa h600 oya bc mt20 pl30 pr30 bcwhite c595959 f16 lh26">
			    <h1 class="f24 lh24 fb tc c2d2d2d mb30 mt30">票管家用户注册协议</h1>
			    <p class="ti32">欢迎使用上海票管家金融服务有限公司（以下简称“票管家金融”，网址为：https://www.utiexian.com）提供的各项金融信息服务，在使用票管家金融各项服务前，请您务必仔细阅读并透彻理解《票管家用户注册协议》（“本协议”）内容。您通过票管家金融网址在注册成功后，您有权作为票管家金融用户通过票管家金融平台使用票管家金融服务，您使用票管家金融服务的一切行为将被视为对本协议以下全部内容的认可。</p>
				<h2 class="f18 fb c2d2d2d mt16">一、服务内容</h2>
				<p class="ti32">1.1票管家金融平台是专业的金融信息服务平台，平台根据实际情况，提供包括但不限于票据资讯、票据贴现（应收款转让）、票据融资咨询、银行不良资产处置、接受委托聘请相关银行为用户办理票据检验等金融信息服务。</p>
				<p class="ti32">1.2票管家金融提供的所有金融信息服务内容均出于传递更多信息之目的并不反映任何票管家金融之意见及观点。 </p>
				<p class="ti32">1.3任何通过票管家金融平台发布的票据资讯、产品及服务，并不意味着票管家金融赞同其观点或证实其内容的真实性，票管家金融不负任何审查或核实义务，亦不承担任何法律责任。据此进行各项业务的，产生的风险由买卖双方自行承担，用户无权据此向票管家金融提出任何法律主张。用户双方在完成后续业务过程中发生的纠纷，由纠纷各方自行解决，票管家金融不承担任何责任。</p>
				<p class="ti32">1.4票管家金融接受用户委托，代理用户向已与票管家金融建立合作关系的银行机构办理票据检验服务。票管家金融不对前述银行机构的服务提供任何形式的担保。票管家金融不对银行机构票据检验服务的真实性、充分性、可靠性、准确性、完整性和有效性提供担保，并且无需承担任何由此引起的一切法律责任。</p>
				<p class="ti32">特别说明，票管家金融接受银行机构委托以票管家金融名义向用户开具发票，并代为向用户收取票据检验服务费，该等费用为【30】元/笔（含税）。</p>
				<p class="ti32">1.5用户通过票管家金融平台线上服务系统办理票据应收款转让业务的，用户应与已与票管家金融建立合作关系的合作机构签署相关服务合同。票管家金融不对有关合作机构票据流转见证、资金代管、票据资产或资金渠道信息管理等服务的真实性、充分性、可靠性、准确性、完整性和有效性提供担保，并且无需承担任何由此引起的一切法律责任。</p>
				<p class="ti32">1.56因使用票管家金融提供的信息服务而引致之任何意外、违约、亏损、侵权等及其所造成的各种损失（包括但不限于因下载而感染电脑病毒等），票管家金融概不负责，亦不承担任何法律责任。</p>
				<p class="ti32">1.76票管家金融保留根据实际情况随时调整票管家金融提供服务种类、内容、形式的权利。票管家金融不承担因业务调整给用户造成的任何损失。票管家金融保留变更、中断或终止部分或全部信息服务的权利。</p>
				<p class="ti32">1.87任何单位或个人认为票管家金融的服务内容可能涉嫌侵犯其合法权益，应该及时向票管家金融提出书面权利通知，并提供身份证明、权属证明、具体链接(URL)及详细侵权情况证明。票管家金融在收到上述法律文件后，将会依法尽快移除相关涉嫌侵权的内容。</p>
				<h2 class="f18 fb c2d2d2d mt16">二、知识产权声明</h2>
				<p class="ti32">2.1票管家金融拥有网站内所有信息内容（除新闻热点外）的版权。任何被授权的浏览、复制、打印和传播属于票管家金融网站内信息内容都不得用于商业目的且所有信息内容及其任何部分的使用都必须包括此声明。</p>
				<p class="ti32">2.2票管家金融所有的产品、技术的知识产权均属于票管家金融。未经票管家金融许可，任何人不得擅自（包括但不限于以非法的方式复制、传播、展示、镜像、上传、下载）使用。否则，票管家金融将依法追究法律责任。</p>
				<h2 class="f18 fb c2d2d2d mt16">三、隐私权政策</h2>
				<p class="ti32">3.1票管家金融尊重并保护所有使用票管家金融服务的用户的隐私权。为了给您提供更准确、更有个性化的服务，票管家金融会按照本隐私权政策的规定使用和披露用户信息。但票管家金融将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得用户事先许可的情况下，票管家金融不会将这些信息对外披露或向第三方提供。票管家金融会不时更新本隐私权政策。票管家金融用户在票管家金融平台注册成功之时，即视为已经同意本隐私权政策全部内容。本隐私权政策属于票管家金融用户注册本协议不可分割的一部分。</p>
				<p class="ti32">3.2用户访问票管家金融网站时，票管家金融自动接收并记录的浏览器和计算机上的信息，包括但不限于IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及用户需求的网页记录等数据。</p>
				<p class="ti32">3.3票管家金融不会向任何无关第三方提供、出售、出租、分享或交易用户信息，除非事先得到用户的许可，或该第三方和票管家金融单独或共同为用户提供服务，且在该服务结束后，该等第三方将被禁止访问包括其以前能够访问的所有相关资料。</p>
				<p class="ti32">3.4票管家金融亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播用户信息。</p>
				<p class="ti32">3.5为服务用户的目的，票管家金融可能通过使用用户信息，向注册用户提供感兴趣的信息，包括但不限于向注册用户发出产品和服务信息，或者与票管家金融合作伙伴共享信息以便他们向注册用户发送有关其产品和服务的信息（后者需要注册用户事先同意）。</p>
				<p class="ti32">3.6在如下情况下，票管家金融将依据用户意愿或法律的规定全部或部分的披露用户相关信息：</p>
				<p class="ti32">（1）经用户事先同意，向第三方披露。</p>
				<p class="ti32">（2）如用户是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷。</p>
				<p class="ti32">（3）根据法律的有关规定，或者行政或司法机关的要求，向第三方或者行政、司法机关披露。</p>
				<p class="ti32">（4）如用户出现违反中国有关法律、法规或者本协议或相关规则的情况，需要向第三方披露。</p>
				<p class="ti32">（5）为提供用户所要求的产品和服务，而必须和第三方分享用户相关信息。</p>
				<p class="ti32">（6）其它他票管家金融根据法律、法规或者网站政策认为合适的披露。</p>
				<h2 class="f18 fb c2d2d2d mt16">四、服务变更、中断或终止</h2>
				<p class="ti32">4.1如因系统维护或升级的需要而需暂停网络服务、服务功能的调整，票管家金融将尽可能在网站上进行通告。票管家未进行通告，或者由于用户未能及时浏览通告信息而造成的损失，票管家金融不承担任何责任。</p>
				<p class="ti32">4.2用户同意，票管家金融可自行决定变更提供服务的内容，票管家金融可自行决定授权第三方向用户提供原本由票管家金融提供的服务，不需向用户承担任何因变更服务所产生的任何责任。</p>
				<p class="ti32">4.3如发生下列任何一种情形，票管家金融有权单方面中断或终止向用户提供服务而无需通知用户，无需对用户或第三方承担任何责任：</p>
				<p class="ti32">（1）用户提供的资料信息不真实。</p>
				<p class="ti32">（2）用户违反本服协议中规定的各类规则及精神务条款。</p>
				<p class="ti32">（3）未经票管家金融同意，将票管家金融网站用于商业目的。</p>
				<h2 class="f18 fb c2d2d2d mt16">五、账号安全及管理</h2>
				<p class="ti32">用户了解并同意，确保用户账号及密码的机密安全是用户的责任。用户将对利用该用户账号及密码所进行的一切行动及言论，负完全的责任，并同意以下事项：</p>
				<p class="ti32">5.1用户不对其他任何人泄露账号或密码，亦不可使用其他任何人的账号或密码。因黑客、病毒或用户的保管疏忽等非票管家金融原因导致用户的账号遭他人非法使用的，票管家金融不承担任何责任。</p>
				<p class="ti32">5.2票管家金融通过用户账号及密码来识别用户的指令。用户确认，使用用户账号和密码登录后在票管家金融的一切行为均代表用户。用户账号操作所产生的电子信息记录均为用户行为的有效凭据，并由用户本人承担由此产生的全部责任。</p>
				<p class="ti32">5.3冒用他人账号及密码的，票管家金融及其合法授权主体保留追究实际使用人连带责任的权利。</p>
				<p class="ti32">5.4用户应根据票管家金融的相关规则以及票管家金融的相关提示创建安全密码，应避免选择过于明显的单词或日期，比如用户的姓名、昵称或者生日等。</p>
				<p class="ti32">5.5用户如发现有第三人冒用或盗用用户账号及密码，或其他任何未经合法授权的情形，应立即以有效方式通知票管家金融，要求票管家金融暂停相关服务，否则由此产生的一切责任由用户承担。同时，用户理解票管家金融对用户的请求采取行动需要合理期限，在此之前，票管家金融对第三人使用该服务所导致的损失不承担任何责任。</p>
				<p class="ti32">5.6 用户决定不再使用用户账号时，应首先清偿所有应付款项（包括但不限于合同金额、违约金、服务费、管理费等），再将用户账号中的可用款项（如有）全部取现或者向票管家金融发出其它他合法的支付指令，并向票管家金融申请注销该用户账号，经票管家金融审核同意后可正式注销用户账号。</p>
				<p class="ti32">5.7 用户死亡或被宣告死亡的，其在本协议项下的各项权利义务由其继承人承担。若用户丧失全部或部分民事权利能力或民事行为能力，票管家金融或其授权的主体有权根据有效法律文书（包括但不限于生效的法院判决等）或其法定监护人的指示处置与用户账号相关的款项。</p>
				<p class="ti32">5.8票管家金融有权基于单方独立判断，在其认为可能发生危害平台业务安全等情形时，不经通知而先行暂停、中断或终止向用户提供本协议项下的全部或部分用户服务（包括收费服务），并将注册资料移除或删除，且无需对用户或任何第三方承担任何责任。前述情形包括但不限于：</p>
				<p class="ti32">（1）票管家金融认为用户提供的资料信息不具有真实性、有效性或完整性；</p>
				<p class="ti32">（2）票管家金融发现异常行为或有疑义或有违法之虞时；</p>
				<p class="ti32">（3）票管家金融认为用户账号涉嫌洗钱、套现、传销、被冒用或其他票管家金融认为有风险之情形；</p>
				<p class="ti32">（4）票管家金融认为用户已经违反本协议中规定的各类规则及精神；</p>
				<p class="ti32">（5）用户在使用票管家金融收费服务时（如有）未按规定向票管家金融或第三方合作机构支付相应的服务费用；</p>
				<p class="ti32">（6）用户账号已连续三年内未实际使用且账号中余额为零；</p>
				<p class="ti32">（7）票管家金融基于平台业务安全等原因，根据其单独判断需先行暂停、中断或终止向用户提供本协议项下的全部或部分用户服务（包括收费服务），并将注册资料移除或删除的其他情形。</p>
				<p class="ti32">5.9用户同意在必要时，票管家金融无需进行事先通知即有权终止提供用户账号服务，并可能立即暂停、关闭或删除用户账号及该用户账号中所有相关资料及档案。</p>
				<p class="ti32">5.10用户同意，用户账号的暂停、中断或终止不代表用户责任的终止，用户仍应对使用票管家金融服务期间的行为承担可能的违约或损害赔偿责任，同时票管家金融仍可保有用户的相关信息。</p>
				<h2 class="f18 fb c2d2d2d mt16">六、履约担保金</h2>
				<p class="ti32">6.1履约担保金指用户（票管家金融平台票据持有人及机构端客户）进行票据贴现（应收款转让）业务前，根据本协议约定缴存并在一方用户违约未完成票据贴现（应收款转让）业务时用于对另一方用户进行赔付的履约担保资金。</p>
				<p class="ti32">6.2授权：用户应根据本协议有关条款之约定缴存履约担保金至履约保证金专用账户，并授权票管家金融可根据本协议之条款约定使用、处置履约担保金，除用户终止在票管家金融所有经营活动并履行完毕注销账户全部程序外，上述授权不可撤销。</p>
				<p class="ti32">6.3履约保证金金额：用户应当缴纳的履约保证金为该笔业务订单所规定的金额，具体金额需以每笔订单为准。</p>
				<p class="ti32">6.4履约保证金专用账户：指票管家金融为本协议约定的履约担保金之专项用途专门开立的账户。履约保证金专用账户信息如下：【支付宝：ryfinance@ryfinance.com】</p>
				<p class="ti32">6.5履约担保金的使用：当任一方用户认为另一方用户在票据贴现（应收款转让）业务中出现违约行为发生时，在该方用户的申请下，票管家金融以普通或非专业人员的知识水平标准，对该笔票据贴现（应收款转让）业务进行表面审核后，以其独立判断用户未履行/未全面履行相应义务的，则票管家金融有权以该违约用户所缴纳的履约保证金对应金额对守约方进行违约赔付，将该等履约保证金直接划付至另一方用户账户，并以书面方式（包括但不限于电子邮件、传真等）通知双方用户，说明赔付原因及金额。 除上述目的外，票管家金融不可以任何方式动用履约保证金专用账户内的资金。</p>
				<p class="ti32">6.4履约保证金的返还：该笔票据贴现（应收款转让）业务结束后，双方用户均无违约行为，票管家金融将在业务完成后【5】个工作日内按原支付渠道将履约保证金退回用户。</p>
				<p class="ti32">6.5声明：履约保证金仅作为促使票据贴现（应收款转让）业务进行和保障双方用户权益的附加性增值服务，不视为票管家金融对票据贴现（应收款转让）业务负有任何审查、担保等义务，票管家金融对该服务所引起的任何纠纷，不承担任何法律责任；此外，非因票管家金融故意，如票管家金融在票据贴现（应收款转让）业务过程中错误判断一方用户在票据贴现（应收款转让）业务中出现了违约行为，并据此向另一方用户划付了该方用户的履约保证金的，票管家金融仅需纠正该等错误行为，无需就此向该方用户承担任何违约及/或赔偿责任。</p>
				<h2 class="f18 fb c2d2d2d mt16">七、用户的守法义务及承诺</h2>
				<p class="ti32">7.1用户承诺绝不为任何非法目的或以任何非法方式使用票管家金融服务，并承诺遵守中国相关法律、法规及一切使用互联网之国际惯例，遵守所有与票管家金融服务有关的网络协议、规则和程序。</p>
				<p class="ti32">7.2用户同意并保证不得利用票管家金融服务从事侵害他人权益或违法之行为，若有违反者应负所有法律责任。上述行为包括但不限于：</p>
				<p class="ti32">（1）反对宪法所确定的基本原则，危害国家安全、泄漏国家秘密、颠覆国家政权、破坏国家统一的。</p>
				<p class="ti32">（2）侵害他人名誉、隐私权、商业秘密、商标权、著作权、专利权、其他知识产权及其他权益。</p>
				<p class="ti32">（3）违反依法律或合约所应负之保密义务。</p>
				<p class="ti32">（4）冒用他人名义使用票管家金融服务。</p>
				<p class="ti32">（5）从事任何不法交易行为，如贩卖枪支、毒品、禁药、盗版软件或其他违禁物。</p>
				<p class="ti32">（6）提供赌博资讯或以任何方式引诱他人参与赌博。</p>
				<p class="ti32">（7）涉嫌洗钱、套现或进行传销活动的。</p>
				<p class="ti32">（8）从事任何可能含有电脑病毒或是可能侵害票管家金融服务系統、资料等行为。</p>
				<p class="ti32">（9）利用票管家金融服务系统进行可能对互联网或移动网正常运转造成不利影响之行为。</p>
				<p class="ti32">（10）侵犯票管家金融的商业利益，包括但不限于发布非经票管家金融许可的商业广告。</p>
				<p class="ti32">（11）利用票管家金融服务上传、展示或传播虚假的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料。</p>
				<p class="ti32">（12）其他票管家金融有正当理由认为不适当之行为。</p>
				<p class="ti32">7.3票管家金融保有依其单独判断删除票管家金融平台内各类不符合法律政策或不真实或不适当的信息内容而无须通知用户的权利，并无需承担任何责任。若用户未遵守以上规定的，票管家金融有权作出独立判断并采取暂停或关闭用户账号等措施，而无需承担任何责任。
				<p class="ti32">7.4用户同意，由于用户违反本协议，或违反通过援引并入本协议并成为本协议一部分的文件，或由于用户使用票管家金融服务违反了任何法律或第三方的权利而造成任何第三方对票管家金融进行或发起的任何补偿申请或要求（包括律师费用），用户会对票管家金融及其关联方、合作伙伴、董事以及雇员给予全额补偿并使之不受损害。</p>
				<p class="ti32">7.5用户承诺，其通过票管家金融上传或发布的信息均真实有效，其向票管家金融提交的任何资料均真实、有效、完整、详细、准确。如因违背上述承诺，造成票管家金融或票管家金融其他使用方损失的，用户将承担相应责任。
				<h2 class="f18 fb c2d2d2d mt16">八、违约责任</h2>
				<p class="ti32">8.1如因用户违反有关法律、法规或本协议下的任何条款而给票管家金融或任何其他第三人造成损失，用户将承担由此造成的损害赔偿责任。</p>
				<p class="ti32">8.2用户进一步同意，票管家金融没有义务，也不应对用户或第三方于票管家金融平台所张贴或提供的任何资料的真实性，准确性，是否构成误导，欺诈，诽谤，侵权或违法负责。如用户因此而遭受损失，则应由用户自行向张贴人要求赔偿，用户放弃追究票管家金融责任的权利（如有）。</p>
				<h2 class="f18 fb c2d2d2d mt16">九、免责声明</h2>
				<p class="ti32">9.1票管家金融对用户不提供包括但不限于以下保证：包括但不限于不保证服务一定能满足用户的要求；也不保证服务不会中断；对服务的及时性、安全性、准确性也都不作保证。对于因不可抗力或任何非票管家金融原因造成的网络服务中断或其他缺陷，票管家金融不承担任何责任。</p>
				<p class="ti32">9.2票管家金融不对任何用户、合作机构及/或任何业务提供任何担保或条件，无论是明示、默示或法定的。票管家金融不能也不试图对用户发布的信息进行控制，对该等信息，票管家金融不承担任何形式的证明、鉴定服务。票管家金融不能完全保证票管家金融平台内容的真实性、充分性、可靠性、准确性、完整性和有效性，并且无需承担任何由此引起的法律责任。用户依赖于用户的独立判断开展进行业务，用户应对其作出的判断承担全部责任。</p>
				<p class="ti32">9.3票管家金融不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由票管家金融实际控制的任何网页上的内容，票管家金融不承担任何责任。</p>
				<p class="ti32">9.4对于因不可抗力或票管家金融不能控制的原因造成的网络服务中断或其它缺陷，票管家金融不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p>
				<p class="ti32">9.5用户同意，对于票管家金融向用户提供的下列产品或者服务的质量缺陷本身及其引发的任何损失，票管家金融无需承担任何责任：</p>
				<p class="ti32">9.5.1票管家金融向用户免费提供的各项网络服务，包括用户通过票管家金融平台与票管家金融合作机构进行的业务；</p>
				<p class="ti32">9.5.2票管家金融向用户赠送的任何产品或者服务；</p>
				<p class="ti32">9.5.3票管家金融向高级网络服务用户提供的各种产品或者服务；</p>
				<p class="ti32">9.5.4 票管家金融接受用户委托，代理用户向银行机构申请办理的票据检验服务。</p>
				<h2 class="f18 fb c2d2d2d mt16">十、特别约定</h2>
				<p class="ti32">10.1本协议之效力、解释、执行均适用中华人民共和国法律（为本协议之目的，在此不包括香港、澳门特别行政区及台湾地区法律法规）。</p>
				<p class="ti32">10.2如发生争议，如各双方就本协议的内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，均应提交上海仲裁委员会，根据该会当时有效的仲裁规则进行仲裁，仲裁地点为上海，仲裁裁决是终局性的并对各方当事人具有约束力，仲裁费由败诉方承担提交上海国际经济贸易仲裁委员会进行仲裁。
				<h2 class="f18 fb c2d2d2d mt16">十一、协议生效</h2>
				<p class="ti32">各方同意本协议满足以下任何一种形式即为生效：</p>
				<p class="ti32">11.1本协议自用户根据电子签名相关法律法规线上签署之日生效。</p>
				<p class="ti32">11.2本协议自用户通过票管家金融平台阅读并点击同意接受（包括勾选、点击确认等任一种方式）本协议后生效。</p>
				<h2 class="f18 fb c2d2d2d mt16">十二、其他约定</h2>
				<p class="ti32">12.1如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
				<p class="ti32">12.2 本协议中的标题仅为方便而设，在解释本协议内容时应被忽略。</p>
				<p class="ti32 mt50">上海票管家金融服务有限公司</p>
			</div>
        </div>
    </div>
</div>
<!--社区协议弹窗-->
<div class="w h pf bc05 zi190 top none" id="shequxieyi">
    <div class="w758 h608 bcfc4d42 br5 mt_5 l_50 ml-385 pr zi190">
        <!--关闭按钮-->
        <div class="w37 h37 pa t-15 r-15 zi200 redClose cp" id="redClose1"></div>

        <div class="w750 h600 pr t4 l4 bcf5f5f5 zi190">
            <div class="wa h600 oya bc mt20 pl30 pr30 bcwhite c595959 f16 lh26">
			    <h1 class="f24 lh24 fb tc c2d2d2d mb30">票管家社区用户协议</h1>
			    <p class="ti32">欢迎光临票管家社区，请您仔细阅读票管家社区用户协议（“本协议”）全部条款，如果您未满18周岁，请在法定监护人的陪同下阅读。如果您对本协议的任何条款表示异议，您可以选择不进入票管家社区；进入票管家社区意味着您将同意遵守本协议项下全部约定，并完全服从于票管家社区的统一管理。</p>
			    <h2 class="f18 fb c2d2d2d mt16">一、总则</h2>
			    <p class="ti32">1.1.   票管家社区【社区网址】是上海票管家金融服务有限公司向用户提供的信息讨论及交流平台，其所有权、运营权和管理权归上海票管家金融服务有限公司（以下简称“票管家”或“本社区”）所有。</p>
			    <p class="ti32">1.2.   用户在使用本社区的服务之前，应当仔细阅读本协议，并同意遵守本协议及所有社区规则，一旦用户注册成功，则用户与本社区之间自动形成协议关系（即本协议签订），用户应当受本协议及所有社区规则（包括用户注册成功后进行更新的本协议及所有社区规则）的约束。</p>
			    <p class="ti32">1.3.   本协议、社区规则可由本社区随时更新，用户在进入票管家社区时应当及时关注，用户同意，本社区有权随时对本协议和社区规则进行更新，但应当遵循公开、连续、合理的原则，修改内容应当至少提前七日以网站公告的形式通知用户。七日公告期满，视为本社区对用户完成了通知。本社区的通知、公告、声明或其它类似内容构成本协议及社区规则的一部分。</p>
			    <h2 class="f18 fb c2d2d2d mt16">二、服务内容</h2>
			    <p class="ti32">2.2.   本社区网络服务的具体内容由本社区根据实际情况提供，例如论坛、分类信息（包括但不限于票管家金融服务平台【https://www.utiexian.com】的票据资讯、票据报价、票据融资咨询、银行不良资产处置、接受委托聘请相关银行为用户办理票据检验等金融服务信息）等。</p>
			    <p class="ti32">2.3.   本社区提供的部分网络服务为收费的网络服务，用户使用收费网络服务需要向本社区支付一定的费用。对于收费的网络服务，本社区会在用户使用之前给予用户明确的提示，只有用户根据提示确认其愿意支付相关费用，用户才能使用该等收费网络服务。如用户拒绝支付相关费用，则本社区有权不向用户提供该等收费网络服务。</p>
			    <p class="ti32">2.4.   本社区仅提供相关的网络服务，除此之外与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费）均应由用户自行负担。</p>
			    <h2 class="f18 fb c2d2d2d mt16">三、用户账号</h2>
			    <p class="ti32">3.1.   注册方式。用户可通过以下方式注册成为票管家社区的正式用户（“用户”）：</p>
			    <p class="ti32">（1） 经本社区用户系统完成注册程序并通过身份认证的用户；</p>
			    <p class="ti32">（2） 经社区批准的第三方合作网站登录的的用户。</p>
			    <p class="ti32">成为票管家社区正式用户即获得本社区规定用户所应享有的一切权限，但票管家社区有权对用户的权限进行调整。</p>
			    <p class="ti32">3.2.   注册名</p>
			    <p class="ti32">3.2.1. 用户注册时，注册名只能使用汉字、英文字母、数字、下划线及它们的组合，禁止使用空格、各种符号和特殊字符，且最多不超过16个字符(8个汉字)注册，否则将不予注册。</p>
			    <p class="ti32">3.2.2. 用户账号注册名中不得含有不雅文字或不恰当名称，包括但不限于如下情形：</p>
			    <p class="ti32">（1） 以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；</p>
			    <p class="ti32">（2） 以国家机构或其他机构的名称注册；</p>
			    <p class="ti32">（3） 注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的账号；</p>
			    <p class="ti32">（4） 注册易产生歧义、引起他人误解或其它不符合法律规定的账号。</p>
			    <p class="ti32">3.3.   用户账号的所有权归本社区，用户仅享有使用权。【3】个月未使用的用户账号，本社区可选择收回其账号使用权。</p>
			    <p class="ti32">3.4.   用户了解并同意，确保用户账号及密码的机密安全是用户的责任。用户将对利用该用户账号及密码所进行的一切行动及言论，负完全的责任，本社区不承担任何责任。</p>
			    <p class="ti32">3.5.   如用户发现账号遭到未授权的使用或发生其他任何安全问题，应立即修改账号密码并妥善保管，如有必要，请通知本社区。因黑客、病毒或用户的保管疏忽等非本社区原因导致用户的账号遭他人非法使用的，本社区不承担任何责任。</p>
			    <h2 class="f18 fb c2d2d2d mt16">四、使用规则</h2>
			    <p class="ti32">4.1.   用户享有言论自由的权利。</p>
			    <p class="ti32">4.2.   用户应当遵守中华人民共和国相关法律法规，包括但不限于《全国人大常委会关于维护互联网安全的决定》、《计算机信息网络国际联网安全保护管理办法》、《互联网信息服务管理办法》、《互联网著作权行政保护办法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《信息网络传播权保护条例》、《最高人民法院关于审理侵害信息网络传播权民事纠纷案件适用法律若干问题的规定》和《互联网新闻信息服务管理规定》等有关计算机互联网规定和知识产权的法律和法规、实施办法。</p>
			    <p class="ti32">4.3.   用户对其自行发表、上传或传送的内容负全部责任，所有用户不得在本社区任何页面发布、传播或以其它方式传送含有下列内容之一的信息：</p>
			    <p class="ti32">（1） 违反宪法确定的基本原则的；</p>
			    <p class="ti32">（2） 危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的；</p>
			    <p class="ti32">（3） 损害国家荣誉和利益的；</p>
			    <p class="ti32">（4） 煽动民族仇恨、民族歧视，破坏民族团结的；</p>
			    <p class="ti32">（5） 破坏国家宗教政策，宣扬邪教和封建迷信的；</p>
			    <p class="ti32">（6） 散布谣言，扰乱社会秩序，破坏社会稳定的；</p>
			    <p class="ti32">（7） 散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</p>
			    <p class="ti32">（8） 侮辱或者诽谤他人，侵害他人合法权益的；</p>
			    <p class="ti32">（9） 煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；</p>
			    <p class="ti32">（10） 以非法民间组织名义活动的；</p>
			    <p class="ti32">（11） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容；</p>
			    <p class="ti32">（12） 侵犯他人知识产权或其他合法权益的；</p>
			    <p class="ti32">（13） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的。</p>
			    <p class="ti32">4.4.   用户不得违规在本社区内发布与票管家金融无关的广告，包括但不限于：</p>
			    <p class="ti32">（1） 发布任何网络创业、网络兼职、刷Q币以及非真实性中奖信息；</p>
			    <p class="ti32">（2） 发布包含学历职称代办、专业代做试题、作业、论文等题目以及售卖考试答案等信息；</p>
			    <p class="ti32">（3） 发布任何银行卡代办、买卖发票、非法彩票等信息；</p>
			    <p class="ti32">（4） 发布个人信息售卖、黑客、收费删帖、办证刻章等违法信息；</p>
			    <p class="ti32">（5） 发布任何医院、美容、药品、祛斑、医生专家和整容等信息。</p>
			    <p class="ti32">4.5.   用户发现社区论坛内容涉嫌侮辱或者诽谤他人、侵害他人合法权益的或违反本社区协议约定的，有权按社区投诉规则进行投诉。</p>
			    <p class="ti32">4.6.   当第三方认为用户发表或者上传于本社区的信息侵犯其权利，并根据相关法律规定向本社区发送权利通知时，用户同意本社区可以自行判断决定删除涉嫌侵权信息，除非用户提交法院、仲裁机构、公证机构等出具的书面材料排除侵权的可能性，本社区将不会自动恢复上述已删除的信息。</p>
			    <p class="ti32">4.7.   用户承诺对其发表或者上传于本社区的所有信息（即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等）均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成本社区被第三人索赔的，用户应全额补偿本社区一切费用并本社区因此产生的赔偿损失（包括但不限于赔偿费、诉讼代理费、差旅费及为此支出的全部费用）。</p>
			    <h2 class="f18 fb c2d2d2d mt16">五、处罚规则</h2>
			    <p class="ti32">5.1.   如用户在使用本社区网络服务时违反本协议任何约定，本社区有权要求用户立即改正并有权直接采取一切必要的措施（包括但不限于删除用户发布、上传、传送的内容、暂停或终止用户使用本社区网络服务的权利）以减轻用户不当行为而造成的影响。</p>
			    <p class="ti32">5.2.   本社区郑重提醒用户，若出现下列情况任意一种或几种，将承担包括但不限于被删除发布内容、被关闭全部或部分权限、被暂停或被收回账号的后果，情节严重的，还将承担相应的法律责任：</p>
			    <p class="ti32">（1） 使用本协议3.2.2条约定的不雅或不恰当注册名的；</p>
			    <p class="ti32">（2） 发布信息含有本协议第四条禁止发布、传播内容的；</p>
			    <p class="ti32">（3） 发布不符合版面主题或无内容的灌水文章的；</p>
			    <p class="ti32">（4） 同一发布内容多次出现的；</p>
			    <p class="ti32">（5） 发表含有猥亵、色情、人身攻击和反政府言论等非法或侵权言论的；</p>
			    <p class="ti32">（6） 从事非法商业活动；</p>
			    <p class="ti32">（7） 侵犯他人知识产权或其他合法权益的；</p>
			    <p class="ti32">（8） 其他本社区认为不恰当的情况。</p>
			    <p class="ti32">5.3.   为了向用户提供优质的讨论和交流平台，同时使社区良性、健康的发展，本社区将对涉及反动、色情的头像、签名档和发布盗版和不良内容的用户，进行严厉处理。</p>
			    <h2 class="f18 fb c2d2d2d mt16">六、权利声明</h2>
			    <p class="ti32">6.1.   用户发表并将其上传到本网站的任何内容，用户许可票管家在全世界范围内不限形式和载体地享有永久的、不可撤销的、免费的、非独家的使用权和转授权的权利，包括但不限于修改、复制、发行、展览、改编、汇编、出版、翻译、信息网络传播、广播、表演和再创作及著作权法等法律法规确定的其他权利。并且，用户许可票管家有权利就任何主体侵权而单独提起诉讼，并获得全部赔偿。</p>
			    <p class="ti32">6.2.   本社区特有的标识、版面设计、编排方式等版权均属本社区享有，未经本社区许可，不得任意复制或转载。</p>
			    <p class="ti32">6.3.   用户从本社区的服务中获得的信息，未经本社区许可，不得任意复制或转载。经本社区授权许可，使用本社区的任何内容时均应注明"来源于票管家社区【社区网址】"及署上作者姓名，按法律规定需要支付稿酬的，应当通知本社区及作者并支付稿酬，并独立承担一切法律责任。</p>
			    <p class="ti32">6.4.   恶意转载本社区内容的，本社区保留将其诉诸法律的权利。</p>
			    <h2 class="f18 fb c2d2d2d mt16">七、责任声明</h2>
			    <p class="ti32">7.1.   用户明确同意其使用本社区网络服务所存在的风险及一切后果将完全由用户本人承担，本社区对此不承担任何责任。</p>
			    <p class="ti32">7.2.   本社区无法保证网络服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。</p>
			    <p class="ti32">7.3.   本社区不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本社区实际控制的任何网页上的内容，本社区不承担任何责任。</p>
			    <p class="ti32">7.4.   对于本社区向用户提供的下列产品或者服务的质量缺陷本身及其引发的任何损失，本社区无需承担任何责任：</p>
			    <p class="ti32">（1） 本社区向用户免费提供的各项网络服务；</p>
			    <p class="ti32">（2） 本社区向用户赠送的任何产品或者服务；</p>
			    <p class="ti32">（3） 本社区向收费网络服务用户附赠的各种产品或者服务；</p>
			    <p class="ti32">（4） 本社区用户通过本社区进入票管家金融信息服务平台，委托票管家代理用户向银行机构申请办理的票据检验服务。</p>
			    <p class="ti32">7.5.   对于因不可抗力或本社区不能控制的原因造成的网络服务中断或其它缺陷，本社区不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p>
			    <p class="ti32">7.6.   本社区有权于任何时间暂时或永久修改或终止本协议(或其任何部分)，而无论其通知与否，本社区对用户和任何第三人均无需承担任何责任。</p>
			    <p class="ti32">7.7.   用户发布的内容仅代表用户观点，与本社区无关。任何通过本社区发布的资讯，并不意味着本社区赞同其观点或证实其内容的真实性，本社区不负任何审查或核实义务，亦不承担任何法律责任。</p>
			    <p class="ti32">7.8.   因使用本社区用户发布的内容而引致之任何意外、违约、亏损、侵权等及其所造成的各种损失（包括但不限于因下载而感染电脑病毒等），本社区概不负责，亦不承担任何法律责任。</p>
			    <p class="ti32">7.9.   本社区不对任何用户及/或任何交易提供任何担保或条件，无论是明示、默示或法定的。本社区不承担任何形式的证明、鉴定服务。用户依赖于用户的独立判断进行操作，用户应对其作出的判断承担全部责任。</p>
			    <p class="ti32">7.10.  任何单位或个人认为本社区的服务内容或用户发布的内容可能涉嫌侵犯其合法权益，应该及时向本社区发出书面权利通知，并提供身份证明、权属证明、具体链接(URL)及详细侵权情况证明。本社区在收到上述法律文件后，可自行判断并依法移除相关涉嫌侵权的内容。</p>
			    <h2 class="f18 fb c2d2d2d mt16">八、私隐条例</h2>
			    <p class="ti32">8.1.   为方便用户使用本社区及票管家金融信息服务平台的相关服务，用户特授权本社区将其在账户注册和使用社区服务过程中提供、形成的信息传递给票管家金融信息服务平台，或从票管家金融信息服务平台获取其在注册、使用相关服务期间提供、形成的信息。</p>
			    <p class="ti32">8.2.   本社区尊重并保护所有使用本社区的用户的个人隐私权。为了给用户提供更准确、更有个性化的服务，本社区会按照本隐私条例的规定使用和披露用户的个人信息，并以高度的勤勉、审慎义务对待这些信息。除本协议另有约定外，在未征得用户事先许可的情况下，本社区不会将这些信息对外披露或向第三方提供。特别说明，用户在同意本社区协议之时，即视为已经同经同意本隐私条例全部内容。</p>
			    <p class="ti32">8.3.   在用户访问本社区网站时，本社区将自动接收并记录用户的浏览器和计算机上的信息，包括但不限于用户的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及用户需求的网页记录等数据。</p>
			    <p class="ti32">8.4.   本社区不会向任何无关第三方提供、出售、出租、分享或交易用户的个人信息，除非事先得到其许可，或该第三方和票管家单独或共同为用户提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有相关资料。</p>
			    <p class="ti32">8.5.   为服务用户的目的，票管家可能通过使用用户的个人信息，向用户提供用户感兴趣的信息，包括但不限于向用户发出产品和服务信息，或者与票管家合作伙伴共享信息以便他们向用户发送有关其产品和服务的信息（后者需要用户的事先同意）。</p>
			    <p class="ti32">8.6.   在如下情况下，本社区将依据用户的个人意愿或法律的规定全部或部分的披露用户的个人信息：</p>
			    <p class="ti32">（1） 经用户事先同意，向第三方披露；</p>
			    <p class="ti32">（2） 如用户是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；</p>
			    <p class="ti32">（3） 根据法律的有关规定，或者行政或司法机关的要求，向第三方或者行政、司法机关披露；</p>
			    <p class="ti32">（4） 如用户出现违反中国有关法律、法规、本社区协议、票管家有关法律声明或相关规则的情况，需要向第三方披露；</p>
			    <p class="ti32">（5） 为提供用户所要求的产品和服务，而必须和第三方分享用户的个人信息；</p>
			    <p class="ti32">（6） 其它本社区根据法律、法规或者网站政策认为合适的披露。</p>
			    <p class="ti32">8.7.   在不透露单个用户隐私资料的前提下，本社区有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p>
			    <h2 class="f18 fb c2d2d2d mt16">九、附则</h2>
			    <p class="ti32">9.1.   本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。</p>
			    <p class="ti32">9.2.   如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
			    <p class="ti32">9.3.   本协议签订地、成立地、履行地为票管家【办公地】为上海市虹口区东大名路501白玉兰广场1207。</p>
			    <p class="ti32">9.4.   本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国大陆地区法律。</p>
			    <p class="ti32">9.5.   若用户和票管家之间因本协议发生任何纠纷或争议，首先应友好协商解决；协商不成的，用户同意将纠纷或争议提交至上海国际经济贸易仲裁委员会进行仲裁。</p>
			    <p class="ti32">9.6.   本协议自用户注册成功视为签订，自签订起对该用户和本社区生效。</p>
			    <p class="ti32">9.7.   本协议解释权及修订权归上海票管家金融服务有限公司所有。</p>
			    <p class="ti32 tl mt30">特此声明。</p>
			    <p class="ti32 tr mt30">上海票管家金融服务有限公司</p>
			    <p class="ti32 tr">2016年3月10日</p>
			</div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${jsPath}/login.js"></script>
<script type="text/javascript">
/*
 *快速登录 
 */
function quicklogin(){
	var chk = $("#YHXY1").attr("checked");
	if(chk){
		var mobile = $("#phone1").val();
		var code = $("#phoneCode1").val();
		var redirect_url = $("#redirect_url1").val();
		if(mobile==null || $.trim(mobile)==""){// 表单验证
			$("#phone1").validationEngine('showPrompt','* 手机号不能为空',null,null,true);
			setTimeout(function(){$(".formError").hide();},2000);
			return;
		}else{
			if(!$("#phone1").validationEngine("validate")){
				setTimeout(function(){$("#phone1").validationEngine('hide');},2000);
				$("#phone1").focus();
				return;
			}
		}
		if(!$("#phoneCode1").validationEngine("validate")){
			setTimeout(function(){$("#phoneCode1").validationEngine('hide');},2000);
			$("#phoneCode1").focus();
		    return;
		} 
		$.ajax({
			url:"${basePath}/member/quicklogin",
			type:"POST",
			data:{"mobile":mobile,"code":code,"redirect_url":redirect_url},
			dataType:"json",
			success:function(data){
				if(data.response == "success"){
					if(data.redirect_url!=null && $.trim(data.redirect_url)!=""){
						window.location.href="${basePath}"+data.redirect_url;
					}else{
						window.location.href="${basePath}";//跳到首页
					}
				}else{
					if(data.msg=='codeError'){
						$("#phoneCode1").validationEngine('showPrompt','* 验证码不正确',null,null,true);
						setTimeout(function(){$("#phoneCode1").validationEngine('hide');},2000);
					}else{
						$("#quick").validationEngine('showPrompt','* '+data.msg,null,null,true);
						setTimeout(function(){$("#quick").validationEngine('hide');},2000);
					}
				}
			}
		});
	}else{
		$("#YHXY1").validationEngine('showPrompt','* 协议还没看哟',null,null,true);
		setTimeout(function(){$("#YHXY1").validationEngine('hide');},2000);
	}
}
/*
 *密码登录 
 */
function login(){
	var chk = $("#YHXY2").attr("checked");
	var sessionTime = $("input:radio[name='sessionTime']:checked").val();
	if(chk){
		var mobile = $("#phone2").val();
		var pwd = $("#password1").val();
		var redirect_url = $("#redirect_url").val();
		if(mobile==null || $.trim(mobile)==""){// 表单验证
			$("#phone2").validationEngine('showPrompt','* 手机号不能为空',null,null,true);
			setTimeout(function(){$("#phone2").validationEngine('hide');},2000);
			return;
		}else{
			if(!$("#phone2").validationEngine("validate")){
				setTimeout(function(){$("#phone2").validationEngine('hide');},2000);
				$("#phone2").focus();
				return;
			}
		}
		if(!$("#password1").validationEngine("validate")){
			setTimeout(function(){$("#password1").validationEngine('hide');},2000);
			$("#password1").focus();
		    return;
		}
		var sessionTime = $("input:radio[name='sessionTime']:checked").val();
		$.ajax({
			url:"${basePath}/member/login",
			type:"POST",
			data:{"mobile":mobile,"pwd":pwd,"sessionTime":sessionTime,"redirect_url":redirect_url},
			dataType:"json",
			success:function(data){
				if(data.response == "success"){
					if(data.redirect_url!=null && $.trim(data.redirect_url)!=""){
						window.location.href="${basePath}"+data.redirect_url;
					}else{
						window.location.href="${basePath}";//跳到首页
					}
				}else{
					$("#phone2").validationEngine('showPrompt','* '+data.msg,null,null,true);
					setTimeout(function(){$("#phone2").validationEngine('hide');},2000);
				}
			}
		});
	}else{
		$("#YHXY2").validationEngine('showPrompt','* 协议还没看哟',null,null,true);
		setTimeout(function(){$("#YHXY2").validationEngine('hide');},2000);
	}
}
/*
 *注册 
 */
function reg(tag){
	if($(tag).attr("disabled")){
		return;
	}
	var chk = $("#YHXY3").attr("checked");
	var mobile = $("#phone3").val();
	var pwd = $("#password2").val();
	var code = $("#phoneCode2").val();
	var inviteID = $("#invite").val();
	
	var source = localStorage.getItem('source');
	if(chk){
		if(mobile==null || $.trim(mobile)==""){// 表单验证
			$("#phone3").validationEngine('showPrompt','* 手机号不能为空',null,null,true);
			setTimeout(function(){$("#phone3").validationEngine('hide');},2000);
			return;
		}else{
			if(!$("#phone3").validationEngine("validate")){
				setTimeout(function(){$("#phone3").validationEngine('hide');},2000);
				$("#phone3").focus();
				return;
			}
		}
		if(!$("#password2").validationEngine("validate")){
			$("#password2").focus();
			setTimeout(function(){$("#password2").validationEngine('hide');},2000);
			return;
		}
		if(!$("#phoneCode2").validationEngine("validate")){
			$("#phoneCode2").focus();
			setTimeout(function(){$("#phoneCode2").validationEngine('hide');},2000);
		    return;
		} 
		if(!$("#invite").validationEngine("validate")){
			$("#invite").focus();
			setTimeout(function(){$("#invite").validationEngine('hide');},2000);
		    return;
		}
		$(tag).attr("disabled","disabled");//按钮禁用
		$.ajax({
			url:"${basePath}/member/register",
			type:"post",
			data:{"mobile":mobile,"pwd":pwd,"code":code,"inviteID":inviteID,"hezuo":source},
			dataType:"json",
			success:function(data){
				if(data.response=="success"){
					window.location.href="${basePath}";//跳到首页
					localStorage.removeItem('source');
				}else{
					if(data.msg == 'phoneError'){
						$("#phone3").validationEngine('showPrompt','* 手机号码已存在',null,null,true);
						setTimeout(function(){$("#phone3").validationEngine('hide');},3000);
					}else if(data.msg == 'codeError'){
						$("#phoneCode2").validationEngine('showPrompt','* 手机验证码不正确',null,null,true);
						setTimeout(function(){$("#phoneCode2").validationEngine('hide');},3000);
					}else{
						$("#zhuce").validationEngine('showPrompt','* '+data.msg,null,null,true);
						setTimeout(function(){$("#zhuce").validationEngine('hide');},3000);
					}
					$(tag).removeAttr("disabled");//按钮启用
					localStorage.removeItem('source');
				}
			}
		});	
	}else{
		$("#YHXY3").validationEngine('showPrompt','* 协议还没看哟',null,null,true);
		setTimeout(function(){$("#YHXY3").validationEngine('hide');},2000);
	}
}

/*
 * 快速登录倒计时
 */
var timer;
var timeshow = 60;
function showtime(t){
	$("#phoneBtn1").attr({"disabled":"disabled"});
	var mobile = $("#phone1").val();
	if(mobile==null || $.trim(mobile)==""){// 表单验证
		$("#phone1").validationEngine('showPrompt','* 手机号不能为空',null,null,true);
		setTimeout(function(){$("#phone1").validationEngine('hide');},2000);
		$("#phoneBtn1").removeAttr("disabled");
		return;
	}
	timeshow = 60;
    if ($("#phone1").validationEngine("validate")) {
    	$.ajax({
    		url:"${basePath}/member/sendcode",
    		type:"post",
    		data:{"mobile":mobile,"flag":"quicklogin","myCode":$("#imgCode1").val()},
    		dataType:"text",
    		success:function(data){
    			if(data=="success"){
    				timer = setInterval(show, 1000);
    			}else{
    				$("#phone1").validationEngine('showPrompt','* '+data,null,null,true);
    				setTimeout(function(){$("#phone1").validationEngine('hide');},3000);
    				$("#phoneBtn1").removeAttr("disabled");
    			}
    		}
    	});
	} else {
		$("#phoneBtn1").removeAttr("disabled");
	}
}

/**
* 短信倒计时
*/
function show() {
    if (timeshow <= 1) {
        clearInterval(timer);
    }
    timeshow--;
    $("#phoneBtn1").val(timeshow+"s重新发送");
    if (timeshow == 0) {
		$("#phoneBtn1").val("重新发送 ");
    	$("#phoneBtn1").removeAttr("disabled");//按钮启用
    }
};

/*
 * 注册倒计时
 */
function showtime1(t){
	$("#phoneBtn2").attr({"disabled":"disabled"});
	var mobile = $("#phone3").val();
	if(mobile==null || $.trim(mobile)==""){// 表单验证
		$("#phone3").validationEngine('showPrompt','* 手机号不能为空',null,null,true);
		setTimeout(function(){$("#phone3").validationEngine('hide');},2000);
		$("#phoneBtn2").removeAttr("disabled");
		return;
	}
	timeshow = 60;
    if ($("#phone3").validationEngine("validate")) {
    	$.ajax({
    		url:"${basePath}/member/sendcode",
    		type:"post",
    		data:{"mobile":mobile,"flag":"reg","myCode":$("#imgCode2").val()},
    		dataType:"text",
    		success:function(data){
    			if(data=="success"){
    				timer = setInterval(show1, 1000);
    			}else{
    				$("#phone3").validationEngine('showPrompt','* '+data,null,null,true);
    				setTimeout(function(){$("#phone3").validationEngine('hide');},3000);
    				$("#phoneBtn2").removeAttr("disabled");
    			}
    		}
    	});
	} else {
		$("#phoneBtn2").removeAttr("disabled");
	}
}
/**
* 短信倒计时
*/
function show1() {
    if (timeshow <= 1) {
        clearInterval(timer);
    }
    timeshow--;
    $("#phoneBtn2").val(timeshow+"s重新发送");
    if (timeshow == 0) {
		$("#phoneBtn2").val("重新发送 ");
    	$("#phoneBtn2").removeAttr("disabled");//按钮启用
    }
};

/*
 * 换一张图形码
 */
function change(){
	$("#dlimg").attr("src","${basePath}/member/image?s="+new Date());
}

/*
 * 换一张图形码
 */
function change1(){
	$("#dlimg1").attr("src","${basePath}/member/image1?s="+new Date());
}

/*
 * 快速登录验证安全码
 */
function yanzheng(){
	var imgCode = $("#imgCode1").val();
	if(!$("#imgCode1").validationEngine("validate")){
		$("#imgCode1").focus();
		setTimeout(function(){$("#imgCode2").validationEngine('hide');},2000);
		return;
	}
	$.ajax({
		url:"${basePath}/member/yzimage",
		type:"post",
		data:{"imgCode":imgCode},
		dataType:"text",
		success:function(data){
			if("success"==data){
				showtime(60);
			}else{
				$("#imgCode1").validationEngine('showPrompt','* 验证码不正确',null,null,true);
				setTimeout(function(){$("#imgCode1").validationEngine('hide');},2000);
			}
		}
	});
}

/*
 * 注册验证图形码
 */
function yanzheng1(){
	var imgCode = $("#imgCode2").val();
	if(!$("#imgCode2").validationEngine("validate")){
		$("#imgCode2").focus();
		setTimeout(function(){$("#imgCode2").validationEngine('hide');},2000);
		return;
	}
	$.ajax({
		url:"${basePath}/member/yzimage1",
		type:"post",
		data:{"imgCode":imgCode},
		dataType:"text",
		success:function(data){
			if("success"==data){
				showtime1(60);
			}else{
				$("#imgCode2").validationEngine('showPrompt','* 验证码不正确',null,null,true);
				setTimeout(function(){$("#imgCode2").validationEngine('hide');},2000);
			}
		}
	});
}

/*
 * 用户协议弹框 
 */
function tan(){
	$("#xieyi").removeClass("none");
}
$("#redClose").click(function(){
	$("#xieyi").addClass("none");
});

/*
 * 社区协议弹框 
 */
function tan1(){
	$("#shequxieyi").removeClass("none");
}
$("#redClose1").click(function(){
	$("#shequxieyi").addClass("none");
});
</script>
<!--foot-->
[@main.footer/]
[/@main.body]