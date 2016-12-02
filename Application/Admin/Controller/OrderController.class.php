<?php
namespace Admin\Controller;
use Admin\Controller;
/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */
 
/**
 * 单页管理
 */
class OrderController extends BaseController
{
    /**
     * 单页列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('order');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('order')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $pages = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $pages);
        $this->assign('page',$show);
        $this->display();     
    }
	
    public function update()
    {
	  $id = I('get.id',0,'intval');
        //默认显示添加表单
        if (!IS_POST) {
            $model = M('order')->where('id='.$id)->find();
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("order");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("更新成功", U('order/index'));
                } else {
                    $this->error("更新失败");
                }        
            }
        }
    }

    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('order');
        $result = $model->where("id=".$id)->delete();
        if($result){
            $this->success("删除成功", U('order/index'));
        }else{
            $this->error("删除失败");
        }
    }
	
  	/**
     * 添加积分
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function jifen()
    {
		$user_id = I('post.user_id',0,'intval');
		$amount = I('post.amount',0,'intval');
		$model = M('member');
        $result = $model->where('id='.$user_id)->where('jifen>0')->setDec('jifen',$amount);
        if($result){
            $this->success("扣除积分成功", U('post/index'));
        }else{
            $this->error("扣除积分失败：余额不足");
        }
    }
	
}
