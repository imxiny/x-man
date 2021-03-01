<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-08-01
 * Time: 10:03
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class TesttestController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'test_test';
        $this->addTemplet = 'Testtest/add';
        $this->editTemplet = 'Testtest/edit';
        $this->indexTemplet = 'Testtest/index';
        $this->whereList = ['tilte' => 'like'];
    }
}
