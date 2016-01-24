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
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $hall = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $hall);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加贡献者
    
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("hall");
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
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
    } */
	
    /**
     * 更新贡献者信息
     */
    public function update()
    {
		$id = I('get.id',0,'intval');
        //默认显示添加表单
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
