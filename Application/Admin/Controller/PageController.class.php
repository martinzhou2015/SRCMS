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
 * 单页管理
 */
class PageController extends BaseController
{
    /**
     * 单页列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('page');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('page')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $pages = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $pages);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加公告
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            $model = M("Page");
			$data = I();
			$data['update_time'] = time();
            if ($model->add($data)) {
                    $this->success("添加成功", U('page/index'));
                } else {
                    $this->error("添加失败");
                }
        }
    }
    /**
     * 更新公告
     */
    public function update()
    {
        $id = I('get.id',0,'intval');
        if (!IS_POST) {
            $model = M('page')->where('id='.$id)->find();
            $this->assign('page',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = M("Page");
			$data = I();
			$data['update_time'] = time();
            if ($model->save($data)) {
                    $this->success("更新成功", U('page/index'));
                } else {
                    $this->error("更新失败");
                }        
        }
    }

    /**
     * 删除单页
     */
    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('page');
        $result = $model->where("id=".$id)->delete();
        if($result){
            $this->success("删除成功", U('page/index'));
        }else{
            $this->error("删除失败");
        }
    }
}
