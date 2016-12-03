<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */

class IndexController extends BaseController {
    public function index(){
		$id = session('userId');
		$tmodel= M('setting');
		$gCount = M('links')->count();
		$title = $tmodel->where('id=1')->select();
		$page = M('post')->where('user_id='.$id)->count();
		$user = M('member')->where('id='.$id)->select();
		$this->assign('title', $title);
        $this->assign('page',$page);
		$this->assign('user',$user);
		$this->assign('gift',$gCount);
        $this->display();
    }
}