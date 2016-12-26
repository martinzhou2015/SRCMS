<?php
namespace Admin\Model;
use Think\Model;
class PageModel extends Model{
    protected $_validate = array(
        array('title','require','请填写单页标题！'), //默认情况下用正则进行验证
        array('name','require','请填写单页别名！'), //默认情况下用正则进行验证
        array('name','','单页别名已经存在！',0,'unique',self::MODEL_BOTH), // 在新增的时候验证name字段是否唯一
    );
}