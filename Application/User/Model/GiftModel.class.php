<?php
namespace User\Model;
use Think\Model;
class GiftModel extends Model{
	
    protected $_validate = array(
	    array('username','require','用户名缺失'), //默认情况下用正则进行验证
        array('realname','require','请填写真实姓名'), //默认情况下用正则进行验证
        array('zipcode','require','请填写邮编'), //默认情况下用正则进行验证
        array('location','require','请填写地址'), //默认情况下用正则进行验证
		array('tel','require','请填写联系电话'), //默认情况下用正则进行验证
		array('alipay','require','请填写支付宝账号，方便发放现金奖励'), //默认情况下用正则进行验证
		array('gid','require','请填写礼品名称'), //默认情况下用正则进行验证
    );
	
	protected $_auto = array ( 
        array('user_id','getUid',1,'callback'), // 对update_time字段在更新的时候写入当前用户ID
		array('username','getUsername',1,'callback'), // 对update_time字段在更新的时候写入当前用户名
    );
	
	protected function getUid(){
    	return session('userId');
    }
	
	protected function getUsername(){
    	return session('username');
    }
}