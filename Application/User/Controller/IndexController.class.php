<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


class IndexController extends BaseController {
    public function index(){
		$id = session('userId');
		$username = session('username');
		$pnum = M('post')->where('user_id='.$id)->count();
		$jinbi = M('member')->where('id='.$id)->find();
		$gift = M('order')->where(array('username'=>$username,'userid'=>$id))->count();
		$page = M('page')->select();
        $this->assign('pnum',$pnum);
		$this->assign('jinbi',$jinbi);
		$this->assign('gift',$gift);
		$this->assign('page',$page);
        $this->display();
    }
}