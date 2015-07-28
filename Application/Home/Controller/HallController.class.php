<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 2015-07-27
 * @copyright ©2105-2018 SRCMS
 * @homepage http://www.src.pw
 * @version 1.0
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
        $this->assign('user',getSortedCategory($user));
        $this->display();   
    }
}
