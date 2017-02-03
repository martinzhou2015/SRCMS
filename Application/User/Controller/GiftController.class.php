<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */


class GiftController extends BaseController{

    public function index(){
		$id = session('userId');
		$gifts = M('links');
		$count  = $gifts->where($where)->count();
        $Page = new \Extend\Page($count,8);
		$show = $Page->show();// 分页显示输出
		$pages = $gifts->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('gift',$pages);
		$this->assign('page',$show);
		$info = M('member')->where('id='.$id)->select();
		$this->assign('info',$info);
        $this->display();
    }
		
	 public function order(){
		$id = session('userId');
		$username = session('username');
		$info = M('order')->where(array('username'=>$username,'userid'=>$id))->select();
		$this->assign('info',$info);
        $this->display();
    }
	
	public function add()
    {
		$id = session('userId');
		$gid = I('get.gid',0,'intval');
        if (!IS_POST) {
            $info = M('member')->where('id='.$id)->find();
			$gift = M('links')->where('id='.$gid)->find();
            $this->assign('info',$info);
			$this->assign('gift',$gift);
            $this->display();
        }
        if (IS_POST) {
            $model = M("order");
			$record = M('record');
			$user = M('member')->where('id='.$id)->find();
			$gift = M('links')->where('id='.$gid)->find();
			if($user['jinbi']<$gift['price']){
				$this->error("安全币余额不足!", U('gift/index'));
				exit();
			}
			$data = I();
			$data['gid'] = $gift['title']; 
			$data['username'] = session('username');
			$data['userid'] = session('userId');
			$data['update_time'] = time();
			
			//记录兑换安全币变动日志
			$rdata['type'] = 1;
			$rdata['name'] = '兑换'.$gift['title'];
			$rdata['content'] = '-安全币:'.$gift['price'];
			$rdata['time'] = time();
			$rdata['user'] = session('username');
			$rdata['operator'] = session('username');
			$record_result = $record -> add($rdata);
			
			$result = M('member')->where('id='.$id)->setDec('jinbi',$gift['price']);
            if ($model->field('userid,username,gid,tel,alipay,realname,address,zipcode,update_time')->add($data)) {
				if($result){
                    $this->success("兑换成功", U('gift/index'));
					}
				else{
					$this->error("兑换失败");
				}
                } else {
                    $this->error("兑换失败");
                }
		}
	}
}