'use strict';/*! main.js - v0.1.1
* http://admindesigns.com/
* Copyright (c) 2015 Admin Designs;*/var Core = function (options) {
    var Window = $(window); var Body = $('body'); var Navbar = $('.navbar'); var Topbar = $('#topbar'); var windowH = Window.height(); var bodyH = Body.height(); var navbarH = 0; var topbarH = 0; if (Navbar.is(':visible')) { navbarH = Navbar.height(); }
    if (Topbar.is(':visible')) { topbarH = Topbar.height(); }
    var contentHeight = windowH - (navbarH + topbarH); var runSideMenu = function (options) {
        if ($('.nano.affix').length) { $(".nano.affix").nanoScroller({ preventPageScrolling: true }); }
        var sidebarLeftToggle = function () {
            if ($('body.sb-top').length) { return; }
            if (Body.hasClass('sb-l-c') && options.collapse === "sb-l-m") { Body.removeClass('sb-l-c'); }
            Body.toggleClass(options.collapse).removeClass('sb-r-o').addClass('sb-r-c'); triggerResize();
        }; var sidebarRightToggle = function () {
            if ($('body.sb-top').length) { return; }
            if (options.siblingRope === true && !Body.hasClass('mobile-view') && Body.hasClass('sb-r-o')) { Body.toggleClass('sb-r-o sb-r-c').toggleClass(options.collapse); }
            else { Body.toggleClass('sb-r-o sb-r-c').addClass(options.collapse); }
            triggerResize();
        }; var sidebarTopToggle = function () { Body.toggleClass('sb-top-collapsed'); }; $('.sidebar-toggle-mini').on('click', function (e) {
            e.preventDefault(); if ($('body.sb-top').length) { return; }
            Body.addClass('sb-l-c'); triggerResize(); if (!Body.hasClass('mobile-view')) { setTimeout(function () { Body.toggleClass('sb-l-m sb-l-o'); }, 250); }
        }); var sbOnLoadCheck = function () {
            if ($('body.sb-top').length) {
                if ($(window).width() < 900) { Body.addClass('sb-top-mobile').removeClass('sb-top-collapsed'); }
                return;
            }
            if (!$('body.sb-l-o').length && !$('body.sb-l-m').length && !$('body.sb-l-c').length) { $('body').addClass(options.sbl); }
            if (!$('body.sb-r-o').length && !$('body.sb-r-c').length) { $('body').addClass(options.sbr); }
            if (Body.hasClass('sb-l-m')) { Body.addClass('sb-l-disable-animation'); }
            else { Body.removeClass('sb-l-disable-animation'); }
            if ($(window).width() < 1080) { Body.removeClass('sb-r-o').addClass('mobile-view sb-l-m sb-r-c'); }
            resizeBody();
        }; var sbOnResize = function () {
            if ($('body.sb-top').length) {
                if ($(window).width() < 900 && !Body.hasClass('sb-top-mobile')) { Body.addClass('sb-top-mobile'); } else if ($(window).width() > 900) { Body.removeClass('sb-top-mobile'); }
                return;
            }
            if ($(window).width() < 1080 && !Body.hasClass('mobile-view')) { Body.removeClass('sb-r-o').addClass('mobile-view sb-l-m sb-r-c'); } else if ($(window).width() > 1080) { Body.removeClass('mobile-view'); } else { return; }
            resizeBody();
        }; var resizeBody = function () { var sidebarH = $('#sidebar_left').outerHeight(); var cHeight = (topbarH + navbarH + sidebarH); Body.css('min-height', cHeight); }; var triggerResize = function () {
            setTimeout(function () {
                $(window).trigger('resize'); if (Body.hasClass('sb-l-m')) { Body.addClass('sb-l-disable-animation'); }
                else { Body.removeClass('sb-l-disable-animation'); }
            }, 300)
        }; sbOnLoadCheck(); $("#toggle_sidemenu_t").on('click', sidebarTopToggle); $("#toggle_sidemenu_l").on('click', sidebarLeftToggle); $("#toggle_sidemenu_r").on('click', sidebarRightToggle); var rescale = function () { sbOnResize(); }
        var lazyLayout = _.debounce(rescale, 300); $(window).resize(lazyLayout); var authorWidget = $('#sidebar_left .author-widget'); $('.sidebar-menu-toggle').on('click', function (e) {
            e.preventDefault(); if ($('body.sb-top').length) { return; }
            if (authorWidget.is(':visible')) { authorWidget.toggleClass('menu-widget-open'); }
            $('.menu-widget').toggleClass('menu-widget-open').slideToggle('fast');
        }); $('.sidebar-menu li a.accordion-toggle').on('click', function (e) {
            e.preventDefault(); if ($('body').hasClass('sb-l-m') && !$(this).parents('ul.sub-nav').length) { return; }
            if (!$(this).parents('ul.sub-nav').length) {
                if ($(window).width() > 900) { if ($('body.sb-top').length) { return; } }
                $('a.accordion-toggle.menu-open').next('ul').slideUp('fast', 'swing', function () { $(this).attr('style', '').prev().removeClass('menu-open'); });
            }
            else {
                var activeMenu = $(this).next('ul.sub-nav'); var siblingMenu = $(this).parent().siblings('li').children('a.accordion-toggle.menu-open').next('ul.sub-nav')
                activeMenu.slideUp('fast', 'swing', function () { $(this).attr('style', '').prev().removeClass('menu-open'); }); siblingMenu.slideUp('fast', 'swing', function () { $(this).attr('style', '').prev().removeClass('menu-open'); });
            }
            if (!$(this).hasClass('menu-open')) { $(this).next('ul').slideToggle('fast', 'swing', function () { $(this).attr('style', '').prev().toggleClass('menu-open'); }); }
        });
    }
    var runFooter = function () { var pageFooterBtn = $('.footer-return-top'); if (pageFooterBtn.length) { pageFooterBtn.smoothScroll({ offset: -55 }); } }
    var runHelpers = function () {
        $.fn.disableSelection = function () { return this.attr('unselectable', 'on').css('user-select', 'none').on('selectstart', false); }; $.fn.hasScrollBar = function () { return this.get(0).scrollHeight > this.height(); }
        function msieversion() {
            var ua = window.navigator.userAgent; var msie = ua.indexOf("MSIE "); if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
                var ieVersion = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))); if (ieVersion === 9) { $('body').addClass('no-js ie' + ieVersion); }
                return ieVersion;
            }
            else { return false; }
        }
        msieversion(); setTimeout(function () { $('#content').removeClass('animated fadeIn'); }, 800);
    }
    var runAnimations = function () {
        if (!$('body.boxed-layout').length) { setTimeout(function () { $('body').addClass('onload-check'); }, 100); }
        $('.animated-delay[data-animate]').each(function () {
            var This = $(this)
            var delayTime = This.data('animate'); var delayAnimation = 'fadeIn'; if (delayTime.length > 1 && delayTime.length < 3) { delayTime = This.data('animate')[0]; delayAnimation = This.data('animate')[1]; }
            var delayAnimate = setTimeout(function () { This.removeClass('animated-delay').addClass('animated ' + delayAnimation).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () { This.removeClass('animated ' + delayAnimation); }); }, delayTime);
        }); $('.animated-waypoint').each(function (i, e) {
            var This = $(this); var Animation = This.data('animate'); var offsetVal = '35%'; if (Animation.length > 1 && Animation.length < 3) { Animation = This.data('animate')[0]; offsetVal = This.data('animate')[1]; }
            var waypoint = new Waypoint({
                element: This, handler: function (direction) {
                    console.log(offsetVal)
                    if (This.hasClass('animated-waypoint')) { This.removeClass('animated-waypoint').addClass('animated ' + Animation).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () { This.removeClass('animated ' + Animation); }); }
                }, offset: offsetVal
            });
        });
    }
    var runHeader = function () {
        $('.navbar-search').on('click', function (e) {
            var This = $(this); var searchForm = This.find('input'); var searchRemove = This.find('.search-remove'); if ($('body.mobile-view').length || $('body.sb-top-mobile').length) {
                This.addClass('search-open'); if (!searchRemove.length) { This.append('<div class="search-remove"></div>'); }
                setTimeout(function () { This.find('.search-remove').fadeIn(); searchForm.focus().one('keydown', function () { $(this).val(''); }); }, 250)
                if ($(e.target).attr('class') == 'search-remove') { This.removeClass('search-open').find('.search-remove').remove(); }
            }
        }); if ($("#user-status").length) { $('#user-status').multiselect({ buttonClass: 'btn btn-default btn-sm', buttonWidth: 100, dropRight: false }); }
        if ($("#user-role").length) { $('#user-role').multiselect({ buttonClass: 'btn btn-default btn-sm', buttonWidth: 100, dropRight: true }); }
        $('.dropdown-menu').on('click', function (e) {
            e.stopPropagation(); var Target = $(e.target); var TargetGroup = Target.parents('.btn-group'); var SiblingGroup = Target.parents('.dropdown-menu').find('.btn-group'); if (Target.hasClass('multiselect') || Target.parent().hasClass('multiselect')) { SiblingGroup.removeClass('open'); TargetGroup.addClass('open'); }
            else { SiblingGroup.removeClass('open'); }
        }); var menu = $('#topbar-dropmenu'); var items = menu.find('.metro-tile'); var metroBG = $('.metro-modal'); $('.topbar-menu-toggle').on('click', function () {
            if (menu.hasClass('alt')) { menu.slideToggle(230).toggleClass('topbar-menu-open'); metroBG.fadeIn(); }
            else {
                menu.slideToggle(230).toggleClass('topbar-menu-open'); $(items).addClass('animated animated-short fadeInDown').css('opacity', 1); if (!metroBG.length) { metroBG = $('<div class="metro-modal"></div>').appendTo('body'); }
                setTimeout(function () { metroBG.fadeIn(); }, 380);
            }
        }); $('body').on('click', '.metro-modal', function () { metroBG.fadeOut('fast'); setTimeout(function () { menu.slideToggle(150).toggleClass('topbar-menu-open'); }, 250); });
    }
    var runTrays = function () {
        var trayFormat = $('#content .tray'); if (trayFormat.length) { trayFormat.each(function (i, e) { var This = $(e); var trayScroll = This.find('.tray-scroller'); This.height(contentHeight); trayScroll.height(contentHeight); if (trayScroll.length) { trayScroll.scroller(); } }); $('#content').scrollLock('on', 'div'); }; var rescale = function () {
            if ($(window).width() < 1000) { Body.addClass('tray-rescale'); }
            else { Body.removeClass('tray-rescale tray-rescale-left tray-rescale-right'); }
        }
        var lazyLayout = _.debounce(rescale, 300); if (!Body.hasClass('disable-tray-rescale')) { $(window).resize(lazyLayout); rescale(); }
        var navAnimate = $('.tray-nav[data-nav-animate]'); if (navAnimate.length) {
            var Animation = navAnimate.data('nav-animate'); if (Animation == null || Animation == true || Animation == "") { Animation = "fadeIn"; }
            setTimeout(function () { navAnimate.find('li').each(function (i, e) { var Timer = setTimeout(function () { $(e).addClass('animated animated-short ' + Animation); }, 50 * i); }); }, 500);
        }
        var dataTray = $('.tray[data-tray-mobile]'); var dataAppend = dataTray.children(); function fcRefresh() {
            if ($('body').width() < 585) { dataAppend.appendTo($(dataTray.data('tray-mobile'))); }
            else { dataAppend.appendTo(dataTray); }
        }; fcRefresh(); var fcResize = function () { fcRefresh(); }
        var fcLayout = _.debounce(fcResize, 300); $(window).resize(fcLayout);
    }
    var runFormElements = function () {
        var Tooltips = $("[data-toggle=tooltip]"); if (Tooltips.length) { if (Tooltips.parents('#sidebar_left')) { Tooltips.tooltip({ container: $('body'), template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>' }); } else { Tooltips.tooltip(); } }
        var Popovers = $("[data-toggle=popover]"); if (Popovers.length) { Popovers.popover(); }
        $('.dropdown-menu.dropdown-persist').on('click', function (e) { e.stopPropagation(); }); $('.dropdown-menu .nav-tabs li a').on('click', function (e) { e.preventDefault(); e.stopPropagation(); $(this).tab('show') }); $('.dropdown-menu .btn-group-nav a').on('click', function (e) { e.preventDefault(); e.stopPropagation(); $(this).siblings('a').removeClass('active').end().addClass('active').tab('show'); }); if ($('.btn-states').length) { $('.btn-states').on('click', function () { $(this).addClass('active').siblings().removeClass('active'); }); }
        var panelScroller = $('.panel-scroller'); if (panelScroller.length) {
            panelScroller.each(function (i, e) {
                var This = $(e); var Delay = This.data('scroller-delay'); var Margin = 5; if (This.hasClass('scroller-thick')) { Margin = 0; }
                var DropMenuParent = This.parents('.dropdown-menu'); if (DropMenuParent.length) { DropMenuParent.prev('.dropdown-toggle').on('click', function () { setTimeout(function () { This.scroller(); $('.navbar').scrollLock('on', 'div'); }, 50); }); return; }
                if (Delay) { var Timer = setTimeout(function () { This.scroller({ trackMargin: Margin, }); $('#content').scrollLock('on', 'div'); }, Delay); }
                else { This.scroller({ trackMargin: Margin, }); $('#content').scrollLock('on', 'div'); }
            });
        }
        var SmoothScroll = $('[data-smoothscroll]'); if (SmoothScroll.length) { SmoothScroll.each(function (i, e) { var This = $(e); var Offset = This.data('smoothscroll'); var Links = This.find('a'); Links.smoothScroll({ offset: Offset }); }); }
    }
    return { init: function (options) { var defaults = { sbl: "sb-l-o", sbr: "sb-r-c", sbState: "save", collapse: "sb-l-m", siblingRope: true }; var options = $.extend({}, defaults, options); runHelpers(); runAnimations(); runHeader(); runSideMenu(options); runFooter(); runTrays(); runFormElements(); } }
}(); var bgPrimary = '#4a89dc', bgPrimaryL = '#5d9cec', bgPrimaryLr = '#83aee7', bgPrimaryD = '#2e76d6', bgPrimaryDr = '#2567bd', bgSuccess = '#70ca63', bgSuccessL = '#87d37c', bgSuccessLr = '#9edc95', bgSuccessD = '#58c249', bgSuccessDr = '#49ae3b', bgInfo = '#3bafda', bgInfoL = '#4fc1e9', bgInfoLr = '#74c6e5', bgInfoD = '#27a0cc', bgInfoDr = '#2189b0', bgWarning = '#f6bb42', bgWarningL = '#ffce54', bgWarningLr = '#f9d283', bgWarningD = '#f4af22', bgWarningDr = '#d9950a', bgDanger = '#e9573f', bgDangerL = '#fc6e51', bgDangerLr = '#f08c7c', bgDangerD = '#e63c21', bgDangerDr = '#cd3117', bgAlert = '#967adc', bgAlertL = '#ac92ec', bgAlertLr = '#c0b0ea', bgAlertD = '#815fd5', bgAlertDr = '#6c44ce', bgSystem = '#37bc9b', bgSystemL = '#48cfad', bgSystemLr = '#65d2b7', bgSystemD = '#2fa285', bgSystemDr = '#288770', bgLight = '#f3f6f7', bgLightL = '#fdfefe', bgLightLr = '#ffffff', bgLightD = '#e9eef0', bgLightDr = '#dfe6e9', bgDark = '#3b3f4f', bgDarkL = '#424759', bgDarkLr = '#51566c', bgDarkD = '#2c2f3c', bgDarkDr = '#1e2028', bgBlack = '#283946', bgBlackL = '#2e4251', bgBlackLr = '#354a5b', bgBlackD = '#1c2730', bgBlackDr = '#0f161b';