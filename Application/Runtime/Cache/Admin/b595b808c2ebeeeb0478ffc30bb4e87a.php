<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html class=" js no-touch csstransforms csstransforms3d svg" lang=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>控制台 - 企业安全应急响应与缺陷管理中心</title>
<meta name="description" content="">
<meta name="referrer" content="never">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
 
<script type="text/javascript" src="/temp/dev/Public/Static//ga.js"></script>

<link rel="stylesheet" href="/temp/dev/Public/Static//app.min.css">

<style type="text/css">.cf-hidden { display: none; } .cf-invisible { visibility: hidden; }</style>
</head>
<body class="wysihtml5-supported page-loaded" style="font-family:微软雅黑;">
 
<div class="pageload" style="display: none;">
<div class="pageload-inner">
<div class="sk-rotating-plane"></div>
</div>
</div>
 
<div class="app layout-fixed-header">
 
<div class="sidebar-panel offscreen-left ps-container ps-active-y" data-ps-id="4dd3008c-a74f-793d-e4fa-8a1e95729015">
<div class="brand">
 
<a href="<?php echo U('about/index');?>" class="toggle-apps hidden-xs">
<i class="icon-grid"></i>
</a>
 
 
<div class="toggle-offscreen">
<a href="javascript:;" class="visible-xs hamburger-icon" data-toggle="offscreen" data-move="ltr">
<span></span>
<span></span>
<span></span>
</a>
</div>
 
 
<a class="brand-logo">
<span>SRCMS</span>
</a>
<a href="http://reactor.nyasha.me/static/forms-editors.html#" class="small-menu-visible brand-logo">S</a>
 
</div>
 
<nav role="navigation">
<ul class="nav">
 
<li>
<a href="<?php echo U('index/index');?>">
<i class="icon-compass"></i>
<span>控制台</span>
</a>
</li> 
 
<li class="[report_status] menu-accordion">
<a href="javascript:;">
<!--<span class="badge pull-right"><?php echo ($post); ?></span>-->
<i class="icon-drop"></i>
<span>漏洞报告</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('post/index?key=1');?>">
<span style="color:[review_report_color];">报告审核</span>
</a>
</li>
<li>
<a href="<?php echo U('post/index');?>">
<span style="color:[report_color];">全部报告</span>
</a>
</li>
<li>
<a href="<?php echo U('category/index');?>">
<span style="color:[report_category_color];">漏洞分类</span>
</a>
</li>
</ul>
</li>
 
 
<!--<li class="menu-accordion">
<a href="javascript:;">
<i class="icon-cursor"></i>
<i class="icon-layers"></i>
<span>安全工单</span>
</a>
<ul class="sub-menu">
<li>
<a href="http://reactor.nyasha.me/static/apps-calendar.html">
<span>处理工单</span>
</a>
</li>
<li>
<a href="http://reactor.nyasha.me/static/apps-gallery.html">
<span>全部工单</span>
</a>
</li>
<li>
<a href="http://reactor.nyasha.me/static/apps-messages.html">
<span>搜索工单</span>
</a>
</li>
</ul>
</li>


<li class="menu-accordion">
<a href="javascript:;">
<i class="icon-notebook"></i>
<span>安全维基</span>
</a>
<ul class="sub-menu">
<li>
<a href="http://reactor.nyasha.me/static/apps-calendar.html">
<span>搜索维基</span>
</a>
</li>
<li>
<a href="http://reactor.nyasha.me/static/apps-gallery.html">
<span>分类百科</span>
</a>
</li>
</ul>
</li>-->

 
<li class="[links_status] menu-accordion">
<a href="javascript:;">
<i class="icon-bag"></i>
<span>礼品中心</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('gifts/index');?>">
<span style="color:[links_color]">礼品管理</span>
</a>
</li>
<li>
<a href="<?php echo U('order/index');?>">
<span style="color:[orders_color]">订单管理</span>
</a>
</li>
</ul>
</li>
 
 
<li class="[page_status] menu-accordion">
<a href="javascript:;">
<i class="icon-book-open"></i>
<span>博客公告</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('page/index');?>">
<span style="color:[page_color];">公告管理</span>
</a>
</li>
<li>
<a href="<?php echo U('blog/index');?>">
<span style="color:[blog_color];">博客管理</span>
</a>
</li>
</ul>
</li>
 
 
<!--<li class="open menu-accordion">-->
<li class="[users_status] menu-accordion">
<a href="javascript:;">
<i class="icon-users"></i>
<span>用户管理</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('member/index');?>">
<span style="color:[member_color]">前台用户</span>
</a>
</li>
<li>
<a href="<?php echo U('manager/index');?>">
<span style="color:[manager_color]">后台用户</span>
</a>
</li>
</ul>
</li>

 
<!--<li class="menu-accordion">
<a href="javascript:;">
<i class="icon-pie-chart"></i>
<span>数据中心</span>
</a>
<ul class="sub-menu">
<li>
<a href="javascript:;">
<span>图表汇总</span>
</a>
</li>
<li>
<a href="javascript:;">
<span>数据报告</span>
</a>
</li>
</ul>
</li>-->
 
