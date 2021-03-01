<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-07-26
 * Time: 12:41
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class UserController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'user';
        $this->addTemplet = 'User/add';
        $this->editTemplet = 'User/edit';
        $this->indexTemplet = 'User/index';
        $this->whereList = ['name' => 'eq','phone' => 'eq'];
    }
}
