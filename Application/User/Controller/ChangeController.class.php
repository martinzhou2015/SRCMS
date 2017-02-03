<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */



class ChangeController extends BaseController{
    /**
     * 显示更改密码页面
     */
    public function index()
    {
        $this->display();
    }

     /**
     * 修改密码流程
     */
    public function change()
    {
        if(!IS_POST)$this->error("非法请求");
        $member = M('member');
        $id = session('userId');
		$username = session('username');
		$oldpassword = I('post.oldpassword');
        $password = I('post.password');
		$repassword = I('post.repassword');

		//获取salt
		$salt = $member->where(array('id'=>$id,'username'=>$username))->find();
		$s_oldpassword = md5(md5(md5($salt['salt']).md5($oldpassword)."SR")."CMS");
		
        //验证原密码
        $user = $member->where(array('id'=>$id,'password'=>$s_oldpassword))->find();
		
		$code = I('verify','','strtolower');
		
        if(!($this->check_verify($code))){
            $this->error('验证码错误');
        }
		
        if(!$user) {
            $this->error('旧密码校验失败 :(') ;
        }
		
		if($password != $repassword) {
            $this->error('两次密码输入不相符 :(') ;
        }
		
		if(strlen($password) < 8){ $this->error("为了保证帐户安全，请输入大于八位数的密码!");}
    
		$s_password = md5(md5(md5($salt['salt']).md5($password)."SR")."CMS");
		$data['password']= $s_password;
		$result = $member->where(array('id'=>$id,'password'=>$s_oldpassword))->save($data);
		 if($result){  
			$this->success("修改成功",U('login/logout'));
			}else{  
			 $this->error('修改失败,请重试 :(',U('change/index')) ;
			}  
    }
	
	//验证码
    public function verify(){
		ob_clean();
        $Verify = new \Think\Verify();
        $Verify->codeSet = '123456789abcdefghijklmnopqrst';
        $Verify->fontSize = 16;
        $Verify->length = 4;
        $Verify->entry();
    }
    protected function check_verify($code){
        $verify = new \Think\Verify();
        return $verify->check($code);
    }
}