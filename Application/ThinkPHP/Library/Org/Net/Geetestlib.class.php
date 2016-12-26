<?php
 /**
 * 极验验证类
 * @category   ORG
 * @package  ORG
 * @subpackage  Net
 * @author    liujing <liujin0506@qq.com>
 */
 class Geetestlib {
 public function geetest_validate($challenge, $validate, $seccode, $key) {    
    $apiserver = 'api.geetest.com';
    if (strlen($validate) > 0 && $this->check_result_by_private($challenge, $validate, $key)) {        
        $query = 'seccode='.$seccode;
        $servervalidate = $this->http_post($apiserver, '/validate.php', $query);            
        if (strlen($servervalidate) > 0 && $servervalidate == md5($seccode)) {
            return TRUE;
        }
    }
    
    return FALSE;        
 }
 private function check_result_by_private($origin, $validate, $key) {
    return $validate == md5($key.'geetest'.$origin) ? TRUE : FALSE;
 }
 private function http_post($host, $path, $data, $port = 80) {
    // $data = $this->fix_encoding($data);
    
    $http_request  = "POST $path HTTP/1.0\r\n";
    $http_request .= "Host: $host\r\n";
    $http_request .= "Content-Type: application/x-www-form-urlencoded\r\n";
    $http_request .= "Content-Length: " . strlen($data) . "\r\n";
    $http_request .= "\r\n";
    $http_request .= $data;
    $response = '';
    if (($fs = @fsockopen($host, $port, $errno, $errstr, 10)) == false) {
        die ('Could not open socket! ' . $errstr);
    }
    
    fwrite($fs, $http_request);
    while (!feof($fs))
        $response .= fgets($fs, 1160);
    fclose($fs);
    
    $response = explode("\r\n\r\n", $response, 2);
    return $response[1];
 }
 private function fix_encoding($str) {     
    $curr_encoding = mb_detect_encoding($str) ; 
    
    if($curr_encoding == "UTF-8" && mb_check_encoding($str,"UTF-8")) {
        return $str; 
    } else {
        return utf8_encode($str); 
    }
 }
 }
 ?>