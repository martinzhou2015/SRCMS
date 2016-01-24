<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
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
