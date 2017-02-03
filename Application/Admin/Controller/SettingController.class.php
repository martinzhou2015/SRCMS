<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */

class SettingController extends BaseController
{
	public function index()
    {
        $model = M('setting');  
        $setting = $model->where('id=1')-> find();
        $this->assign('model', $setting);
        $this->display();     
    }

	public function other()
    {
        $model = M('setting');  
        $setting = $model->where('id=2')-> find();
        $this->assign('model', $setting);
        $this->display();     
    }

	
    /**
     * 更新基础配置
     */
    public function update()
    {
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
                $model = M("setting");
				$data = I();
				$id = I('get.id',0,'intval');
                if ($model-> where('id='.$id) ->save($data)) {
                    $this->success("配置更新成功", U('setting/index'));
                } else {
                    $this->error("配置更新失败");     
            }
        }
    }

}
