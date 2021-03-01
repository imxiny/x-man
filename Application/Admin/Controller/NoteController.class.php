<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-09-12
 * Time: 22:25
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class NoteController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'note';
        $this->addTemplet = 'Note/add';
        $this->editTemplet = 'Note/edit';
        $this->indexTemplet = 'Note/index';
        $this->whereList = [];
    }
}
