<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
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