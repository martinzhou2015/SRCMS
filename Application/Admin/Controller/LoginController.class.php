<?php
namespace Admin\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

class LoginController extends Controller {
    //登陆主页
    public function index(){
        $this->display();
    }
    //登陆验证
    public function login(){
        if(!IS_POST)$this->error("非法请求");
        $member = M('manager');
        $username =I('username');
        $password =I('password','','md5');
        $code = I('verify','','strtolower');
        //验证验证码是否正确
        if(!($this->check_verify($code))){
            $this->error('验证码错误');
        }
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
        $data =array(
            'id' => $user['id'],
            'update_at' => time(),
            'login_ip' => get_client_ip(),
        );
        
        //如果数据更新成功  跳转到后台主页
        if($member->save($data)){
            session('adminId',$user['id']);
            session('adminname',$user['username']);
			//发送验证码邮件
            //import('ORG.Net.Mail');
			require "./././././ThinkPHP/Library/Org/Net/Mail.class.php";
			$ip = get_client_ip();
			$time = date("Y-m-d h:i:sa");
            $con='您好,您的后台管理账户 '.$username.' 于 '.$time.' 被登录，登录IP地址为 '.$ip.' 如果该操作非您本人操作，可能帐号信息已经被泄露，请您及时修改密码。 ';  
            SendMail($user['email'],'应急响应中心后台登录提示',$con,'应急响应中心');
            $this->success("登陆成功",U('Index/index'));
        }
        //定向之后台主页
        

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
        redirect(U('Login/index'));
    }
}