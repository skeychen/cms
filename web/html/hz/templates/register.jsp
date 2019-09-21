<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%common.cms.CmsFactory cms = (common.cms.CmsFactory)request.getAttribute("cms");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui"/>
<title>${category.name} - ${site.name}</title>
<meta name="keywords" content="${category.metakeywords}"/>
<meta name="description" content="${category.metadescription}"/>
</head>
<body>
<%@include file="include/header.jsp"%>
<div class="vus-container vus-relative">

<div class="vus-mt-20 vus-mb-20 vus-pl-20 vus-pr-20 vus-pt-20 vus-pb-20 vus-bg--white vus-clearfix">
	<ul class="vus-clearfix vus-border-bottom-1 vus-fs-18 js-register-tabs">
		<li class="vus-fl vus-ml-20 vus-mr-20 vus-pb-10 vus-cursor-pointer mg-color-1 vus-border-bottom-3 vus-border--warning">用户注册</li>
	</ul>
	
	<div class="vus-pt-40 vus-pb-40 vus-clearfix">
		<div>
			<div class="vus-fl">
				<form class="vus-form" action="#" name="persons" id="persons">
					<div class="vus-form-item vus-mb-20">
					    <label class="vus-form-label vus-fs-16">用户名：</label>
					    <div class="vus-form-content">
					        <div class="vus-absolute vus-position-left vus-position-top vus-position-bottom vus-zindex-2 vus-w-px-40 vus-text-center">
					        	<img src="/f/res/image/user.png" class="vus-inline-block vus-align-top vus-mt-9 vus-w-px-22 vus-mx-auto">
					        </div>
					        <input type="text" class="vus-input warning default vus-pl-40" placeholder="请输入用户名" id="account" name="account" autocomplete="off" tip="用户名不能为空">
					    </div>
					</div>
					<div class="vus-form-item vus-mb-20">
					    <label class="vus-form-label vus-fs-16">手机号码：</label>
					    <div class="vus-form-content">
					        <div class="vus-absolute vus-position-left vus-position-top vus-position-bottom vus-zindex-2 vus-w-px-40 vus-text-center">
					        	<img src="/f/res/image/mobile.png" class="vus-inline-block vus-align-top vus-mt-9 vus-w-px-22 vus-mx-auto">
					        </div>
					        <input type="text" class="vus-input warning default vus-pl-40" placeholder="请输入手机号码" id="mobile" name="mobile" autocomplete="off" tip="手机号不能为空">
					    </div>
					</div>
					<div class="vus-form-item vus-mb-20">
					    <label class="vus-form-label vus-fs-16">短信验证码：</label>
					    <div class="vus-form-content">
							<div class="vus-w-55 vus-fl">
								<div class="vus-absolute vus-position-left vus-position-top vus-position-bottom vus-zindex-2 vus-w-px-40 vus-text-center">
									<img src="/f/res/image/code.png" class="vus-inline-block vus-align-top vus-mt-9 vus-w-px-22 vus-mx-auto">
								</div>
								<input type="text" class="vus-input warning default vus-pl-40" placeholder="请输入短信验证码" id="smscode" name="smscode" autocomplete="off" tip="短信验证码不能为空">
							</div>
							<div class="vus-w-45 vus-pl-15 vus-fr">
								<button type="button" class="vus-btn vus-w-100 vus-align-top js-get-code" onclick="getCode()">获取验证码</button>
								<button type="button" class="vus-btn light vus-w-100 vus-align-top js-countdown" disabled="disabled" style="display: none;"><span class="js-code-time">60</span>秒后重发</button>
							</div>
						</div>
					</div>
						
					<div class="vus-form-item vus-mb-20">
					    <label class="vus-form-label vus-fs-16">密码：</label>
					    <div class="vus-form-content">
					        <div class="vus-absolute vus-position-left vus-position-top vus-position-bottom vus-zindex-2 vus-w-px-40 vus-text-center">
					        	<img src="/f/res/image/password.png" class="vus-inline-block vus-align-top vus-mt-9 vus-w-px-22 vus-mx-auto">
					        </div>
					        <input type="password" class="vus-input warning default vus-pl-40" placeholder="请输入密码" id="password" name="password" autocomplete="off" tip="密码不能为空">
					    </div>
					</div>
					<div class="vus-form-item vus-mb-20">
					    <label class="vus-form-label vus-fs-16">确认密码：</label>
					    <div class="vus-form-content">
							<div class="vus-absolute vus-position-left vus-position-top vus-position-bottom vus-zindex-2 vus-w-px-40 vus-text-center">
								<img src="/f/res/image/password.png" class="vus-inline-block vus-align-top vus-mt-9 vus-w-px-22 vus-mx-auto">
							</div>
							<input type="password" class="vus-input warning default vus-pl-40" placeholder="请输入确认密码" id="password2" name="password2" autocomplete="off" tip="密码不能为空">
					    </div>
					</div>
					<div class="vus-form-item">
					    <div class="vus-form-content">
					        <button type="button" class="vus-btn warning large vus-w-100 vus-fs-18" onclick="doclick()">注 册</button>
					    </div>
					</div>
				</form>
				<div class="vus-w-100 vus-pt-10">
					<div class="vus-pl-20 vus-pr-20">
						<div class="vus-relative vus-border-top-1">
							<div class="vus-absolute mg-login-other vus-index-2 vus-bg--white vus-pl-10 vus-pr-10 vus-fs-12 vus-color--gray">其他方式注册</div>
						</div>
						<ul class="vus-pt-25 vus-text-center">
							<%
							String loginURL = java.net.URLEncoder.encode("/hz-yhxx/portal/user/loginAction.jsp", "UTF-8");
							request.setAttribute("loginURL", java.net.URLEncoder.encode(loginURL, "UTF-8"));
							%>
							<li class="vus-inline-block vus-pl-10 vus-pr-10">
		                        <a href="${ctx}/websso/login.jsp?bindid=1&reg=true&bindtype=qq&appid=CA1DB36591314A59EB5B449EF61D03E62&url=${fn:escapeXml(loginURL)}"><img src="/f/res/image/login_qq.png" class="vus-img vus-w-px-40"></a>
		                    </li>
		                    <li class="vus-inline-block vus-pl-10 vus-pr-10">
		                        <a href="${ctx}/websso/login.jsp?bindid=6&reg=true&bindtype=wechat-qrcode&appid=CA1DB36591314A59EB5B449EF61D03E62&url=${fn:escapeXml(loginURL)}"><img src="/f/res/image/login_weixin.png" class="vus-img vus-w-px-40"></a>
		                    </li>
		                </ul>
					</div>
				</div>
			</div>
			<div class="vus-w-45 vus-fr">
				<img src="/f/res/image/register-2.png" class="vus-img vus-mx-auto">
			</div>
		</div>
	</div>
