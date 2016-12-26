<?php
namespace Admin\Model;
use Think\Model;
class LinksModel extends Model{
    protected $_validate = array(
        array('name','require','请填写链接标题！'), //默认情况下用正则进行验证
        array('url','require','请填写链接！'), //默认情况下用正则进行验证
    );
}