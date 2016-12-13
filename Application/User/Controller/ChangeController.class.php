<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 1.8
 */


class ChangeController extends BaseController{
    /**
     * 显示更改密码页面
     */
    public function index()
    {
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->display();
    }

     /**
     * 修改密码流程
     */
    public function change()
    {
		//验证请求方式
        if(!IS_POST)$this->error("非法请求");
        $member = M('member');
        $id = session('userId');
		$username = session('username');
		$oldpassword = I('post.oldpassword','','md5');
        $password = I('post.password','','md5');

		//获取salt
		$salt = $member->where(array('id'=>$id,'username'=>$username))->find();
		$s_oldpassword = md5(md5(md5($salt['salt']).$oldpassword."SR")."CMS");
		
        //验证原密码
        $user = $member->where(array('id'=>$id,'password'=>$s_oldpassword))->find();
		
        if(!$user) {
            $this->error('旧密码校验失败 :(') ;
        }
		
        //验证账户是否管理员，管理员无法在前台修改密码       
		if($user['type'] == 2){
            $this->error('前台无法修改管理员密码 :(') ;
        }
    
	$s_password = md5(md5(md5($salt['salt']).$password."SR")."CMS");
	$member-> password=$s_password;
    $result = $member->where(array('id'=>$id,'password'=>$s_oldpassword))->save();
	 if($result){  
        $this->success("修改成功",U('login/logout'));
        }else{  
         $this->error('修改失败,请重试 :(',U('change/index')) ;
        }  
    }
}