<?php
namespace Admin\Controller;
use Admin\Controller;

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
