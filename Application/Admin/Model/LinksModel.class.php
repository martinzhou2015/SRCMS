<?php
namespace Admin\Model;
use Think\Model;
class LinksModel extends Model{
    protected $_validate = array(
        array('title','require','请填写礼品名称！'),
        array('url','require','请填写图片链接！'), 
        array('sort','require','请填写礼品分类'),
		array('price','require','请填写礼品价格'),
    );
}