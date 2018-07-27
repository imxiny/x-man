<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-07-26
 * Time: 12:36
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class ArticleController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'article';
        $this->addTemplet = 'Article/add';
        $this->editTemplet = 'Article/edit';
        $this->indexTemplet = 'Article/index';
        $this->whereList = ['title' => 'like','author' => 'like'];
    }
}
