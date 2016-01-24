<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
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
