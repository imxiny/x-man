<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-08-18
 * Time: 15:10
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class SystemskinController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'system_skin';
        $this->addTemplet = 'Systemskin/add';
        $this->editTemplet = 'Systemskin/edit';
        $this->indexTemplet = 'Systemskin/index';
        $this->whereList = [];
    }
}