<li class="[hall_status] menu-accordion">
<a href="javascript:;">
<i class="icon-trophy"></i>
<span>贡献管理</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('hall/index');?>">
<span style="color:[hall_color];">名人堂管理</span>
</a>
</li>
<li>
<a href="<?php echo U('hall/record');?>">
<span style="color:[jifen_color];">积分日志</span>
</a>
</li>
</ul>
</li>

<li class="[setting_status] menu-accordion">
<a href="javascript:;">
<i class="icon-equalizer"></i>
<span>系统设置</span>
</a>
<ul class="sub-menu">
<li>
<a href="<?php echo U('setting/index');?>">
<span style="color:[setting_color]">基础配置</span>
</a>
</li>
<!--<li>
<a href="<?php echo U('setting/other');?>">
<span style="color:[other_color]">其他配置</span>
</a>
</li>-->
<!--<li>
<a href="<?php echo U('setting/record');?>">
<span>登录日志</span>
</a>
</li>-->
</ul>
</li>
</ul>
</nav>
 
<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 703px; right: 0px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 562px;"></div></div></div>
 
 
<div class="main-panel">
 
<div class="header navbar">
<div class="brand visible-xs">
 
<div class="toggle-offscreen">
<a href="javascript:;" class="hamburger-icon visible-xs" data-toggle="offscreen" data-move="ltr">
<span></span>
<span></span>
<span></span>
</a>
</div>
 
 
<a class="brand-logo">
<span>SRCMS</span>
</a>
 
