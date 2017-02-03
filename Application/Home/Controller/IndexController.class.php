<?php

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller{

    public function index(){
		$model = M('hall');
		$tmodel= M('setting');
		$amodel = M('page');
		$title = $tmodel->where('id=1')->select();
		$hall = $model->order('id DESC')->select();
		$advisories = $amodel -> select();
        $this->assign('model', $hall);
		$this->assign('title', $title);
		$this->assign('advisories', $advisories);
        $this->display();
    }
}
