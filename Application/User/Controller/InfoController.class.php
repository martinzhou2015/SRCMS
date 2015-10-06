<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 2015-08-02
 * @copyright ©2105-2018 SRCMS
 * @homepage http://www.src.pw
 * @version 1.0
 */

class InfoController extends BaseController{

    public function index(){
		$id = session('userId');
        $info = M('info')->where('user_id='.$id)->select();
        $this->assign('info',$info);
        $this->display();
    }

    /**
     * 添加联系方式
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("info");
			$model->user_id = 1;
			$model->username = 1;
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('info/index'));
                } else {
                    $this->error("添加失败");
                }
            }
        }
    }
	
	/**
     * 更新联系方式
     */
	 
	public function update()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("info");
			$model->user_id = 1;
			$model->username = 1;
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->save()) {
                    $this->success("更新成功", U('info/index'));
                } else {
                    $this->error("更新失败");
                }
            }
        }
    }

}
