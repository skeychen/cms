
$(function() {
    // tabs标签
    $(".js-tabs li").on("click", function () {
        $(this).addClass("active").siblings().removeClass("active");
        var tagName = $(this).attr("name");
        $("#" + tagName).show().siblings().hide();
    });


    // 网站底部当前年份
    $('.footerYearID').html(new Date().getFullYear());


    // 登录
    $('.js-login').on('click', function() {
        var url = $(this).attr('data-url');
        layer.open({
            type: 2,
            title: ['登 录', 'font-size:20px;font-weight:700'],
            shadeClose: true,
            area: ['360px', '550px'],
            content: url ,//iframe的url,
			// success: function(layero, index) {
			// 	layer.iframeAuto(index);
			// }
        }); 
    });
	
	// 注册
	$('.js-register').on('click', function() {
	    var url = $(this).attr('data-url');
	    layer.open({
	        type: 2,
	        title: ['注 册', 'font-size:20px;font-weight:700'],
	        shadeClose: true,
	        area: ['380px', '650px'],
	        content: url ,//iframe的url
	    });
	});
	

    //返回顶部
	$(".js-back-top").click(function() {
		$("body,html").animate({ scrollTop: 0 }, 500);
	});
	
	// 瀑布流
	if (document.querySelector('.masonry-grid')) {
		var $container = $('.masonry-grid');
		$container.imagesLoaded(function() {
			$container.masonry({  
				itemSelector : '.grid-item',
				columnWidth: 0
			});
		});
	}
	
	// 搜索条件更多选择
	$(".js-search-more").on("click", function () {
		var item = $(this).parent().find('.js-search-item');
		var arrow = $(this).find('.js-search-arrow');
		var text = $(this).find('.js-search-text');
		if ($(this).hasClass('open')) {
			$(this).removeClass('open');
			arrow.removeClass('vus-rotate-180');
			text.text('更多');
			item.css('height','24px');
		} else {
			$(this).addClass('open');
			arrow.addClass('vus-rotate-180');
			text.text('收起');
			item.css('height','auto');
		}
	});
	
	// 菜单申缩
	$(".js-menu-parent").click(function () {
		if ($(this).hasClass("down")) {
			$(this).removeClass("down").addClass("up");
		} else {
			$(this).removeClass("up").addClass("down");
		}
		$(this).parent().find(".js-menu-child").slideToggle()
	});
	
	
	// 注册tabs
	$('.js-register-tabs li').on('click', function() {
		$(this).addClass("mg-color-1 vus-border-bottom-3 vus-border--warning").siblings().removeClass("mg-color-1 vus-border-bottom-3 vus-border--warning");
		var tagName = $(this).attr("name");
		$("#" + tagName).show().siblings().hide();
	});
	
	// 获取验证码
	$('.js-get-code').on('click', function() {
		var codeMaxTime = 60;
		var self = $(this);
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
	});
	
});

// tabs标签2
function tabs(name, index, n, active) {
    active = active || '';
    for(var i = 1; i <= n; i++) {
        var tab = $('#'+name + i);
        var con = $('#'+name + '_' +i);
        if (active) {
            i == index ? tab.addClass(active) : tab.removeClass(active);
        } else {
            i == index ? tab.addClass('active') : tab.removeClass('active');
        }
        i == index ? con.show() : con.hide();
    }
}