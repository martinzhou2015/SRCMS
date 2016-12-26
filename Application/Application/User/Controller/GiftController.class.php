<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */

class GiftController extends BaseController{

    public function index(){
		$id = session('userId');
        $gift = M('links')->select();
		$tmodel= M('setting');
		$info = M('member')->where('id='.$id)->select();
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->assign('gift',$gift);
		$this->assign('info',$info);
        $this->display();
    }
	
	
	 public function order(){
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$id = session('userId');
		$info = M('order')->where('username='.$id)->select();
		$this->assign('title', $title);
		$this->assign('info',$info);
        $this->display();
    }
	
	public function add()
    {
        //默认显示添加表单
		$id = session('userId');
		$gid = I('get.gid',0,'intval');
        if (!IS_POST) {
			$tmodel= M('setting');
		    $title = $tmodel->where('id=1')->select();
		    $this->assign('title', $title);
            $info = M('info')->where('user_id='.$id)->select();
			$gift = M('links')->where('id='.$gid)->select();
            $this->assign('info',$info);
			$this->assign('gift',$gift);
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("order");
            if (!$model->field('username,gid,tel,alipay,realname,location,zipcode')->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("下单成功", U('index/index'));
                } else {
                    $this->error("下单失败");
                }
            }
		}
	}
}