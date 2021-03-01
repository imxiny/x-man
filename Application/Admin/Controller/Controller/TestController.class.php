<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-08-17
 * Time: 21:39
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class TestController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'test';
        $this->addTemplet = 'Test/add';
        $this->editTemplet = 'Test/edit';
        $this->indexTemplet = 'Test/index';
        $this->whereList = ['keywords' => 'like'];
    }
}
