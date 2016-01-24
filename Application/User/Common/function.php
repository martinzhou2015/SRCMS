<?php
//富文本XSS过滤
function waf($arr) 
{
     
   $ra=Array('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/','/<script/i','/javascript:/i','/vbscript:/i','/expression/i','/applet/','/meta/','/xml/','/blink/','/<link/i','/<embed/i','/<object/i','/frame/i','/iframe/i','/layer/','/title/','/bgsound/','/base/','/onload=/i','/onunload=/i','/onchange=/i','/onsubmit=/i','/onreset=/','/onselect=/i','/onblur=/i','/onfocus=/i','/onabort=/i','/onkeydown=/i','/onkeypress=/i','/onkeyup=/i','/onclick=/i','/ondblclick=/i','/onmousedown=/','/onmousemove=/i','/onmouseout=/i','/onmouseover=/i','/onmouseup=/i','/onunload=/i','/alert/i','/<input/i');
   
   $value       = preg_replace($ra,'',$arr);     
   echo $value;
}
?>