<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 2015-07-27
 * @copyright ©2105-2018 SRCMS
 * @homepage http://www.src.pw
 * @version 1.0
 */

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller{

    public function index(){
		$model = M('page')->limit(5)->select();
		$hall = M('hall')->limit(6)->select();
        $this->assign('model',$model);
		$this->assign('hall',$hall);
        $this->display();
    }
}
