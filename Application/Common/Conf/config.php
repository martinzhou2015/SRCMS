<?php
return array(
	//'配置项' =>'配置值'
	'MODULE_ALLOW_LIST' =>    array('Home','Admin',),
	//我们用了入口版定 所以下面这行可以注释掉
	//'DEFAULT_MODULE'    =>    'Home',  // 默认模块	
	//'SHOW_PAGE_TRACE'   =>  flase, 
	'LOAD_EXT_CONFIG'   => 'db', 
	'URL_CASE_INSENSITIVE'  =>  true,  //url不区分大小写
	'URL_MODEL'   =>0,
	'URL_HTML_SUFFIX'  =>'html',
	//'DEFAULT_FILTER'        => 'htmlspecialchars',
	'SUPER_ADMIN_ID'=>1,  //超级管理员id 删除用户的时候用这个禁止删除
	'SHOW_ERROR_MSG'        =>  true, 
	//用户注册默认信息
	'DEFAULT_SCORE'=>100,
	'MAIL_ADDRESS'=>'xxxx@126.com', // 此处填写邮箱地址
    'MAIL_SMTP'=>'smtp.126.com', // 邮箱SMTP服务器
    'MAIL_LOGINNAME'=>'xxxxx', // 邮箱登录帐号
    'MAIL_PASSWORD'=>'xxxxx', // 邮箱密码
    'MAIL_CHARSET'=>'UTF-8',//编码
    'MAIL_AUTH'=>true,//邮箱认证
    'MAIL_HTML'=>true,//true HTML格式 false TXT格式
	'COOKIE_HTTPONLY'  =>  ''
);