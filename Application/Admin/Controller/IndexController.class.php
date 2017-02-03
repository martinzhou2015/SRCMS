<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


class IndexController extends BaseController{

    public function index(){
		$page = M('page')->count();
		$user = M('member')->count();
		$post = M('post')->count();
		$detail = M('page')->select();
		$order = M('order')->count();
        $this->assign('page',$page);
		$this->assign('user',$user);
		$this->assign('post',$post);
		$this->assign('order',$order);
		$this->assign('detail',$detail);
        $this->display();
    }
}
