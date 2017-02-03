<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://www.srcms.xyz
 * @Version 2.0
 */

/**
 * 用户管理
 */
class MemberController extends BaseController
{
    /**
     * 用户列表
     * @param  [type] $id [管理员ID]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = M('member');  
        }else{
            $where['username'] = array('like',"%$key%");
            $where['email'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = M('member')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $member = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('member', $member);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加用户
     */
    public function add()
    {
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            $model = D("Member");
            if (!$model->create()) {
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("用户添加成功", U('member/index'));
                } else {
                    $this->error("用户添加失败");
                }
            }
        }
    }
    /**
     * 更新用户信息
     */
    public function update()
    {
        if (!IS_POST) {
            $model = M('member')->find(I('id'));
            $this->assign('model',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Member");
			$user = M('member')->find(I('id'));
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                $data = I();
                unset($data['password']);
                if(I('password') != ""){
                    $data['password'] = md5(md5(md5($user['salt']).md5(I('password'))."SR")."CMS");
                }
                if(C('SUPER_ADMIN_ID') == I('id')){
                    $data['type'] = 1;
                }
                if ($model->save($data)) {
                    $this->success("用户信息更新成功", U('member/index'));
                } else {
                    $this->error("用户信息更新失败");
                }        
            }
        }
    }
    /**
     * 禁用用户
     */
    public function ban()
    {
		$id = I('get.id',0,'intval'); 
        $model = M('member');
        $result = $model->find($id);
        $data['id']=$id;
        if($result['status'] == 1){
        	$data['status']=0;
        }
        if($result['status'] == 0){
        	$data['status']=1;
        }
        if($model->save($data)){
            $this->success("状态更新成功", U('member/index'));
        }else{
            $this->error("状态更新失败");
        }
    }
    /**
     * 删除用户
	 * @param  [type] $id [管理员ID]
     */
    public function delete()
    {
		$id = I('get.id',0,'intval'); 
        $model = M('member');
		if($model->where('id='.$id)->delete()){
            $this->success("用户删除成功", U('member/index'));
        }else{
            $this->error("用户删除失败");
        }
    }
}