</div>
 <!-- 右侧浮动层 -->
    <div class="mg-fixed-service">
        <div class="fixed">
            <ul>
                <li class="vus-w-px-40 vus-h-px-40 icon icon1 vus-cursor-pointer vus-anim-all"></li>
                <li class="vus-w-px-40 vus-h-px-40 icon icon2 vus-mt-10 vus-cursor-pointer vus-anim-all"></li>
                <li class="vus-w-px-40 vus-h-px-40 icon icon3 vus-mt-10 vus-cursor-pointer vus-anim-all"></li>
                <li class="vus-w-px-40 vus-h-px-40 icon icon4 vus-mt-10 vus-cursor-pointer vus-anim-all js-back-top"></li>
            </ul>
        </div>
    </div>
    
</div>
<%@include file="include/footer.jsp"%>
<script src="/hz-yhxx/js/jskey_sso.js"></script>
<script type="text/javascript">
function doclick(){
	if(docheck()){return;}
	var account = _$("account").value;
	var mobile = _$("mobile").value;
	var smscode = _$("smscode").value;
	var password = $jskey.md5(_$("password").value);
	var password2 = $jskey.md5(_$("password2").value);
	
	if(checkMobile(mobile)){
		var rsa = new $jskey.rsa();
		rsa.setPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmABR8u7uvytZd8vJpMd2uK4cEwt+SFJhU7dtPk71Tj4M8WDR6ZvdzHe02cp+Sm6x6QR5WxjgSwqcCKru3vsEITzJs3DZD3JRXmfFCNJG9C52pIzSIEFnwlLSu7vNgKoxWBn+ufZG3mjbSLdFKfwLfRR2KouWy2EEfVVDvEgmSFsUaYLXZ8GfsGr9kAvf5cVsZ7cxpywsdXLFp6vardbTgzMUA8+SIfoH60XAT36CQa2JF929h4+2MFmuqTpPHz0NoJ1dCy+s+czHr+z6wZ3Labfjg2elK15BKB+uLr2SFLeUm8liLNPvOgEVOEso3ubY1WNP7XXKZt+zYn5EE4VRYwIDAQAB");
		var data = {};
		data.account = account;
		data.mobile = mobile;
		data.smscode = smscode;
		data.password = password;
		ajax({
		    method: 'POST',
		    url:"/hz-yhxx/portal/user/registerAction.jsp",
		    data: {
				  "data":rsa.encrypt(JSON.stringify(data)),
				  "appid":"CA1DB36591314A59EB5B449EF61D03E62"
		    },
		    success:function(response){
		    	console.log(response);
		    	var json= eval("("+response+")");
		    	if(json.code == 1){
		    		$jskey.sso.show("注册成功！");
				}else if(json.code == 410){
		    		$jskey.sso.show("该账号已被注册");
				}else if(json.code == 406){
		    		$jskey.sso.show("验证码错误");
				}else{
					$jskey.sso.show(json);
				}
		    }
		});
		
	}
}

//获取验证码
function getCode() {
	var mobile = _$("mobile").value;
	if(checkMobile(mobile)){
		var codeMaxTime = 60;
		var self = $(this);
		ajax({method:"POST",url:"/sso/sms/code",
		    data:{"mobile":mobile,"appid":"CA1DB36591314A59EB5B449EF61D03E62"},
		    success: function(response) {
		    	var json= eval("("+response+")");
		    	if(json.code==1){
		    		self.hide().siblings().show();
		    		layer.msg('获取验证码成功！',{time: 1500});
		    		var codeClearTime = setInterval(function() {
		    			if (codeMaxTime > 0) {
		    				Math.floor(codeMaxTime % 60)
		    				$('.js-code-time').text(--codeMaxTime)
		    			} else {
		    				clearInterval(codeClearTime);
		    				codeMaxTime = 60;
		    				$('.js-code-time').text(codeMaxTime);
		    				self.show().siblings().hide();
		    			}
		    		}, 1000);
		    	}else{$jskey.sso.show({code:"4060"});}
		    }
		});
	}
}

</script>
</body>
</html>
