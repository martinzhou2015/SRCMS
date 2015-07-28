<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 2015-07-27
 * @copyright ©2105-2018 SRCMS
 * @homepage http://www.src.pw
 * @version 1.0
 */

namespace Home\Controller;

use Think\Controller;
use Extend\Oauth\ThinkOauth;
/**
 * 用户本地登陆和第三方登陆
 */
class LoginController extends Controller{

    public function index()
    {


    }

    public function login($type=null)
    {   
        //本地账号登陆
        if(empty($type)){
            if(!IS_POST){
              $this->display();  
            }
            if(IS_POST){
                //验证码自己开启。代码省略
                $data['username'] = I('post.username');
                $data['password'] = I('post.password','','md5');
                $member = M('member')->where($data)->find();
                if($member){
                    session('userid',$member['id']);
                    session('username',$member['username']);
                    $this->success("登陆成功");
                }else{
                    $this->error("账号或密码错误");
                }
            }
            return;
        }
        //第三方登陆 这里最好先验证一下$type
        //验证允许实用的登陆方式，可在后台用代码实现
    
        $can_use = in_array(strtolower($type), array('qq','sina','github'));
        if(!$can_use){
            $this->error("不允许使用此方式登陆");
        }
        //验证通过  使用第三方登陆
        if($type != null){
            $sns = ThinkOauth::getInstance($type);
            redirect($sns->getRequestCodeURL());  
        }
        
    }

    public function callback($type = null, $code = null) 
    {
      
        if(empty($type) || empty($code)){
            $this->error('参数错误');  
        } 
     
        $sns = ThinkOauth::getInstance($type);

        //腾讯微博需传递的额外参数
        $extend = null;
        if ($type == 'tencent') {
            $extend = array('openid' => $this->_get('openid'), 'openkey' => $this->_get('openkey'));
        }
        $tokenArray = $sns->getAccessToken($code, $extend);
        $openid = $tokenArray['openid'];
        //$token = $tokenArray['access_token'];  //根据需求储存  主要用来刷新并延长授权时间
        //dd($tokenArray);
        //
        //执行后续操作,代码自己实现。
        //请记住每个用户的openid都是唯一的,所以把openid存到数据库即可
        $member = D('MemberView');
        //根据openid判断用户是否存在，如果存在 ，判断用户是否被禁用。如果不存在,把openid存到数据库,相当于注册用户

        #
        #
        #  代码自己实现
        #
        #
        #
    
        
    }


    public function logout()
    {
        session('userid',null);
        session('username',null);
        $this->success("已成功退出登陆");

    }
}
