<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

namespace Home\Controller;

use Think\Controller;

class HallController extends Controller{

    public function index($key="")
    {
        if($key == ""){
            $model = M('member');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('member')->where($where); 
        } 
        
        $user = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('jifen ASC')->where('type=1')->select();
	    $xuhao = 1;
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
        $this->assign('title', $title);
		$this -> assign('xuhao',$xuhao);
        $this->assign('user',getSortedCategory($user));
        $this->display();   
    }
}
