<?php
namespace Admin\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */
 
class CheckController extends Controller
{
    /**
     * 临时查看漏洞报告
     */
       public function view(){
		$id = I('get.session_id',0,'number_int'); //seesion token防注入
        $model = M('post')->where('session='.$id)->find();
		$flow = M('wflow')->where('session='.$id)->select();
		$this->assign('wflow',$flow);
        $this->assign('model',$model);
		$this->display();
    }
    /**
     * 添加漏洞处理进展
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            $model = D("wflow");
            if (!$model->create()) {
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('post/index'));
                } else {
                    $this->error("添加失败", U('post/index'));
                }
            }
        }
    }
}
