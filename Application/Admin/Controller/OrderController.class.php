<?php
namespace Admin\Controller;
use Admin\Controller;
/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */
 
/**
 * 订单管理
 */
class OrderController extends BaseController
{
    /**
     * 订单列表
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('order');  
        }else{
            $where['user'] = array('like',"%$key%");
            $where['realname'] = array('like',"%$key%");
			$where['finish'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('order')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $pages = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $pages);
        $this->assign('page',$show);
        $this->display();     
    }
	
    public function update()
    {
	  $id = I('get.id',0,'intval');
	  $user_id = I('get.username',0,'intval');
        if (!IS_POST) {
            $model = M('order')->where(array('id='=>$id))->find();
            $this->assign('model',$model);
		    $model = M('member');
	        $info = $model->where(array('id'=>$user_id))-> select();
			$this->assign('userM', $info);
            $this->display();
        }
        if (IS_POST) {
            $model = D("order");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("订单更新成功", U('order/index'));
                } else {
                    $this->error("订单更新失败");
                }        
            }
        }
    }

    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('order');
        $result = $model->where(array("id"=>$id))->delete();
        if($result){
            $this->success("订单删除成功", U('order/index'));
        }else{
            $this->error("订单删除失败");
        }
    }
	
	
}
