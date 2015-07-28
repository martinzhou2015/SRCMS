<?php

$SITE_URL = "******";
define('URL_CALLBACK', "" . $SITE_URL . "index.php/Login/callback?type=");
return array(

    //腾讯QQ登录配置
    'THINK_SDK_QQ' => array(
        'APP_KEY' => '******', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '******', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'qq',
    ),
    //新浪微博配置
    'THINK_SDK_SINA' => array(
        'APP_KEY' => '******', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '******', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'sina',
    ),
    //人人网配置
    'THINK_SDK_RENREN' => array(
        'APP_KEY' => '******', //应用注册成功后分配的 APP ID
        'APP_SECRET' => '******', //应用注册成功后分配的KEY
        'CALLBACK' => URL_CALLBACK . 'renren',
    )
);
