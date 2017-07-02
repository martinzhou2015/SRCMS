<?php

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


namespace Home\Controller;

use Think\Controller;

class HallController extends Controller{

     public function index()
    {
        $xuhao = 1;
        $model = M('member');
		$tmodel= M('setting');
		$settings = $tmodel -> where('id=1') -> select();
        $user = $model->order('jifen DESC')->where('jifen>0')->select();  
		$this->assign('settings', $settings);
		$this ->assign('xuhao',$xuhao);
        $this->assign('user',$user);
        $this->display();   
    }
	
    public function view()
    {
		$pid = I('get.pid',0,'number_int');
		$model = M('member');
		$report = M('post');
		$tmodel= M('setting');
		$settings = $tmodel -> where('id=1') -> select();
		$this->assign('settings', $settings);
		$user = $model -> where(array('pid'=>$pid)) -> select();
		$uid = $user[0]['id'];
		if ($uid != null){
		$reportnum = $report->where(array('user_id'=>$uid))->count();
		$highranknum = $report->where(array('user_id'=>$uid))->where('rank=4')->count();
		$this->assign('num',$reportnum);
		$this->assign('highranknum',$highranknum);
		};
		$this->assign('user',$user);
        $this->display();   
    }
}
