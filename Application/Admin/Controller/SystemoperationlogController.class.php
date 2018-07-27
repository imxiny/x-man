<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-07-23
 * Time: 11:52
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class SystemoperationlogController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'system_operation_log';
        $this->addTemplet = 'Systemoperationlog/add';
        $this->editTemplet = 'Systemoperationlog/edit';
        $this->indexTemplet = 'Systemoperationlog/index';
        $this->whereList = [];
    }
}
