<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-08-16
 * Time: 15:51
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class UpdatelogController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'update_log';
        $this->addTemplet = 'Updatelog/add';
        $this->editTemplet = 'Updatelog/edit';
        $this->indexTemplet = 'Updatelog/index';
        $this->whereList = [];
    }
}
