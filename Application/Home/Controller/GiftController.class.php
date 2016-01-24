<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

namespace Home\Controller;

use Think\Controller;

class GiftController extends Controller{

    public function index(){
		$gift = M('links')->select();
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
        $this->assign('title', $title);
        $this->assign('gift',$gift);
        $this->display();
    }
}
