<?php
namespace Admin\Controller;
use Admin\Controller;
/**
 * 字段管理
 */
class SettingController extends BaseController
{
    /**
     * 分类列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('setting');  
        }else{
            $where['key'] = array('like',"%$key%");
            $where['description'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('setting')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $setting = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $setting);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加分类
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Setting");
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {

                if ($model->add()) {
                    $this->success("字段添加成功", U('setting/index'));
                } else {
                    $this->error("字段添加失败");
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
            $model = M('setting')->find(I('id'));
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Setting");
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
             //   dd(I());die;
                if ($model->save()) {
                    $this->success("字段更新成功", U('setting/index'));
                } else {
                    $this->error("字段更新失败");
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
        $model = M('setting');
 
        //验证通过
        $result = $model->delete($id);
        if($result){
            $this->success("字段删除成功", U('setting/index'));
        }else{
            $this->error("字段删除失败");
        }
    }


}
