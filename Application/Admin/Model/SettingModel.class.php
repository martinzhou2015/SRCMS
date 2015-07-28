<?php
namespace Admin\Model;
use Think\Model;
class SettingModel extends Model{
    protected $_validate = array(
        array('key','require','请填写字段名！'), //默认情况下用正则进行验证
        array('value','require','请填写字段值！'), //默认情况下用正则进行验证
        array('description','require','请填写字段描述！'), //默认情况下用正则进行验证
        array('key','','字段名已经存在！',0,'unique',self::MODEL_BOTH), // 在新增的时候验证name字段是否唯一
    );
}