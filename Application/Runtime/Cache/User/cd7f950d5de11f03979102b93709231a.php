<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title><?php if(is_array($title)): foreach($title as $key=>$v): echo ($v["value"]); endforeach; endif; ?>安全应急响应中心</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/dev/Public/Home/css/bootstrap.min.css" rel="stylesheet">
		<link href="http://2.srcmsdemo.sinaapp.com/font-awesome.min.css" rel="stylesheet">
		<link href="/dev/Public/Home/index/carousel.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="/dev/Public/Home/css/styles.css" rel="stylesheet">
	</head>
 <body>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="yahei sr-only">Toggle navigation</span>
            <span class="yahei icon-bar"></span>
            <span class="yahei icon-bar"></span>
            <span class="yaheiicon-bar"></span>
          </button>
          <a class="yahei navbar-brand" href="/dev"><strong><?php if(is_array($title)): foreach($title as $key=>$v): echo ($v["value"]); endforeach; endif; ?></strong>
          <span class="yahei navbar-brand-subtitle">安全应急响应中心</span>
          </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
              <ul class="yahei nav navbar-nav">
             <li class="active"><a href="<?php echo U('index/index');?>">个人中心</a></li>
            </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

<body>
<div class="gallery">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
		<br/>
            <h3>登陆平台</h3><hr/>

            <form action="<?php echo U('login/login');?>" method="post">
                <div class="form-group">
                    <label for="exampleInputUser">用户名</label>
                    <input type="text" name="username" class="form-control" id="exampleInputUser" placeholder="用户名">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword">密码</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword" placeholder="密码">
                </div>
               <div class="form-group">
                    <label for="exampleInputCode"> 验证码</label>
                    <div class="row" >
                        <div class="col-md-8 row col-md-offset-0">
                            <input type="text"  name="verify" class="form-control" id="exampleInputCode" placeholder="验证码">
                        </div>
                        <div class="col-md-4">
                            <a href="javascript:void(0)"><img class="verify" src="<?php echo U('login/verify');?>" alt="点击刷新"/></a>
                        </div>
                    </div>
                </div>
				    <button type="submit" class="btn btn-default text-align">登陆</button><br/><br/>
					<a href="<?php echo U('forget/index');?>">找回密码</a><p></p>
					<a href="<?php echo U('reg/index');?>" style="float:left;">还没有账号？点击注册</a> 
                </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/dev/Public/User/js/jquery-1.10.2.js"></script>
<script>
    $(function(){
        $(".verify").click(function(){
            var src = "<?php echo U('login/verify');?>";
            var random = Math.floor(Math.random()*(1000+1));
            $(this).attr("src",src+"&random="+random);

        });
    })
</script>

<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3 text-center">
        <ul class="list-inline">
          <li><img src="/dev/Public/Home/pic/weibo.png" alt="weibo"/></li>
          <li><img src="/dev/Public/Home/pic/wechat.png" alt="wechat"/></li>
          <li><img src="/dev/Public/Home/pic/douban.png" alt="douban"/></li>
        </ul>
        <hr>
        <p>© 2016 <?php if(is_array($title)): foreach($title as $key=>$v): echo ($v["value"]); endforeach; endif; ?> · <a href="<?php echo U('index/index');?>">关于我们</a> · <a href="<?php echo U('index/index');?>">隐私协议</a></p>
		<p>Powered By SRCMS</p>
      </div>
    </div>
  </div>
</footer>



	<!-- script references -->
		<script src="/dev/Public/Home/js/jquery.min.js"></script>
		<script src="/dev/Public/Home/js/bootstrap.min.js"></script>
		<script src="/dev/Public/Home/js/scripts.js"></script>
	</body>
</html>