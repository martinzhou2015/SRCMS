<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */



/**
 * 礼品管理
 */
class GiftsController extends BaseController
{
    /**
     * 礼品列表
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('links');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['url'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('links')->where($where); 
        } 
        
        $count  = $model->where($where)->count();
        $Page = new \Extend\Page($count,15);
        $show = $Page->show();
        $links = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $links);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加礼品
     */
    public function add()
    {
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            $model = D("links");
            if (!$model->create()) {
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("礼品添加成功", U('gifts/index'));
                } else {
                    $this->error("礼品添加失败");
                }
            }
        }
    }
    /**
     * 更新礼品信息
     */
    public function update()
    {
		$id = I('get.id',0,'intval');
        if (!IS_POST) {
            $model = M('links')->where('id='.$id)->find();
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("links");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("礼品更新成功", U('gifts/index'));
                } else {
                    $this->error("礼品更新失败");
                }        
            }
        }
    }
    /**
     * 删除礼品
     */
    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('links');
        $result = $model->delete($id);
        if($result){
            $this->success("礼品删除成功", U('gifts/index'));
        }else{
            $this->error("礼品删除失败");
        }
    }
}
