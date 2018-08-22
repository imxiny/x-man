<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-08-20
 * Time: 10:47
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class CatetestController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'catetest';
        $this->addTemplet = 'Catetest/add';
        $this->editTemplet = 'Catetest/edit';
        $this->indexTemplet = 'Catetest/index';
        $this->whereList = ['name' => 'like'];
    }
}
