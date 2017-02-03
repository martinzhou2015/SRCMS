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
 * 贡献榜管理
 */
class HallController extends BaseController
{
    /**
     * 贡献榜列表
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('hall');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['url'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('hall')->where($where); 
        } 
        
        $count  = $model->where($where)->count();
        $Page = new \Extend\Page($count,15);
        $show = $Page->show();
        $hall = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $hall);
        $this->assign('page',$show);
        $this->display();     
    }
	
	public function record($key="")
    {
        if($key == ""){
            $model = M('record');  
        }else{
            $where['user'] = array('like',"%$key%");
            $where['operator'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('record')->where($where); 
        } 
        
        $count  = $model->where($where)->count();
        $Page = new \Extend\Page($count,25);
        $show = $Page->show();
        $record = $model->limit($Page->firstRow.','.$Page->listRows)->where('type=1')->where($where)->order('id DESC')->select();
        $this->assign('model', $record);
        $this->assign('page',$show);
        $this->display();     
    }

     /**
     * 添加贡献者信息
     */
    public function add()
    {
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            $model = D("hall");
            if (!$model->create()) {
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('hall/index'));
                } else {
                    $this->error("添加失败");
                }
            }
        }
    }
	
    /**
     * 更新贡献者信息
     */
    public function update()
    {
		$id = I('get.id',0,'intval');
        if (!IS_POST) {
            $model = M('hall')->where('id='.$id)->find();
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("hall");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("更新成功", U('hall/index'));
                } else {
                    $this->error("更新失败");
                }        
            }
        }
    }
	
    /**
     * 删除贡献者
     */
    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('hall');
        $result = $model->delete($id);
        if($result){
            $this->success("删除成功", U('hall/index'));
        }else{
            $this->error("删除失败");
        }
    }
}
