<?php
namespace User\Controller;
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
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->display();
    }
    //登陆验证
    public function login(){
        if(!IS_POST)$this->error("非法请求");
        $member = M('member');
		$username = I('username','','htmlspecialchars');
        $password = I('password');
        $code = I('verify','','strtolower');
        //验证验证码是否正确
        if(!($this->check_verify($code))){
            $this->error('验证码错误');
        }
		
        $user = $member->where(array('username'=>$username))->find();
	
		
        if($user['password'] != md5(md5(md5($user['salt']).md5($password)."SR")."CMS")) {
            $this->error('账号或密码错误 :(') ;
        }
       // 验证账户是否被禁用
        if($user['status'] == 0){
            $this->error('账号被禁用，请联系网站管理员 :(') ;
        }

        //更新登陆信息
        $data =array(
            'id' => $user['id'],
            'update_at' => time(),
            'login_ip' => get_client_ip(),
        );
        
        //如果数据更新成功  跳转到后台主页
        if($member->save($data)){
            session('userId',$user['id']);
            session('username',$user['username']);
		//	session('token',md5(time().$user['salt']));
            $this->success("登陆成功",U('Index/index'));
        }
        //定向之后台主页
        

    }
	
	//验证码
    public function verify(){
		ob_clean();
        $Verify = new \Think\Verify();
        $Verify->codeSet = '123456789abcdefg';
        $Verify->fontSize = 16;
        $Verify->length = 4;
        $Verify->entry();
    }
    protected function check_verify($code){
        $verify = new \Think\Verify();
        return $verify->check($code);
    }

	
    //退出登录
    public function logout(){
        session('userId',null);
        session('username',null);
        redirect(U('Login/index'));
    }
}