<?php
namespace User\Model;
use Think\Model;
class ChangeModel extends Model{
    protected $_validate = array(
        array('oldpassword','require','请填写旧密码！'), //默认情况下用正则进行验证
		array('password','require','请填写密码！','','',self::MODEL_INSERT), //默认情况下用正则进行验证
     	array('repassword','password','确认密码不正确',0,'confirm'), // 验证确认密码是否和密码一致
    );

}