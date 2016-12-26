<?php

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller{

    public function index(){
		$model = M('hall');
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$hall = $model->order('id DESC')->select();
        $this->assign('model', $hall);
		$this->assign('title', $title);
        $this->display();
    }
}
