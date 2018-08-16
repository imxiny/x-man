<?php

namespace Home\Controller;


use Think\Controller;
use Org\Cloudstorage;
use OSS\Core\OssException;
use Think\Upload\Driver\Upyun;

class IndexController extends Controller
{
    /**
     * @throws \OSS\Core\OssException
     */
    public function index()
    {
        $o = new Cloudstorage\Upyuss();
        var_dump($o);
        /*$config = C('ALIOSSCONF');
        try{
            $o = new Cloudstorage\Alioss($config['KEY'], $config['SECRET'], $config['ENDPOINT']);
            $t = $o->upload($config['BUCKET'], 'a/a.ico',"./favicon.ico");
        }catch (OssException $e){
            var_dump($e->getMessage());
        }*/
    }
}