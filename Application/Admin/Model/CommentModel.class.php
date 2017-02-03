<?php
namespace Admin\Model;
use Think\Model;
class CommentModel extends Model{
    protected $_validate = array(
        array('content','require','请填写评论内容'), //默认情况下用正则进行验证
    );
    protected $_auto = array ( 
	    array('user_id','getUid',1,'callback'), // 对update_time字段在更新的时候写入当前时间戳
        array('update_time','time',1,'function'), // 对update_time字段在更新的时候写入当前时间戳
    );
    protected function getUid(){
    	return session('adminname');
    }
}