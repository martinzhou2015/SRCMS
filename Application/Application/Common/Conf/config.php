<?php
return array(
	'MODULE_ALLOW_LIST' =>    array('Home','Admin',),
	'LOAD_EXT_CONFIG'   => 'db', 
	/**
	URL不区分大小写
	**/
	'URL_CASE_INSENSITIVE'  =>  true,    
	'URL_MODEL'   =>0,
	'URL_HTML_SUFFIX'  =>'html',
	'SHOW_ERROR_MSG'        =>  true, 
	/**
	邮件服务配置
	**/
	'MAIL_ADDRESS'=>'xxxx@126.com',   // 此处填写邮箱地址
    'MAIL_SMTP'=>'smtp.126.com',      // 邮箱SMTP服务器（各家邮件服务提供商smtp服务器地址不同）
    'MAIL_LOGINNAME'=>'xxxxx',        // 邮箱登录帐号
    'MAIL_PASSWORD'=>'xxxxx',         // 邮箱密码（QQ邮箱登录密码不是QQ密码）
    'MAIL_CHARSET'=>'UTF-8',          // 邮件字符编码
    'MAIL_AUTH'=>true,                // 邮箱认证
    // true：发送的邮件正文为HTML格式 false：发送的邮件正文为TXT格式
    'MAIL_HTML'=>true,
	/**
    站点全局开启http-only
    **/	
	'COOKIE_HTTPONLY'  =>  ''
);