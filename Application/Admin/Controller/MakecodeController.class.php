<?php
////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.___\_<|>_/___.'  >'"".                  //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//      ========`-.____`-.___\_____/___.-`____.-'========         //
//                           `=---='                              //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//         佛祖保佑       永无BUG     永不修改                       //
////////////////////////////////////////////////////////////////////
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Code Standard: PSR2
 * Date: 2018-07-12
 * Time: 13:54
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Think\Exception;

class MakecodeController extends AdminBaseController
{
    /**
     * Enum类型识别为单选框的结尾字符,默认会识别为单选下拉列表
     */
    protected $enumRadioSuffix = ['data', 'state', 'status'];

    /**
     * var bool 是否覆盖写入
     */
    protected $overwrite = false;

    /**
     * var bool 是否开启文件锁
     */
    protected $lock = true;
    /**
     * Set类型识别为复选框的结尾字符,默认会识别为多选下拉列表
     */
    protected $setCheckboxSuffix = ['data', 'state', 'status'];

    /**
     * Int类型识别为日期时间的结尾字符,默认会识别为日期文本框
     */
    protected $intDateSuffix = ['time', 'date','datetime'];

    /**
     * 开关后缀
     */
    protected $switchSuffix = ['switch'];


    /**
     * 识别为图片字段
     */
    protected $imageField = ['image', 'images', 'avatar', 'avatars'];

    /**
     * 识别为富文本编辑器字段
     */
    protected $editorField = ['content', 'description'];

    /**
     * 识别为color类型
     */
    protected $colorField = ['color'];

    /**
     * 识别为文件字段
     */
    protected $fileField = ['file', 'files'];

    /**
     * 保留字段 不会生成对应控件
     */
    protected $reservedField = ['createtime', 'updatetime'];

    /**
     * 其他表主键
     */
    protected $otherTableId = ['_id'];

    public function index()
    {
   $table = 'article';
        /*$M = M();
        $sql = "SELECT " . " * FROM `information_schema`.`columns` "
            . "WHERE TABLE_SCHEMA = '" . C('DB_NAME') . "' AND table_name = '" .
            C('DB_PREFIX') . $table . "' "
            . "ORDER BY ORDINAL_POSITION";
        $showTableCommentSql = "SELECT "."TABLE_COMMENT FROM information_schema.TABLES WHERE table_schema='" .C('DB_NAME'). "' and TABLE_NAME='" . C('DB_PREFIX') . $table . "'";
        $tabinfo = $M->query($showTableCommentSql);
        $sql = "show tables";
        $list = M()->query($sql);
        var_dump($tabinfo);die;
        die;*/
        $sql = "show tables";
        $list = M()->query($sql);
        $list = array_column($list, 'tables_in_' . C('DB_NAME'));
        $list = array_map(function ($v) {
            return str_replace(C('DB_PREFIX'), '', $v);
        }, $list);
        $this->assign('list', $list);
        $this->display("Index/makecode");
    }

    public function make()
    {
        //功能列表
        $listStr = trim(I('post.list'), ',');
        $list = explode(',', $listStr);

        //查询扩展
        $whereStr = trim($_POST['where'], '&');
        parse_str($whereStr, $whereList);

        $rule = strtolower(I('post.controller'));
        $controller = ucfirst($rule);
        $file = ROOT_PATH . trim(APP_PATH, './') . '/' .
            'Admin/View/' . $controller . '/' . $controller . '.lock';
        if (file_exists($file)) {
            $this->error('该控制器以开启误触锁定，请手动删除以下文件:<br>' . '<span class="layui-blue">' . $file . '</span>');
        }
        $table = strtolower(I('post.table'));
        $this->overwrite = I('post.over') === 'true' ? true : false;
        $this->lock = I('post.lock') === 'true' ? true : false;

        $M = M();
        $sql = "SELECT " . " * FROM `information_schema`.`columns` "
            . "WHERE TABLE_SCHEMA = '" . C('DB_NAME') . "' AND table_name = '" .
            C('DB_PREFIX') . $table . "' "
            . "ORDER BY ORDINAL_POSITION";
        $tabinfo = $M->query($sql);

        if (empty($tabinfo)) {
            $this->error('表 ' . $table . '不存在');
        }
        //先判断主键
        $pri = '';
        $foreignKeyList = array();//外联表 list
        foreach ($tabinfo as $k => $v) {
            if ('PRI' == $v['column_key']) {
                $pri = $v['column_name'];
            }
            //判断注释是否有效
            $type = $this->getFieldType($v);
            if (!$this->judgeComment($type, $v['column_name'],$v['column_comment'],$errinfo)) {
                $this->error('列：'.$v['column_name'].'注释无效 错误：' .$errinfo);
            }
            if ('id' === $type) {
                $foreignKeyList[] = $v;
            }
        }
        if (empty($pri)) {
            $this->error('该表无主键');
        }

        $ruleAlert = "规则：<br>admin/{$rule}/index<br>";
        try {
            //生成controller
            $res[] = $this->makeController($controller, $table, $whereList, $foreignKeyList);
            if (in_array('add', $list)) {
                //生成add
                $res[] = $this->makeAdd($tabinfo, $controller);
                $ruleAlert .= "admin/{$rule}/add<br>";
            }
            if (in_array('edit', $list)) {
                //生成edit
                $res[] = $this->makeEdit($tabinfo, $controller);
                $ruleAlert .= "admin/{$rule}/edit<br>";
            }
            //生成index
            $res[] = $this->makeIndex($tabinfo, $controller, $list, $whereList);

            if (in_array('delete', $list)) {
                $ruleAlert .= "admin/{$rule}/delete<br>";
            }


           //插入规则表
            $ru = M('auth_rule');
            $ru->startTrans();
            $rules = 'admin/'.$rule.'/index';
            $ruRes[] = $ru->where(['name' => $rules])->delete();
            //查询当前表的注释
            $showTableCommentSql = "SELECT "."TABLE_COMMENT FROM information_schema.TABLES WHERE table_schema='" .C('DB_NAME'). "' and TABLE_NAME='" . C('DB_PREFIX') . $table . "'";
            $tableComment = $ru->query($showTableCommentSql)[0]['table_comment'] ?: $controller;
            $data = array(
                'name' => $rules,
                'title' => $tableComment.'管理',
                'type' => '1',
                'status' => '1',
                'condition' => '',
                'is_url' => '1',
                'pid' => '0',
            );
            $ruRes[] = $pid = $ru->add($data);
            foreach ($list as $k => $v) {
                if ('select' === $v || 'like' === $v) {
                    continue;
                }
                $rules = 'admin/'.$rule.'/'.$v;
                $ruRes[] = $ru->where(['name' => $rules])->delete();
                $opreations = ['add' => '添加','edit' => '修改','delete' =>'删除'];
                $data = array(
                    'name' => $rules,
                    'title' => $tableComment.'/'.$opreations[$v],
                    'type' => '1',
                    'status' => '1',
                    'condition' => '',
                    'is_url' => '0',
                    'pid' => $pid,
                );
                $ruRes[] = $ru->add($data);
            }

            $info = '';
            foreach ($res as $k => $v) {
                if ($v['success']) {
                    $info .= "<span style='color:green'>成功</span> {$v['file']} <br>";
                } else {
                    $info .= "<span style='color:red'>失败</span> {$v['file']} <br>";
                }
            }
            if (in_array(false, $ruRes, true)) {
                $ru->rollback();
                $ruAlert = "规则创建<span class='layui-red'>失败</span>请手动创建";
            } else {
               $ru->commit();
                $ruAlert = "规则创建<span class='layui-blue'>成功</span><br>";
            }
            /*$info = '';
            $ruAlert = '';*/

            $info .= $ruleAlert .$ruAlert.'请自行创建菜单、绑定规则，以及角色组授权';
            if ($this->lock) {
                //创建锁定文件
                $file = ROOT_PATH . trim(APP_PATH, './') . '/'
                    . 'Admin/View/' . ucfirst($controller) . '/' . $controller . '.lock';
                $this->writeFile($file, 'lock');
            }
            $this->success($info);
        } catch (Exception $e) {
            $this->error($e->getMessage(), 'nojump', IS_AJAX, 3);
        }
    }

