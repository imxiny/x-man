<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2019-11-18
 * Time: 16:26
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class Category1Controller extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'category';
        $this->addTemplet = 'Category1/add';
        $this->editTemplet = 'Category1/edit';
        $this->indexTemplet = 'Category1/index';
        $this->whereList = ['title' => 'eq','desc' => 'like'];
    }
}
