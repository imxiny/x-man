<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->show('<script>window.location.href="/admin";</script>','utf-8');
    }
}