    public function getWhereList()
    {
        $table = I('post.table');
        if (empty($table)) {
            $this->error("请选择表");
        }

        $M = M();
        $sql = $sql = "SELECT " . " * FROM `information_schema`.`columns` "
            . "WHERE TABLE_SCHEMA = '" . C('DB_NAME') . "' AND table_name = '" .
            C('DB_PREFIX') . $table . "' "
            . "ORDER BY ORDINAL_POSITION";
        $tabinfo = $M->query($sql);
        $whereList = array();
        foreach ($tabinfo as $k => $v) {
            $input_type = $this->getFieldType($v);
            if (in_array($v['column_name'], $this->reservedField)) {
                unset($tabinfo[$k]);
                continue;
            }
            if ('text' === $input_type) {
                $whereList[]['column_name'] = $v['column_name'];
            }
        }
        $this->ajaxReturn($whereList);
    }

    /**
     * @param $tabinfo
     * @param $cname
     * @return array
     * @throws Exception
     */
    private function makeAdd($tabinfo, $cname)
    {
        $item = '';//表单控件
        $js = '';//表单控件对应的js
        foreach ($tabinfo as $k => $v) {
            if ('PRI' == $v['column_key'] || in_array($v['column_name'], $this->reservedField)) {
                continue;
            }
            $input_type = $this->getFieldType($v);
            $item .= $this->getItem($input_type, $v);
            $js .= $this->getJs($input_type, $v);
        }
        $code = $this->gettemp('add');
        $code = str_replace('{%{item}%}', $item, $code);
        $code = str_replace('{%{js}%}', $js, $code);
        $code = str_replace('{%{controller}%}', $cname, $code);
        $file = ROOT_PATH . trim(APP_PATH, './') . '/' . 'Admin/View/' . ucfirst($cname) . '/add.html';
        return $this->writeFile($file, $code);
    }