</div>
<ul class="nav navbar-nav hidden-xs">
<li>
<a href="javascript:;" class="small-sidebar-toggle ripple" data-toggle="layout-small-menu">
<i class="icon-toggle-sidebar"></i>
</a>
</li>
<!--<li class="searchbox">
<a href="javascript:;" data-toggle="search">
<i class="search-close-icon icon-close hide"></i>
<i class="search-open-icon icon-magnifier"></i>
</a>
</li>-->
<li class="navbar-form search-form hide">
<input type="search" class="form-control search-input" placeholder="Start typing...">
<div class="search-predict hide">
<a href="http://reactor.nyasha.me/static/forms-editors.html#">Searching for 'purple rain'</a>
<div class="heading">
<span class="title">People</span>
</div>
<ul class="predictive-list">
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//face1.jpg" class="img-circle" alt="">
<span>Tammy Carpenter</span>
</a>
</li>
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//face2.jpg" class="img-circle" alt="">
<span>Catherine Moreno</span>
</a>
</li>
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//face3.jpg" class="img-circle" alt="">
<span>Diana Robertson</span>
</a>
</li>
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//face4.jpg" class="img-circle" alt="">
<span>Emma Sullivan</span>
</a>
</li>
</ul>
<div class="heading">
<span class="title">Page posts</span>
</div>
<ul class="predictive-list">
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//img2.jpeg" class="img-rounded" alt="">
<span>The latest news for cloud-based developers </span>
</a>
</li>
<li>
<a class="avatar" href="http://reactor.nyasha.me/static/forms-editors.html#">
<img src="/temp/dev/Public/Static//img2.jpeg" class="img-rounded" alt="">
<span>Trending Goods of the Week</span>
</a>
</li>
</ul>
</div>
</li>
</ul>
<ul class="nav navbar-nav navbar-right hidden-xs">
<!--<li>
<a href="javascript:;" class="ripple" data-toggle="dropdown">
<span>EN</span>
<span class="caret"></span>
</a>
<ul class="dropdown-menu">
<li>
<a href="javascript:;">English</a>
</li>
<li>
<a href="javascript:;">Russian</a>
</li>
<li>
<a href="javascript:;">French</a>
</li>
<li>
<a href="javascript:;">Spanish</a>
</li>
</ul>
</li>-->
<li>
<!--<a href="javascript:;" class="ripple" data-toggle="dropdown">
<i class="icon-bell"></i>
</a>-->
<ul class="dropdown-menu notifications">
<li class="notifications-header">
<p class="text-muted small">You have 3 new messages</p>
</li>
<li>
<ul class="notifications-list">
<li>
<a href="javascript:;">
<div class="notification-icon">
<div class="circle-icon bg-success text-white">
<i class="icon-bulb"></i>
</div>
</div>
<span class="notification-message"><b>Sean</b> launched a new application</span>
<span class="time">2s</span>
</a>
</li>
<li>
<a href="javascript:;">
<div class="notification-icon">
<div class="circle-icon bg-danger text-white">
<i class="icon-cursor"></i>
</div>
</div>
<span class="notification-message"><b>Removed calendar</b> from app list</span>
<span class="time">4h</span>
</a>
</li>
<li>
<a href="javascript:;">
<div class="notification-icon">
<div class="circle-icon bg-primary text-white">
<i class="icon-basket"></i>
</div>
</div>
<span class="notification-message"><b>Denise</b> bought <b>Urban Admin Kit</b></span>
<span class="time">2d</span>
</a>
</li>
<li>
<a href="javascript:;">
<div class="notification-icon">
<div class="circle-icon bg-info text-white">
<i class="icon-bubble"></i>
</div>
</div>
<span class="notification-message"><b>Vincent commented</b> on an item</span>
<span class="time">2s</span>
</a>
</li>
<li>
<a href="javascript:;">
<span class="notification-icon">
<img src="/temp/dev/Public/Static//face3.jpg" class="avatar img-circle" alt="">
</span>
<span class="notification-message"><b>Jack Hunt</b> has <b>joined</b> mailing list</span>
<span class="time">9d</span>
</a>
</li>
</ul>
</li>
</ul>
</li>
<li>
<a href="javascript:;" class="ripple" data-toggle="dropdown">
<img src="/temp/dev/Public/Static//avatar.jpg" class="header-avatar img-circle" alt="user" title="user">
<span><?php echo session('adminname');?> </span>
<span class="caret"></span>
</a>
<ul class="dropdown-menu">
<li>
<a href="<?php echo U('manager/update?id='); echo session('adminId');?>">个人设置</a>
</li>
<li>
<!--<a href="javascript:;">Upgrade</a>
</li>
<li>
<a href="javascript:;">
<span class="label bg-danger pull-right">34</span>
<span>Notifications</span>
</a>
</li>-->
<li role="separator" class="divider"></li>
<!--<li>
<a href="javascript:;">使用帮助</a>
</li>-->
<li>
<a href="<?php echo U('login/logout');?>">退出</a>
</li>
</ul>
</li>
<!--<li>
<a href="javascript:;" class="ripple" data-toggle="layout-chat-open">
<i class="icon-user"></i>
</a>
</li>-->
</ul>
</div>
 
 
<div class="main-content" style="font-family:微软雅黑">
<div class="m-x-n-g m-t-n-g overflow-hidden">
<div class="card m-b-0 bg-primary-dark text-white p-a-md no-border">
<h4 class="m-t-0">
<span class="pull-right" style="font-family:微软雅黑">本周共计 109 份报告</span>
<span style="font-family:微软雅黑">总缺陷趋势</span>
</h4>
<div class="chart dashboard-line labels-white" style="height: 300px; padding: 0px; position: relative;"><canvas class="flot-base" width="1014" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1014px; height: 300px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 17px; text-align: center;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 140px; text-align: center;">1</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 263px; text-align: center;">2</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 386px; text-align: center;">3</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 510px; text-align: center;">4</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 633px; text-align: center;">5</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 756px; text-align: center;">6</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 879px; text-align: center;">7</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 114px; top: 281px; left: 1003px; text-align: center;">8</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 267px; left: 8px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 234px; left: 1px; text-align: right;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 200px; left: 1px; text-align: right;">20</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 167px; left: 1px; text-align: right;">30</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 134px; left: 1px; text-align: right;">40</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 100px; left: 1px; text-align: right;">50</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 67px; left: 1px; text-align: right;">60</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 33px; left: 1px; text-align: right;">70</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 0px; left: 1px; text-align: right;">80</div></div></div><canvas class="flot-overlay" width="1014" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1014px; height: 300px;"></canvas></div>
</div>
<div class="card bg-white no-border">
<div class="row text-center">
<div class="col-sm-3 col-xs-6 p-t p-b">
<h4 class="m-t-0 m-b-0"><a href="<?php echo U('post/index');?>"><?php echo ($post); ?></a></h4>
<small class="text-muted bold"><a href="<?php echo U('post/index');?>">漏洞报告</a></small>
</div>
<div class="col-sm-3 col-xs-6 p-t p-b">
<h4 class="m-t-0 m-b-0"><a href="<?php echo U('page/index');?>"><?php echo ($page); ?></a></h4>
<small class="text-muted bold"><a href="<?php echo U('page/index');?>">安全公告</a></small>
</div>
<div class="col-sm-3 col-xs-6 p-t p-b">
<h4 class="m-t-0 m-b-0"><a href="<?php echo U('member/index');?>"><?php echo ($user); ?></a></h4>
<small class="text-muted bold"><a href="<?php echo U('member/index');?>">注册用户</a></small>
</div>
<div class="col-sm-3 col-xs-6 p-t p-b">
<h4 class="m-t-0 m-b-0"><a href="<?php echo U('order/index');?>"><?php echo ($order); ?></a></h4>
<small class="text-muted bold">礼品订单</small>
</div>
</div>
</div>
</div>

