<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */


class ChangeController extends BaseController{
    /**
     * 显示更改密码页面
     * @return [type] [description]
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
		$oldpassword =I('post.oldpassword','','md5');
        $password =I('post.password','','md5');
		
        //验证原密码
        $user = $member->where(array('id'=>$id,'password'=>$oldpassword))->find();
		
        if(!$user) {
            $this->error('邮箱不存在 :(') ;
        }
		
        //验证账户是否管理员        
		if($user['type'] == 2){
            $this->error('前台无法修改管理员密码 :(') ;
        }
    
	
	$member-> password=$password;
    $result = $member->where(array('id'=>$id,'password'=>$oldpassword))->save();
	 if($result){  
        $this->success("修改成功",U('login/logout'));
        }else{  
         $this->error('修改失败 :(') ;
        }  
    }
}