<?php

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


namespace Home\Controller;

use Think\Controller;

class PageController extends Controller{

    public function index()
    {
        $model = M('page');
		$tmodel= M('setting');		
		$pages = $model->limit(15)->select();
		$title = $tmodel->where('id=1')->select();
        $this->assign('title', $title);
        $this->assign('model', $pages);
        $this->display();     
    }


    public function view(){
		$id = I('get.id',0,'intval');
        $model = M('page')->where(array('id'=>$id))->find();
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
        $this->assign('title', $title);
        $this->assign('model',$model);
        $this->display();
    }
}
