<?php
namespace Admin\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2016/12/03
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://www.srcms.xyz
 * @Version 2.0
 */

class LoginController extends Controller {
    //登陆主页
    public function index(){
        $this->display();
    }
	//显示登陆验证页面
	public function svalid(){
        $email =I('get.email','','email');
		$this->assign('email', $email);
		$this->display();
    }
    //登陆验证
	public function valid(){
        if(!IS_POST){$this->error("非法请求");}
		$code = I('verify','','strtolower');
		$email =I('get.email','','email');
		$token = session('token');
		$member = M('manager');
		$user = $member->where(array('email'=>$email))->find();
		if($token != $user['token']){$this->error("非法请求");}
        //验证验证码是否正确
        if(!($this->check_verify($code))){
		   session('adminId',null);
		   session('adminname',null);
           $this->error('验证码错误',U('Login/index'));
        }
		//如果验证码校验成功 跳转到后台主页
		session('adminId',$user['id']);
        session('adminname',$user['username']);
        $this->success("登陆成功",U('Index/index'));
    }
    public function login(){
        if(!IS_POST)$this->error("非法请求");
        $member = M('manager');
        $username =I('username');
        $password =I('password','','md5');
        $code = I('verify','','strtolower');
        //验证验证码是否正确
        //if(!($this->check_verify($code))){
        //    $this->error('验证码错误');
        //}
        //验证账号密码是否正确
        $user = $member->where(array('username'=>$username,'password'=>$password))->find();

        if(!$user) {
            $this->error('账号或密码错误 :(') ;
        }
        //验证账户是否被禁用
        //if($user['status'] == 0){
            //$this->error('账号被禁用，请联系超级管理员 :(') ;
        //}
        //if($user['type'] == 1){
            //$this->error('您没权限登陆后台 :(') ;
        //}
        //验证是否为管理员
        //更新登陆信息
		$token = md5($user['email'].time());
        $data =array(
            'id' => $user['id'],
			'token' => $token,
            'update_at' => time(),
            'login_ip' => get_client_ip(),
        );
        
        //如果数据更新成功  跳转到后台主页
        if($member->save($data)){
			//发送验证码邮件
			session('token',$token);
            $this->success("请先完成验证",U('Login/svalid?email=').$user['email']);
        }
        
    }
	
    //验证码
    public function verify(){
		ob_clean();
        $Verify = new \Think\Verify();
        $Verify->codeSet = 'AECDEFGHIGJ123456';
        $Verify->fontSize = 16;
        $Verify->length = 4;
        $Verify->entry();
    }
    protected function check_verify($code){
        $verify = new \Think\Verify();
        return $verify->check($code);
    }

    public function logout(){
        session('adminId',null);
        session('adminname',null);
		session('token',null);
        redirect(U('Login/index'));
    }
}