<!--<div class="row">
<div class="col-sm-6">
<div class="card card-block no-border bg-danger text-white">
<h6 class="m-a-0" style="font-family:微软雅黑;">未审核报告</h6>
<h1 class="m-a-0">785</h1>
</div>
</div>
<div class="col-sm-6">
<div class="card card-block no-border bg-dark text-white">
<h6 class="m-a-0" style="font-family:微软雅黑;">未结单报告</h6>
<h1 class="m-a-0">381</h1>
</div>
</div>
</div>-->

<div class="row">
</div>
<div class="row">
<div class="col-sm-12">
<div class="no-more-tables">
    <table class="table m-b-0">
        <thead>
            <tr>
                <th>公告标题</th>
                <th>发布时间</th>
            </tr>
        </thead>
        <tbody>
		<?php if(is_array($detail)): foreach($detail as $key=>$v): ?><tr>
                <td data-title="报告标题"><a href="<?php echo U('page/update?id='); echo ($v["id"]); ?>"><?php echo ($v["title"]); ?></a></td>
                <td data-title="报告时间"><?php echo (date("Y/m/d",$v["update_time"])); ?></td>
        </tr><?php endforeach; endif; ?>
        </tbody>
    </table>
	</div>
</div>
</div>


</div>
</div>
</div>


 
</div>

<!--<footer class="content-footer">
<nav class="footer-right">
<ul class="nav">
<li>
<a href="javascript:;">SRCMS</a>
</li>
<li>
<a href="javascript:;" class="scroll-up">
<i class="fa fa-angle-up"></i>
</a>
</li>
</ul>
</nav>
<nav class="footer-left hidden-xs">
<ul class="nav">
<li>
<a href="javascript:;">建议反馈</a>
</li>
<li>
<a href="javascript:;">隐私政策</a>
</li>
<li>
<a href="javascript:;">用户协议</a>
</li>
<li>
<a href="javascript:;">使用帮助</a>
</li>
</ul>
</nav>
</footer>
</div>-->

 
 
</div>
<script src="/temp/dev/Public/Static//app.min.js"></script><div class="bg-default"></div><div class="bg-primary"></div><div class="bg-success"></div><div class="bg-warning"></div><div class="bg-danger"></div><div class="bg-info"></div><div class="bg-white"></div><div class="bg-dark"></div>
 
<script src="/temp/dev/Public/Static//bootstrap3-wysihtml5.all.min.js"></script>
<script src="/temp/dev/Public/Static//summernote.min.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.resize.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.categories.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.stack.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.time.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.pie.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.spline.js"></script>
<script src="/temp/dev/Public/Static//jquery.flot.orderBars.js"></script>
  
<script src="/temp/dev/Public/Static//sameheight.js"></script>
<script src="/temp/dev/Public/Static//dashboard.js"></script>
<script src="/temp/dev/Public/Static//wysiwyg.js"></script><div class="note-popover popover in note-link-popover bottom" style="display: none;">  <div class="arrow"></div>  <div class="popover-content note-children-container"><span><a target="_blank"></a>&nbsp;</span><div class="note-btn-group btn-group note-link"><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Edit"><i class="note-icon-link"></i></button><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Unlink"><i class="note-icon-chain-broken"></i></button></div></div></div><div class="note-popover popover in note-image-popover bottom" style="display: none;">  <div class="arrow"></div>  <div class="popover-content note-children-container"><div class="note-btn-group btn-group note-imagesize"><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Resize Full"><span class="note-fontsize-10">100%</span></button><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Resize Half"><span class="note-fontsize-10">50%</span></button><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Resize Quarter"><span class="note-fontsize-10">25%</span></button></div><div class="note-btn-group btn-group note-float"><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Float Left"><i class="note-icon-align-left"></i></button><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Float Right"><i class="note-icon-align-right"></i></button><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Float None"><i class="note-icon-align-justify"></i></button></div><div class="note-btn-group btn-group note-remove"><button type="button" class="note-btn btn btn-default btn-sm" title="" data-original-title="Remove Image"><i class="note-icon-trash"></i></button></div></div></div>
 

</body></html>