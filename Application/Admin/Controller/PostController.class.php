<?php
namespace Admin\Controller;
use Admin\Controller;
/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
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
            $where['post.title'] = array('like',"%$key%");
            $where['member.username'] = array('like',"%$key%");
            $where['category.title'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = D('PostView')->where($where); 
        } 
        
        $count  = $model->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $post = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('post.id DESC')->select();
        $this->assign('model', $post);
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
     * 审核漏洞报告
     * @param  [type] $id [文章ID]
     * @return [type]     [description]
     */
    public function update()
    {
		$id = I('get.id',0,'intval');
        //默认显示添加表单
        if (!IS_POST) {
            $model = M('post')->where('id='.$id)->find();
            $this->assign("category",getSortedCategory(M('category')->select()));
            $this->assign('post',$model);
            $this->display();
        }
        if (IS_POST) {
            $model = D("Post");
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
     * 删除漏洞报告
     * @param  [type] $id [description]
     * @return [type]     [description]
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
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function jifen()
    {
		$user_id = I('post.user_id',0,'intval');
		$amount = I('post.amount',0,'intval');
		$model = M('member');
        $result = $model->where('id='.$user_id)->setInc('jifen',$amount);
        if($result){
            $this->success("添加积分成功", U('post/index'));
        }else{
            $this->error("添加积分失败");
        }
    }
	
	/**
     * 生成session key
     */
	    public function session(){
		$id = I('get.id',0,'intval');
		$str = '!@#$%^&*abcdefghijklmnopqrstuvwxyz';
        $session = md5($str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)]);
        $model = M('post');
        $model->session = $session;
		$result = $model->where('id='.$id)->save();
		if($result){
            $this->success("授权成功", U('Check/view?session_id='.$session));
        }else{
            $this->error("授权失败");
        }
	   }
}