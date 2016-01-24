<?php
namespace Admin\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */
 
class CheckController extends Controller
{
    /**
     * 临时查看漏洞报告
     */
       public function view(){
		$id = I('get.session_id',0,'intval');
        $model = M('post')->where('session='.$id)->find();
        $this->assign('model',$model);
        $this->display();
    }
}
