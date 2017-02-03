<?php
namespace Admin\Controller;
use Admin\Controller;

/**
 * @Author: Zhou Yuyang <1009465756@qq.com> 10:28 2017/02/02
 * @Copyright 2015-2020 SISMO
 * @Project homepage https://github.com/CNSISMO
 * @Version 2.0
 */

 
class PostController extends BaseController
{
    /**
     * 漏洞报告列表
     * @return [type] [description]
     */
    public function index($key="")
    {
        if($key == ""){
            $model = D('PostView');  
        }else{
            $where['title'] = array('like',"%$key%");
            $where['name'] = array('like',"%$key%");
			$where['type'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = D('PostView')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $pages = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('id DESC')->select();
        $this->assign('model', $pages);
        $this->assign('page',$show);
        $this->display();     
    }

    /**
     * 添加漏洞报告
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
        	$this->assign("category",getSortedCategory(M('category')->select()));
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Post");
            $model->time = time();
            $model->user_id = 1;
            if (!$model->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('post/index'));
                } else {
                    $this->error("添加失败");
                }
            }
        }
    }
    /**
     * 编辑漏洞报告
     */
    public function update()
    {
		$id = I('get.id',0,'intval');
        if (!IS_POST) {
            $model = M('post')->where('id='.$id)->find();
            $this->assign("category",getSortedCategory(M('category')->select()));
            $this->assign('post',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Post");
			$model->time = time();
            if (!$model->create()) {
                $this->error($model->getError());
            }else{
                if ($model->save()) {
                    $this->success("更新成功", U('post/index'));
                } else {
                    $this->error("更新失败");
                }        
            }
        }
    }
	 /**
     * 审核漏洞报告
     */
    public function review()
    {
		$id = I('get.id',0,'intval');
        if (!IS_POST) {
            $model = M('post')->where('id='.$id)->find();
			$comment = M('comment')->where('post_id='.$id)->select();
            $this->assign("category",getSortedCategory(M('category')->select()));
            $this->assign('post',$model);
			$this->assign('comment',$comment);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Post");
			$model->time = time();
			$data = I();
            if ($model->where('id='.$id)->field('day,rank,type')->save($data)) {
                    $this->success("审核成功", U('post/index'));
            } else {
                    $this->error("审核失败");
            }        
        }
    }
    /**
     * 删除漏洞报告
     */
    public function delete()
    {
		$id = I('get.id',0,'intval');
        $model = M('post');
        $result = $model->where("id=".$id)->delete();
        if($result){
            $this->success("删除成功", U('post/index'));
        }else{
            $this->error("删除失败");
        }
    }
	
	/**
     * 添加积分
     */
    public function jifen()
    {
		$member = M('member');
		$record = M('record');
		$user_id = I('get.uid',0,'intval');
		$jifen = I('post.jifen',0,'intval');
		$jinbi = I('post.jinbi',0,'intval');
		$data['type'] = 1;
		$data['name'] = '增加积分/安全币';
		$data['content'] = '+积分:'.$jifen.' +安全币:'.$jinbi;
		$data['time'] = time();
		$user = $member->where('id='.$user_id)-> select();
		$data['user'] = $user[0]['username'];
		$data['operator'] = session('adminname');
        $result1 = $member->where('id='.$user_id)->setInc('jifen',$jifen);
		$result2 = $member->where('id='.$user_id)->setInc('jinbi',$jinbi);
		$result3 = $record -> add($data);
        if($result1 && $result2){
            $this->success("增加积分/安全币成功", U('post/index'));
        }else{
            $this->error("增加积分/安全币失败");
        }
    }
	
	/**
     * 生成session key
     */
	    public function session(){
		$id = I('get.id',0,'intval');
		$str = '1234567890';
        $session = $str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)].$str[rand(0,10)];
		$visible = 1;
        $model = M('post');
        $model->session = $session;
		$model->visible = $visible;
		$result = $model->where('id='.$id)->save();
		if($result){
            $this->success("授权成功", U('Check/view?session_id='.$session));
        }else{
            $this->error("授权失败");
        }
	   }
	   

    /**
	添加报告评论
	**/
	public function comment()
    {
        if (!IS_POST) {
        	$this->error("非法请求");
        }
        if (IS_POST) {
            $model = D("Comment");
            if (!$model->create()) {
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("添加成功", U('post/index'));
                } else {
                    $this->error("添加失败");
                }
            }
        }
    }
}