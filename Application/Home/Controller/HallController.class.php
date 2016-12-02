<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 13:59 2016/1/25
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
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
        $user = $model->order('jifen ASC')->where('type=1')->where('jifen>0')->select();  // fix bug issued by phith0n  13:59 2016/1/25
        $this->assign('title', $title);
	$this ->assign('xuhao',$xuhao);
        $this->assign('user',getSortedCategory($user));
        $this->display();   
    }
}
