<?php
namespace User\Controller;
use Think\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */

 
class PostController extends BaseController
{

    public function index($key="")
    {
        if($key == ""){
            $model = D('PostView'); 
        }else{
            $where['post.title'] = array('like',"%$key%");
            $where['member.username'] = array('like',"%$key%");
            $where['category.title'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = D('PostView')->where($where); 
        } 
        
		$id = session('userId');
        $count  = $model->where($where)->where('user_id='.$id)->count();
        $Page = new \Extend\Page($count,20);
        $show = $Page->show();
        $post = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('post.id DESC')->where('user_id='.$id)->select();
        $this->assign('model', $post);
        $this->assign('page',$show);
        $this->display();     
    }
	
	
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
			$tmodel= M('setting');
		    $title = $tmodel->where('id=1')->select();
		    $this->assign('title', $title);
        	$this->assign("category",getSortedCategory(M('category')->select()));
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Post");
            $model->time = time();
			$data = I();
            if (!$model->field('title,user_id,cate_id,content')->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
					require "./././././ThinkPHP/Library/Org/Net/Mail.class.php";
					$time = date("Y-m-d h:i:sa");
					$con='您好,安全应急响应中心新增一份漏洞报告《 '.$data['title'].'》。请您及时登陆后台查看。';  
					SendMail('1009465756@qq.com','新增漏洞报告提示',$con,'安全应急响应中心');
                    $this->success("报告成功", U('post/index'));
                } else {
                    $this->error("报告失败");
                }
            }
        }
    }
	
	public function view(){
	    $rid = I('get.rid',0,'intval');
		$model = M("Post");
		$id = session('userId');
		$comment = M('comment')->where(array('post_id'=>$rid))->select();
        $post = $model->where(array('user_id'=>$id,'id'=>$rid))->find();
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->assign('model', $post);
		$this->assign('comment',$comment);
        $this->display();
    }
	
	public function comment()
    {
        if (!IS_POST) {
        	$this->error("非法请求");
        }
        if (IS_POST) {
			$data = I();
			$data['update_time'] = time();
			$data['user_id'] = session('username');
			$model = M("Comment");
            if ($model->add($data)) {
                    $this->success("评论成功", U('post/index'));
                } else {
                    $this->error("评论失败");
                }
        }
    }
}