    /**
     * @param $tabinfo
     * @param $cname
     * @return array
     * @throws Exception
     */
    private function makeEdit($tabinfo, $cname)
    {
        $item = '';//表单控件
        $js = '';//表单控件对应的js
        $val = 'form.val("form1",{';//赋值操作
        $switch = '';//开关特殊js处理
        $checkbox = '';//复选框特殊js处理
        foreach ($tabinfo as $k => $v) {
            if ('PRI' == $v['column_key'] || in_array($v['column_name'], $this->reservedField)) {
                if ('PRI' == $v['column_key']) {
                    $item .= '<input type="hidden" name="' . $v['column_name'].
                        '" value="{$info.' . $v['column_name'] . '}">';
                }
                continue;
            }

            $input_type = $this->getFieldType($v);
            switch ($input_type) {
                case 'textarea'://文本域、富文本不从这里赋值
                case 'editor'://文本域、富文本不从这里赋值
                    break;
                case 'radio':
                    $val .= PHP_EOL . <<<EOF
                    '{$v['column_name']}': '{\$info.{$v['column_name']}}',
EOF;
                    break;
                case 'checkbox':
                    $val .= PHP_EOL . <<<EOF
                    '{$v['column_name']}': '{\$info.{$v['column_name']}}',
EOF;
                    $checkbox .= '
                    $("input.' . $v['column_name'] . '").prop("checked",false);
                    let '.$v['column_name'].' = "{$info.' . $v['column_name'] . '}";
                    if('.$v['column_name'].'.length > 0){
                    let st = "{$info.' . $v['column_name'] . '}".split(",");
                      for(let i = 0; i < st.length ;i++){
                        $("input.' . $v['column_name'] . '[value=" + st[i] + "]").prop("checked",true);
                      }
                      form.render("checkbox");
                    }
                ';

                    break;
                case 'switch':
                    $val .= PHP_EOL . <<<EOF
                    '{$v['column_name']}': '{\$info.{$v['column_name']}}',
EOF;
                    //这里有赋值
                    $switch .= <<<TAG
                      $('#{$v['column_name']}').prop('checked','{\$info.{$v['column_name']}}' === '1');
                       form.render('checkbox');
TAG;
                    break;
                default:
                    $val .= PHP_EOL . <<<EOF
                    '{$v['column_name']}': '{\$info.{$v['column_name']}}',
EOF;
                    break;
            }
            $item .= $this->getItem($input_type, $v);
            $js .= $this->getJs($input_type, $v);
        }
        $js .= rtrim($val, ',') . '});';
        $js .= $switch;
        $js .= $checkbox;
        $code = $this->gettemp('edit');
        $code = str_replace('{%{item}%}', $item, $code);
        $code = str_replace('{%{js}%}', $js, $code);
        $code = str_replace('{%{controller}%}', $cname, $code);
        $file = ROOT_PATH . trim(APP_PATH, './') . '/' . 'Admin/View/' . ucfirst($cname) . '/edit.html';
        return $this->writeFile($file, $code);
    }


    /**
     * @param $file
     * @param $code
     * @return array
     * @throws Exception
     */
    private function writeFile($file, $code)
    {
        if (!$this->overwrite) {
            if (file_exists($file)) {
                throw new Exception($file.' 文件已存在，请删除或者使用覆盖模式');
            }
        }
        $dir = dirname($file);
        if (!is_dir($dir)) {
            if (!mkd($dir)) {
                throw new Exception("{$dir} 目录创建失败，权限不足，尝试手动创建");
            }
        }
        //清除结果缓存
        clearstatcache();
        if (!is_writable($dir)) {
            throw new Exception($dir . ' 该目录没有写入权限');
        }
        $fp = fopen($file, 'w');
        $rows = fwrite($fp, $code);
        fclose($fp);
        return ['file' => $file, 'success' => $rows];
    }

    /**
     * @param $tableinfo //列数据
     * @param $cname
     * @param $list
     * @param $wherel
     * @return array
     * @throws Exception
     */
    private function makeIndex($tableinfo, $cname, $list, $wherel)
    {
        $replace_list = array(
            'controller' => $cname,
            'fields' => '',
            'where' => '',
            'add' => 'layui-hide',//隐藏按钮
            'edit' => 'layui-hide',
            'delete' => 'layui-hide',
            'select' => 'layui-hide',
        );
        $temp = $this->gettemp('index');
        $where = '';
        $fields = '';
        foreach ($tableinfo as $k => $v) {
            $input_type = $this->getFieldType($v);
            $fields .= $this->getFields($input_type, $v);
            if (in_array($v['column_name'], $this->reservedField)) {
                continue;
            }
            $where .= $this->getWhere($input_type, $v, $wherel);
        }

        $checkboxField = "";//复选框默认不要 有删除功能才需要复选框
        $toolBarField = '';//操作栏默认不要 只要有删除功能 编辑功能就加上

        //判断功能
        if (in_array('select', $list)) {
            $replace_list['select'] = '';
            $replace_list['where'] = $where;
        }

        if (in_array('add', $list)) {
            $replace_list['add'] = '';
        }

        if (in_array('edit', $list)) {
            $replace_list['edit'] = '';
            $toolBarField = "{title: '操作',templet:'#tool', width:130,fixed: \"right\", align: \"center\"}";
        }

        if (in_array('delete', $list)) {
            $checkboxField = "{type: \"checkbox\", fixed: \"left\", width: 50},";
            $toolBarField = "{title: '操作',templet:'#tool', width:130,fixed: \"right\", align: \"center\"}";
            $replace_list['delete'] = '';
        }

        $replace_list['fields'] = $checkboxField . PHP_EOL . $fields . PHP_EOL . $toolBarField;

        foreach ($replace_list as $k => $item) {
            $temp = str_replace("{%{{$k}}%}", $item, $temp);
        }
        $file = ROOT_PATH . trim(APP_PATH, './') . '/' . 'Admin/View/' . ucfirst($cname) . '/index.html';
        return $this->writeFile($file, $temp);
    }

    /**
     * 组装index页面搜索控件
     * @param $type
     * @param $col
     * @param $where
     * @return bool|mixed|string
     * @throws Exception
     */
    private function getWhere($type, $col, $where)
    {
        $temp = '';
        $replace_list = array(
            'name' => $col['column_name'],
            'title' => '',
            'attr' => '',
        );
        if ("PRI" === $col['column_key']) {
            $type = 'pri';
        }

        if (key_exists($col['column_name'], $where)) {
            $type = 'pri';
        }

        switch ($type) {
            case 'pri'://pri代表主键
                $temp = $this->gettemp('where_text');
                $replace_list['title'] = $col['column_comment'];
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'radio':
            case 'select':
            case 'switch':
                $temp = $this->gettemp('where_select');
                $cinfo = $this->getListByComment($col['column_name'], $col['column_comment']);
                $replace_list['title'] = $cinfo['field'];
                $options = '';
                foreach ($cinfo['list'] as $k => $v) {
                    $options .= "<option value='{$k}' >{$v}</option>" . PHP_EOL;
                }
                $replace_list['attr'] = $options;
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'id' :
                $temp = $this->gettemp('where_select');
                $replace_list['title'] = explode(':', $col['column_comment'])[0];
                $info = $this->dealForeignKeyList([$col])[$col['column_name']];
                $options = "
                    <volist name='{$info['table']}List' id='v'>
                    <option value='{\$v.{$info['pri']}}'>{\$v.{$info['show']}}</option>
                    </volist>
                ";
                $replace_list['attr'] = $options;
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            default:
                break;
        }
        return $temp;
    }

