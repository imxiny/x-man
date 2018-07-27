<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-07-23
 * Time: 11:51
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class SystemloginlogController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'system_login_log';
        $this->addTemplet = 'Systemloginlog/add';
        $this->editTemplet = 'Systemloginlog/edit';
        $this->indexTemplet = 'Systemloginlog/index';
        $this->whereList = [];
    }
    //可复写index、add、edit、delete
}
