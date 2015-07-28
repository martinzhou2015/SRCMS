<?php
namespace Admin\Controller;
use Admin\Controller;
/**
 * 分类管理
 */
class CategoryController extends BaseController
{
    /**
     * 分类列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('category');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('category')->where($where); 
        } 
        
        $category = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id ASC')->select();
        $this->assign('model',getSortedCategory($category));
        $this->display();   
    }

    /**
     * 添加分类
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $model = M('category')->select();
            $cate = getSortedCategory($model);

            $this->assign('cate',$cate);
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Category");
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {

                if ($model->add()) {
                    $this->success("分类添加成功", U('category/index'));
                } else {
                    $this->error("分类添加失败");
                }
            }
        }
    }
    /**
     * 更新分类信息
     * @param  [type] $id [分类ID]
     * @return [type]     [description]
     */
    public function update()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $model = M('category')->find(I('id'));
          
            $this->assign('cate',getSortedCategory(M('category')->select()));
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Category");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
             //   dd(I());die;
                if ($model->save()) {
                    $this->success("分类更新成功", U('category/index'));
                } else {
                    $this->error("分类更新失败");
                }        
            }
        }
    }
    /**
     * 删除分类
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function delete($id)
    {
        $model = M('category');
        //查询属于这个分类的文章
        $posts = M('post')->where('cate_id='.$id)->select();
        if($posts){
            $this->error("禁止删除含有文章的分类");
        }
        //禁止删除含有子分类的分类
        $hasChild = $model->where('pid='.$id)->select();
        if($hasChild){
            $this->error("禁止删除含有子分类的分类");
        }
        //验证通过
        $result = $model->delete($id);
        if($result){
            $this->success("分类删除成功", U('category/index'));
        }else{
            $this->error("分类删除失败");
        }
    }
}