    /**
     * makeIndex使用 生成layui table控件表格列数据
     * @param $type string 控件类型
     * @param $v array 当前字段详细信息
     * @return string 拼装成的字符串
     * @throws Exception
     */
    private function getFields($type, $v)
    {
        switch ($type) {
            case 'image':
                $fileds = "{field:'{$v['column_name']}',title:'{$v['column_comment']}',align:'center',templet:function(d){
                return '<div><img height=\"28\" src=\"'+d.{$v['column_name']}+'\"></div>';
            }},";
                break;
            case 'radio':
            case 'select':
                $width = ",width:110";
                $cinfo = $this->getListByComment($v['column_name'], $v['column_comment']);
                $if = '';
                foreach ($cinfo['list'] as $k => $item) {
                    $if .= "if(d.{$v['column_name']} === '{$k}') return '{$item}';" . PHP_EOL;
                }
                $fileds = "{field:'{$v['column_name']}',title:'{$cinfo['field']}',align:'center',templet:function(d){
                {$if}
            }{$width}},";
                break;
            case 'switch':
                $cinfo = $this->getListByComment($v['column_name'], $v['column_comment']);
                $width = ",width:110";
                $fileds = "{field:'{$v['column_name']}',
                title:'{$cinfo['field']}',align:'center',templet:function(d){
                    if('1' === d.{$v['column_name']}) return '<div> "."<span class=\"layui-badge layui-".
                    "btn-green\">{$cinfo['list']['1']}</span>"."</div>';
                    "."if('0' === d.{$v['column_name']}) 
                    return '<div><span class=\"layui-badge\">{$cinfo['list']['0']}</span></div>';
                }{$width}},";
                break;
            case 'checkbox':
                $cinfo = $this->getListByComment($v['column_name'], $v['column_comment']);

                $json = '{';
                foreach ($cinfo['list'] as $k => $v1) {
                    $json .= "'{$k}':'{$v1}',";
                }
                $json = rtrim($json, ',') . '}';
                $if = '
                    let str ="";
                    let st = d.' . $v['column_name'] . '.split(",");
                      let arr = ' . $json . ';
                      for(let i = 0; i < st.length ;i++){
                        if(arr[st[i]]) str += arr[st[i]] + " ";
                      }
                      return str.trim();
                ';
                $fileds = "{field:'{$v['column_name']}',title:'{$cinfo['field']}',align:'center',templet:function(d){
                {$if}
            }},";
                break;
            case 'color':
                $fileds = "{field:'{$v['column_name']}',title:'{$v['column_comment']}',align:'center',templet:function(d){
                return '<div><input disabled type=\"color\" value=\"'+d.{$v['column_name']}+'\"></div>';
            }},";
                break;
            case 'id':
                $title = explode(':', $v['column_comment'])[0];
                $fileds = "{field:'{$v['column_name']}',title:'{$title}',align:'center',width:100},";
                break;
            default:
                $width = '';
                if ('PRI' === $v['column_key']) {
                    $width = ",width:80";
                }
                if (('datetime' === $v['data_type']) && ('datetime' === $type)) {
                    $width = ",width:160";
                }
                $fileds = "{field:'{$v['column_name']}',title:'{$v['column_comment']}',align:'center'{$width}},";
                break;
        }
        return $fileds;
    }

    /**
     * @param string $cname 控制器名
     * @param string $table 表名
     * @param array $wherelike 模糊搜索字段搜索
     * @param array $foreignKeyList 外联键列表
     * @return array 执行结果 + 文件名
     * @throws Exception
     */
    private function makeController($cname = 'Test', $table = 'test', $wherelike = array(), $foreignKeyList = [])
    {
        if (empty($table) || empty($cname)) {
            $this->error("请选择数据");
        }
        $date = date('Y-m-d');
        $time = date('H:i');
        $name = ucfirst($cname) . 'Controller';
        $filename = $name . '.class.php';
        $file = ROOT_PATH . trim(APP_PATH, './') . '/' . 'Admin/Controller' . '/' . $filename;
        $whereStr = "[";
        foreach ($wherelike as $k => $v) {
            $whereStr .= "'{$k}' => '{$v}',";
        }
        $whereStr = trim($whereStr, ',');
        $whereStr .= ']';
        //无外联表
        if (empty($foreignKeyList)) {
            $code = "<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: {$date}
 * Time: {$time}
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class {$cname}Controller extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        ^this->table = '{$table}';
        ^this->addTemplet = '{$cname}/add';
        ^this->editTemplet = '{$cname}/edit';
        ^this->indexTemplet = '{$cname}/index';
        ^this->whereList = {$whereStr};
    }
}
";
            $code = str_replace('^', '$', $code);
            return $this->writeFile($file, $code);
        } else {

            $fList = $this->dealForeignKeyList($foreignKeyList);
            $indexAction = $this->makeIndexAction($fList);//生成外联版index
            $addAction = $this->makeAddAction($fList);//生成外联版add
            $editAction = $this->makeEditAction($fList);//生成外联版edit
            //有外联表
            $code = "<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: {$date}
 * Time: {$time}
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class {$cname}Controller extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        ^this->table = '{$table}';
        ^this->addTemplet = '{$cname}/add';
        ^this->editTemplet = '{$cname}/edit';
        ^this->indexTemplet = '{$cname}/index';
        ^this->whereList = {$whereStr};
    }
    {$indexAction}
    {$addAction}
    {$editAction}
}
";
            $code = str_replace('^', '$', $code);
            return $this->writeFile($file, $code);
        }
    }


    /**
     * @param $v array 数据表列的数据
     * @return string 数据输入类型
     */
    protected function getFieldType(& $v)
    {
        $inputType = 'text';
        switch ($v['data_type']) {
            case 'bigint':
            case 'int':
            case 'mediumint':
            case 'smallint':
            case 'tinyint':
                $inputType = 'number';
                break;
            case 'enum':
            case 'set':
                $inputType = 'select';
                break;
            case 'decimal':
            case 'double':
            case 'float':
                $inputType = 'number';
                break;
            case 'longtext':
            case 'text':
            case 'mediumtext':
            case 'smalltext':
            case 'tinytext':
                $inputType = 'textarea';
                break;
            case 'year':
            case 'date':
            case 'time':
            case 'datetime':
            case 'timestamp':
                $inputType = 'datetime';
                break;
            default:
                break;
        }
        $fieldsName = $v['column_name'];
        // 指定后缀说明也是个时间字段
        if ($this->isMatchSuffix($fieldsName, $this->intDateSuffix)) {
            $inputType = 'datetime';
        }
        // 指定后缀结尾且类型为enum,说明是个单选框
        if ($this->isMatchSuffix($fieldsName, $this->enumRadioSuffix) && $v['data_type'] == 'enum') {
            $inputType = "radio";
        }
        // 指定后缀结尾且类型为set,说明是个复选框
        if ($this->isMatchSuffix($fieldsName, $this->setCheckboxSuffix) && $v['data_type'] == 'set') {
            $inputType = "checkbox";
        }
        // 指定后缀结尾且类型为char或tinyint且长度为1,说明是个Switch复选框
        if ($this->isMatchSuffix($fieldsName, $this->switchSuffix) &&
            ($v['data_type'] == 'tinyint' || $v['column_type'] == 'char(1)') &&
            $v['column_default'] !== '' && $v['column_default'] !== null) {
            $inputType = "switch";
        }

        // 指定后缀结尾且类型为varchar || char,文件上传
        if ($this->isMatchSuffix($fieldsName, $this->imageField) &&
            (($v['data_type'] == 'varchar') || $v['data_type'] == 'char')) {
            $inputType = "image";
        }

        // 指定后缀结尾且类型为varchar || char,文件上传
        if ($this->isMatchSuffix($fieldsName, $this->fileField) &&
            (($v['data_type'] == 'varchar') || $v['data_type'] == 'char')) {
            $inputType = "file";
        }
        //指定后缀结尾 且类型为text系列的字段 为富文本编辑器
        if ($this->isMatchSuffix($fieldsName, $this->editorField) && in_array($v['data_type'], ['longtext','mediumtext','text','smalltext','tinytext'])) {
            $inputType = "editor";
        }
        //指定后缀结尾 且类型为input系列的字段 为颜色选择器
        if ($this->isMatchSuffix($fieldsName, $this->colorField) && (($v['data_type'] == 'varchar') || $v['data_type'] == 'char')) {
            $inputType = "color";
        }
        //指定后缀结尾 且类型为number系列的字段 为其他表主键
        if ($this->isMatchSuffix($fieldsName, $this->otherTableId) && (in_array($v['data_type'], ['tinyint','smallint','mediumint','int','bigint']))) {
            $inputType = "id";
        }
        return $inputType;
    }

    /**
     * @param $field string 字段名
     * @param $comment string 字段注释
     * @return array 字段对应的列表
     * @throws Exception 注释格式不正确
     */
    private function getListByComment($field, $comment)
    {
        $res = array();
        $info = explode(':', rtrim($comment, ','));
        if (!(is_array($res) && !empty($info))) {
            throw new Exception('数据表字段 ' . $field . ' 注释格式不正确');
        }

        $res['field'] = $info[0];
        $list = explode(',', $info[1]);
        foreach ($list as $k => $v) {
            $t = explode('=', $v);
            $res['list'][$t[0]] = $t[1];
        }
        return $res;
    }

    /**
     * @param $type
     * @param $col
     * @return bool|mixed|string
     * @throws Exception
     */
    private function getItem($type, $col)
    {
        $replace_list = array(
            'name' => $col['column_name'],
            'title' => '',
            'required1' => ('NO' == $col['is_nullable'] ? '<b style="color: red">* </b>' : ''),
            'required2' => '',
            'attr' => '',
            'text' => '',//开关使用
            'value' => '',//文本域以及富文本编辑器使用
        );
        switch ($type) {
            case 'number':
                $temp = $this->gettemp('number');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required|number" lay-verType="tips"  ';
                }
                $replace_list['attr'] = ' step="' . 1 / pow(10, $col['numeric_scale'])
                    . '" value="'.$col['column_default'] . '" ';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'text':
                $temp = $this->gettemp('text');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = ' maxlength="'.
                    $col['character_maximum_length'] . '" value="' .
                    $col['column_default'] . '" ';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'color':
                $temp = $this->gettemp('color');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = '" value="' .
                    $col['column_default'] . '" ';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'select':
                $temp = $this->gettemp('select');
                $cinfo = $this->getListByComment($col['column_name'], $col['column_comment']);
                $replace_list['title'] = $cinfo['field'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="msg"  ';
                }
                $options = '';
                foreach ($cinfo['list'] as $k => $v) {
                    $checked = $k == $col['column_default'] ? 'selected' : '';
                    $options .= "<option value={$k} {$checked} >{$v}</option>" . PHP_EOL;
                }
                $replace_list['attr'] = $options;
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'radio':
                $temp = $this->gettemp('radio');
                $cinfo = $this->getListByComment($col['column_name'], $col['column_comment']);
                $replace_list['title'] = $cinfo['field'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="msg"  ';
                }
                $radio = '';
                foreach ($cinfo['list'] as $k => $v) {
                    $checked = $k == $col['column_default'] ? 'checked' : '';
                    $radio .= '<input type="radio" name="' . $col['column_name'] .
                        '" value="' . $k . '" title="' . $v . '" ' . $checked .
                        ' >' . PHP_EOL;
                }
                $replace_list['attr'] = $radio;
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'checkbox':
                $temp = $this->gettemp('checkbox');
                $cinfo = $this->getListByComment($col['column_name'], $col['column_comment']);
                $replace_list['title'] = $cinfo['field'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="msg"  ';
                }
                $checkbox = '';
                foreach ($cinfo['list'] as $k => $v) {
                    $checked = $k == $col['column_default'] ? 'checked' : '';
                    $checkbox .= '<input class="' . $col['column_name'] . '"
                     type="checkbox" name="' . $col['column_name'] . '[]" title="' .
                        $v . '" value="' . $k . '" lay-skin="primary"   ' .
                        $checked . ' >' . PHP_EOL;
                }
                $replace_list['attr'] = $checkbox;
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'datetime':
                $temp = $this->gettemp('datetime');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = '';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'textarea':
                $temp = $this->gettemp('textarea');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = '';
                $replace_list['value'] = "{\$info.{$col['column_name']}}";
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'image':
                $temp = $this->gettemp('image');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = '';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'file':
                $temp = $this->gettemp('file');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = '';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'switch':
                $temp = $this->gettemp('switch');
                $cinfo = $this->getListByComment($col['column_name'], $col['column_comment']);
                $replace_list['title'] = $cinfo['field'];

                $replace_list['required2'] = 0 == $col['column_default'] ? '' : 'checked';
                $replace_list['attr'] = $col['column_default'];



                $replace_list['text'] = $cinfo['list']['1'] . '|' . $cinfo['list']['0'];

                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'editor':
                $temp = $this->gettemp('textarea');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="msg"  ';
                }
                $replace_list['attr'] = '';
                $replace_list['value'] = "{\$info.{$col['column_name']}|htmlspecialchars_decode}";
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            case 'id':
                $temp = $this->gettemp('id');
                $replace_list['title'] = explode(':',$col['column_comment'])[0];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $info = $this->dealForeignKeyList([$col])[$col['column_name']];
                $replace_list['attr'] = "
                <volist name='{$info['table']}List' id='v'>
                    <option value='{\$v.{$info['pri']}}'>{\$v.{$info['show']}}</option>
                </volist>
                ";
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
            default:
                $temp = $this->gettemp('text');
                $replace_list['title'] = $col['column_comment'];
                if (!empty($replace_list['required1'])) {
                    $replace_list['required2'] = ' lay-verify="required" lay-verType="tips"  ';
                }
                $replace_list['attr'] = ' maxlength="' .
                    $col['character_maximum_length'] . '" value="' . $col['column_default'] . '" ';
                foreach ($replace_list as $k => $v) {
                    $temp = str_replace("{%{{$k}}%}", $v, $temp);
                }
                break;
        }
        return $temp;
    }


    /**
     * @param $type
     * @param $col
     * @return bool|mixed|string
     */
    private function getJs($type, $col)
    {
        $js = '';
        $t = $col['data_type'];
/*        !in_array($t, ['date', 'time', 'year', 'month', 'datetime']) && $t = 'datetime';*/
        switch ($type) {
            case 'datetime':
                $js = "laydate.render({
                          elem: '#{$col['column_name']}'
                          ,theme: '#01AAED'
                          ,type: '{$t}'
                          ,trigger: 'click'
                        });";
                break;
            //,url: '{:U("FileUpload/upload")}'
            case 'image':
                $js = 'upload.render({
            elem: "#' . $col['column_name'] . '"
            ,url: "/admin/FileUpload/upload"
            ,before:function(){
                layer.msg("图片上传中",{icon:16,time:false});
            }
            ,done: function(res){
                let item = this.item;
                layer.closeAll();
                if(res.code === 0){
                    layer.msg("上传成功",{icon:1});
                    $(item).val(res.data.src);
                }else{
                    layer.alert(res.msg);
                }
            }
        });
        $("#' . $col['column_name'] . '").hover(function(){
            let _this = $(this);
            if(_this.val() !== \'\'){
                $(\'#' . $col['column_name'] . '_show\').attr("src",_this.val()).slideDown();
            }
        },function(){
            $(\'#' . $col['column_name'] . '_show\').slideUp();
        });
        ';
                break;
            case 'file':
                $js = 'upload.render({
            elem: "#' . $col['column_name'] . '"
            ,url: "/admin/FileUpload/uploadfile"
            ,accept: "file"
            ,before:function(){
                layer.msg("文件上传中",{icon:16,time:false});
            }
            ,done: function(res){
                let item = this.item;
                layer.closeAll();
                if(res.code === 0){
                    layer.msg("上传成功",{icon:1});
                    $(item).val(res.data.src);
                }else{
                    layer.alert(res.msg);
                }
            }
        });';
                break;
            case 'switch':
                $js = "form.on('switch({$col['column_name']})', function(data){
                            let v = '0';
                            if(data.elem.checked) v = '1';
                            $('input[name={$col['column_name']}]').val(v);
                        }); ";
                break;
            case 'editor':
                $js = "
                    let {$col['column_name']} = layedit.build('{$col['column_name']}', {
                        uploadImage: {url: '/admin/FileUpload/upload', type: 'post'},
                        height:200
                    });
                    $(\"iframe[textarea={$col['column_name']}]\").contents().find(\"body\").blur(function(){
            layedit.sync({$col['column_name']});
        });
                ";
                break;
            default:
                break;
        }
        return empty($js) ? $js : PHP_EOL . $js . PHP_EOL;
    }

    /**
     * 得到公共模板
     * @param $name string 模板名
     * @return bool|string
     */
    private function gettemp($name)
    {
        return file_get_contents(ROOT_PATH . trim(APP_PATH, './') . '/Common/View/' . $name . '.html');
    }

    /**
     * 判断是否符合指定后缀
     * @param string $field 字段名称
     * @param mixed $suffixArr 后缀
     * @return boolean
     */
    protected function isMatchSuffix($field, $suffixArr)
    {
        $suffixArr = is_array($suffixArr) ? $suffixArr : explode(',', $suffixArr);
        foreach ($suffixArr as $k => $v) {
            if (preg_match("/{$v}$/i", $field)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 判断控件类型对应的注释是否有效
     * @param $type
     * @param $filed
     * @param $comment
     * @param $mess string 错误原因
     * @return bool
     */
    protected function judgeComment($type, $filed = '', $comment = '', &$mess)
    {
        $res = true;
        $mess = '';
        switch ($type) {
            case 'radio':
            case 'checkbox':
            case 'select':
                $tmpArr = explode(':', $comment);
                if (2 != count($tmpArr)) {
                    $res = false;
                    $mess = '注释格式有误';
                }
                $tmpArr1 = explode(',' ,trim($tmpArr[1], ','));
                if (count($tmpArr1) < 2) {
                    $res = false;
                    $mess = '注释格式有误';
                }
                $key = array();
                $val = array();
                foreach ($tmpArr1 as $k => $v) {
                    $tmpArr2 = explode('=', $v);
                    if (2 != count($tmpArr2)) {
                        $res = false;
                        $mess .= '<br>键值对不匹配';
                    }
                    if (in_array($tmpArr2[0], $key)) {
                        $res = false;
                        $mess .= '<br> 键重复出现';
                    } else {
                        array_push($key, $tmpArr2[0]);
                    }

                    if (in_array($tmpArr2[1], $val)) {
                        $res = false;
                        $mess .= '<br> 值重复出现';
                    } else {
                        array_push($val, $tmpArr2[1]);
                    }
                }
                break;
            case 'switch':
                $tmpArr = explode(':', $comment);
                if (2 != count($tmpArr)) {
                    $res = false;
                    $mess = '注释格式有误';
                }
                $tmpArr1 = explode(',' ,$tmpArr[1]);
                if (count($tmpArr1) != 2) {
                    $res = false;
                    $mess = '注释格式有误';
                }
                $key = array();
                $val = array();
                foreach ($tmpArr1 as $k => $v) {
                    $tmpArr2 = explode('=', $v);
                    if (2 != count($tmpArr2)) {
                        $res = false;
                        $mess .= '<br> 键值对不匹配';
                    }
                    if (in_array($tmpArr2[0], $key)) {
                        $res = false;
                        $mess .= '<br> 键重复出现';
                    } else {
                        array_push($key, $tmpArr2[0]);
                    }

                    if (in_array($tmpArr2[1], $val)) {
                        $res = false;
                        $mess .= '<br> 值重复出现';
                    } else {
                        array_push($val, $tmpArr2[1]);
                    }

                    if (!in_array($tmpArr2[0], ['0','1'])) {
                        $res = false;
                        $mess .= '<br> switch字段key只能为0或者1';
                    }
                }
                break;
            case 'id':
                $tmpArr = explode('_', $filed);
                array_pop($tmpArr);
                $tName = implode('_',$tmpArr);

                $M = M();
                $sql = "SELECT " . " * FROM `information_schema`.`columns` "
                    . "WHERE TABLE_SCHEMA = '" . C('DB_NAME') . "' AND table_name = '" . C('DB_PREFIX') . $tName . "' "
                    . "ORDER BY ORDINAL_POSITION";
                $tabinfo = $M->query($sql);

                $tmpArr1 = explode(':', $comment);
                if (count($tmpArr1) != 3) {
                    $res = false;
                    $mess = '注释格式有误';
                }

                if (empty($tabinfo)) {
                    $res = false;
                    $mess .= '<br>表'.$tName.'不存在';
                }

                $filedList = array_column($tabinfo, 'column_name');

                //主键列
                if (!in_array($tmpArr1[1],$filedList)) {
                    $res = false;
                    $mess .= '<br>列：'.$tmpArr1[1].'在表'. $tName.'中不存在';
                } else {
                    $k1 = array_search('id', $filedList);
                    if ($tabinfo[$k1]['column_key'] !== 'PRI') {
                        $res = false;
                        $mess .= '<br>列：'.$tmpArr1[1].'在表'. $tName.'中必须是主键';
                    }
                }
                if (!in_array($tmpArr1[2],$filedList)) {
                    $res = false;
                    $mess .= '<br>列：'.$tmpArr1[2].'在表'. $tName.'中不存在';
                }
                break;
            default:
                break;
        }
        if (empty($comment)) {
            $res = false;
            $mess = '注释不可为空';
        }
        $mess .= '<br>注释内容：<b style="color: #dd4444">' .$comment .'</b>';
        return $res;
    }

    /**处理外联表数据
     * @param $list
     * @return array|string
     */
    private function dealForeignKeyList($list)
    {
        if (empty($list)) {
            return '';
        }
        if (count($list) > 7) {
            return '最多8表联查';
        }
        $res = array();
        //最多八表联查
        $alias = ['b','c','d','e','f','g','h'];
        foreach ($list as $k => $v) {
            $tmpArr = explode('_', $v['column_name']);
            array_pop($tmpArr);
            $tName = implode('_',$tmpArr);
            $res[$v['column_name']]['table'] = $tName;
            $res[$v['column_name']]['tableAlias'] = $alias[$k];

            $tmpArr1 = explode(':', $v['column_comment']);
            $res[$v['column_name']]['pri'] = $tmpArr1[1];
            $res[$v['column_name']]['show'] = $tmpArr1[2];
            $res[$v['column_name']]['required'] = $v['is_nullable'];
            //外联字段的required 决定使用left 还是inner
        }
        return $res;
    }


    /**
     *  有外联数据的表index方法
     * @param $fList
     * @return mixed|string
     */
    private function makeIndexAction($fList)
    {
        $fktList = '';
        $filed = "->field('a.*";//数据列
        $join = "";//join字符串
        $joinType = 'inner';
        foreach ($fList as $k => $v) {
            $filed .= ",{$v['tableAlias']}.`{$v['show']}` as {$v['table']}_{$v['pri']}";
            if ('YES' === $v['required']) {
                $joinType = 'left';
            }
            $join .= "                  ->join(C('DB_PREFIX').'{$v['table']} as {$v['tableAlias']} on {$v['tableAlias']}.`{$v['pri']}`=a.`{$k}`','{$joinType}')".PHP_EOL;
            $fktList .= "           ^{$v['table']}List = M('{$v['table']}')->field('{$v['pri']},{$v['show']}')->select();" . PHP_EOL;
            $fktList .= "           ^this->assign('{$v['table']}List',^{$v['table']}List);" . PHP_EOL;
        }
        $filed .= "')" . PHP_EOL;

        $code = <<<tag
public function index()
    {
        if (IS_AJAX) {
            ^where = " 1 ";
            ^data = ^_POST;
            parse_str(^data['para'], ^wherearray);
            ^wherearray = I('data.', '', C('DEFAULT_FILTER'), ^wherearray);
            ^page = empty(^data['page']) ? 1 : ^data['page'];
            ^limit = empty(^data['limit']) ? 15 : ^data['limit'];
            ^whereList = ^this->whereList;
            foreach (^wherearray as ^k => ^v) {
                if (isset(^v) && (strlen(^v) > 0)) {
                    if (key_exists(^k, ^whereList)) {
                        if ('eq' === ^whereList[^k]) {
                            ^where .= " and a.`{^k}`='{^v}' ";
                        } else {
                            ^where .= " and a.`{^k}` like '%{^v}%' ";
                        }
                    } else {
                        ^where .= " and a.`{^k}`='{^v}' ";
                    }
                }
            }

            ^list = M(^this->table . ' as a')
                {$filed}{$join}                 ->where(^where)
                ->limit((^page - 1) * ^limit, ^limit)
                ->select();
            ^count = M(^this->table . ' as a')
            {$join}                 ->where(^where)
            ->count();
            ^res = array(
                'code' => 0
            , 'count' => ^count
            , 'msg' => ''
            , 'data' => ^list
            );
            ^this->ajaxReturn(^res);
        } elseif (IS_GET) {
            {$fktList}
            ^this->display(^this->indexTemplet);
        }
    }
tag;
        $code = str_replace('^', '$', $code);
        return $code;
    }

    private function makeAddAction($fList)
    {
        $fktList = '';
        foreach ($fList as $k => $v) {
            $fktList .= "           ^{$v['table']}List = M('{$v['table']}')->field('{$v['pri']},{$v['show']}')->select();" . PHP_EOL;
            $fktList .= "           ^this->assign('{$v['table']}List',^{$v['table']}List);" . PHP_EOL;
        }
        $code = <<<tag
public function add()
    {
        if (IS_AJAX) {
            try {
                parse_str(^_POST['para'], ^data);
                ^data = I('data.', '', C('DEFAULT_FILTER'), ^data);
                foreach (^data as ^k => ^v) {
                    if (is_array(^v)) {
                        ^data[^k] = implode(^v, ',');
                    }
                }
                M(^this->table)->add(^data) ? ^this->success('添加成功') : ^this->error('网络故障');
            } catch (Exception ^e) {
                ^this->error("预期之外的错误，错误ID号：".^e->getErrorID());
            }
        } elseif (IS_GET) {
{$fktList}
            ^this->display(^this->addTemplet);
        }
    }
tag;
        $code = str_replace('^', '$', $code);
        return $code;
    }

    private function makeEditAction($fList)
    {
        $fktList = '';
        foreach ($fList as $k => $v) {
            $fktList .= "           ^{$v['table']}List = M('{$v['table']}')->field('{$v['pri']},{$v['show']}')->select();" . PHP_EOL;
            $fktList .= "           ^this->assign('{$v['table']}List',^{$v['table']}List);" . PHP_EOL;
        }
        $code = <<<tag
    public function edit()
    {
        if (IS_GET && (!IS_AJAX)) {
            ^info = M(^this->table)->getByid(I('get.id'));
            ^this->assign('info', ^info);
            {$fktList}
            ^this->display(^this->editTemplet);
        } elseif (IS_AJAX) {
            try {
                ^data = [];
                parse_str(^_POST['para'], ^data);
                ^data = I('data.', '', C('DEFAULT_FILTER'), ^data);
                foreach (^data as ^k => ^v) {
                    if (is_array(^v)) {
                        ^data[^k] = implode(^v, ',');
                    }
                }
                ^row = M(^this->table)->save(^data);
                ^row === false ? ^this->error('网络故障') : ^row === 0 ?
                    ^this->error('数据无改动', 'nojump', IS_AJAX, 2) : ^this->success('操作成功');
            } catch (Exception ^e) {
                ^this->error("预期之外的错误，错误ID号：".^e->getErrorID());
            }
        }
    }
tag;
        $code = str_replace('^', '$', $code);
        return $code;
    }
}
