<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-09-12
 * Time: 16:23
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class CategoryController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'category';
        $this->addTemplet = 'Category/add';
        $this->editTemplet = 'Category/edit';
        $this->indexTemplet = 'Category/index';
        $this->whereList = [];
    }
}
