<?php 
namespace Admin\Model;
use Think\Model\ViewModel;
class PostViewModel extends ViewModel {
   public $viewFields = array(
     'post'=>array('id','session','title','content','user_id','cate_id','time','type','visible'),
     'category'=>array('name'=>'category_name','title'=>'category_title', '_on'=>'post.cate_id=category.id'),
     'member'=>array('username', '_on'=>'post.user_id=member.id'),
   );
 }

?>