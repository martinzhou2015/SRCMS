function del(msg) { 
//    var msg = "您真的确定要删除吗？\n\n删除后将不能恢复!请确认！"; 
    if (confirm(msg)==true){ 
            return true; 
        }else{ 
            return false; 
    } 
} 

jQuery(document).ready(function () {
    //高亮当前选中的导航
    var myNav = $(".side-nav a");
    for (var i = 0; i < myNav.length; i++) {
        var links = myNav.eq(i).attr("href");
        var myURL = document.URL;
        var durl=/http:\/\/([^\/]+)\//i;
        domain = myURL.match(durl);
        var result = myURL.replace("http://"+domain[1],"");
        if (links == result) {
            myNav.eq(i).parents(".dropdown").addClass("open");
        }
    }
});


