<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-07-23
 * Time: 12:32
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class SystemerrorlogController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'system_error_log';
        $this->addTemplet = 'Systemerrorlog/add';
        $this->editTemplet = 'Systemerrorlog/edit';
        $this->indexTemplet = 'Systemerrorlog/index';
        $this->whereList = [];
    }
}
