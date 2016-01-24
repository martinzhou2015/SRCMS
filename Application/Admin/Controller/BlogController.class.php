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
 * 博客管理
 */
class BlogController extends BaseController
{
    /**
     * 博客列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('blog');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('blog')->where($where); 
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
     * 添加博客
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Blog");
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('blog/index'));
                } else {
                    $this->error("添加失败");
                }
            }
        }
    }
    /**
     * 更新博客信息
     * @param  [type] $id [单页ID]
     * @return [type]     [description]
     */
    public function update()
    {
        $id = I('get.id',0,'intval');
		//默认显示添加表单
        if (!IS_POST) {
            $model = M('blog')->where('id='.$id)->find();
            $this->assign('page',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Blog");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("更新成功", U('blog/index'));
                } else {
                    $this->error("更新失败");
                }        
            }
        }
    }
    /**
     * 删除博客
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('blog');
        $result = $model->where("id=".$id)->delete();
        if($result){
            $this->success("删除成功", U('blog/index'));
        }else{
            $this->error("删除失败");
        }
    }
}
