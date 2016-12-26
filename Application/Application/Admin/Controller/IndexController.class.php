<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */

class IndexController extends BaseController{

    public function index(){
		$page = M('page')->count();
		$user = M('member')->count();
		$post = M('post')->count();
		$links = M('links')->count();
        $this->assign('page',$page);
		$this->assign('user',$user);
		$this->assign('post',$post);
		$this->assign('links',$links);
        $this->display();
    }
}
