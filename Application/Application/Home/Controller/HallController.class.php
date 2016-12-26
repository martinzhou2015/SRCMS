<?php

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */

namespace Home\Controller;

use Think\Controller;

class HallController extends Controller{

     public function index()
    {
        $xuhao = 1;
        $model = M('member');
        $tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		// fix bug issued by phith0n  13:59 2016/1/25
        $user = $model->order('jifen ASC')->where('type=1')->where('jifen>0')->select();  
        $this->assign('title', $title);
	    $this ->assign('xuhao',$xuhao);
        $this->assign('user',getSortedCategory($user));
        $this->display();   
    }
}
