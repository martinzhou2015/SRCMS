<?php
namespace User\Controller;
use Think\Controller;

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
        
		$id = session('userId');
        $count  = $model->where($where)->where('user_id='.$id)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(15)
        $show = $Page->show();// 分页显示输出
        $post = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order('post.id DESC')->where('user_id='.$id)->select();
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
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
            $model->user_id = 1;
            if (!$model->field('title,user_id,cate_id,content')->create()) {
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
	*查看漏洞报告
	*/
	public function view(){
		$id = session('userId');
		$rid = I('get.rid',0,'intval');
	    $model = M("Post");
        $post = $model->where(array('user_id'=>$id,'id'=>$rid))->find();  //修复越权漏洞
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->assign('model', $post);
        $this->display();
    }
}
