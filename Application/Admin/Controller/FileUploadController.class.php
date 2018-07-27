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
//         佛祖保佑       永无BUG     永不修改                        //
////////////////////////////////////////////////////////////////////
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2017/12/14
 * Time: 16:36
 */

namespace Admin\Controller;

use Common\Controller\PublicBaseController;
use OSS\Core\OssException;
use OSS\OssClient;
use Think\Log;
use Think\Upload;

class FileUploadController extends PublicBaseController {

	/**
	 * @param bool $return
	 * @return string $return = true 有返回值
	 */
	public function upload($return = false) {
		$config = array(
			'maxSize' => 314572800,
			'rootPath' => './Public/Uploads/img/',
			'savePath' => '',
			'saveName' => array('uniqid', ''),
			'exts' => array('jpg', 'gif', 'png', 'jpeg'),
			'autoSub' => true,
			'subName' => array('date', 'Ymd'),
		);
		$upload = new Upload($config); // 实例化上传类
		$info = $upload->uploadOne($_FILES['file']);
		$res = array(
			'code' => 0,
			'msg' => '',
			'data' => array(
				'src' => '',
				'title' => '',
			),
		);

		if ($info) {
			$res['data']['src'] = ltrim($config['rootPath'], '.') . $info['savepath'] . $info['savename'];
			$res['data']['title'] = $info['name'];
		} else {
			$res['code'] = 1;
			$res['msg'] = $upload->getError();
		}
		//判断是否阿里云上传 如果是阿里云
		$file = ROOT_PATH . ltrim($config['rootPath'], '.') . $info['savepath'] . $info['savename'];
		if (file_exists($file)) {
			$mess = '';
			if ('oss' == C('UPLOAD_TYPE') || empty(C('UPLOAD_TYPE'))) {
				$f = $this->upload_alioss('images/' . $info['savepath'] . $info['savename'], $file, $mess);
				if ($f) {
					//删除本地文件
					unlink($file);
					$res['data']['src'] = $mess;
				} else {
					$res['msg'] = $mess;
				}
			}
		}
		if ($return) {
			return json_encode($res);
		}
		$this->ajaxReturn($res);
	}

    /**
     * @param bool $return
     * @return string $return = true 有返回值
     */
    public function uploadfile($return = false) {
        $config = array(
            'maxSize' => 314572800,
            'rootPath' => './Public/Uploads/file/',
            'savePath' => '',
            'saveName' => array('uniqid', ''),
            'autoSub' => true,
            'subName' => array('date', 'Ymd'),
        );
        $upload = new Upload($config); // 实例化上传类
        $info = $upload->uploadOne($_FILES['file']);
        $res = array(
            'code' => 0,
            'msg' => '',
            'data' => array(
                'src' => '',
                'title' => '',
            ),
        );

        if ($info) {
            $res['data']['src'] = ltrim($config['rootPath'], '.') . $info['savepath'] . $info['savename'];
            $res['data']['title'] = $info['name'];
        } else {
            $res['code'] = 1;
            $res['msg'] = $upload->getError();
        }
        //判断是否阿里云上传 如果是阿里云
        $file = ROOT_PATH . ltrim($config['rootPath'], '.') . $info['savepath'] . $info['savename'];
        if (file_exists($file)) {
            $mess = '';
            if ('oss' == C('UPLOAD_TYPE') || empty(C('UPLOAD_TYPE'))) {
                $f = $this->upload_alioss('images/' . $info['savepath'] . $info['savename'], $file, $mess);
                if ($f) {
                    //删除本地文件
                    unlink($file);
                    $res['data']['src'] = $mess;
                } else {
                    $res['msg'] = $mess;
                }
            }
        }
        if ($return) {
            return json_encode($res);
        }
        $this->ajaxReturn($res);
    }

	public function uploads() {
		$config = array(
			'maxSize' => 3145728,
			'rootPath' => './Public/Uploads/img/',
			'savePath' => '',
			'saveName' => array('uniqid', ''),
			'exts' => array('jpg', 'gif', 'png', 'jpeg'),
			'autoSub' => true,
			'subName' => array('date', 'Ymd'),
		);
		$upload = new Upload($config); // 实例化上传类
		$info = $upload->upload();
		if ($info) {
			$this->success($info, '', true);
		} else {
			$this->error($upload->getError(), '', true);
		}
	}

	//删除已经上传的文件
	public function delUploadedFile() {
		$src = I("param.src");
		if (filter_var($src, FILTER_VALIDATE_URL)) {
			//阿里云删除
			vendor("Alioss.autoload");
			$config = C('ALIOSSCONF');
			try {
				$oss = new OssClient($config['KEY'], $config['SECRET'], $config['ENDPOINT']);
				$oss->deleteObject($config['BUCKET'], ltrim(parse_url($src, PHP_URL_PATH), '/'));
			} catch (OssException $e) {
				$info = $e->getErrorMessage() . ' ' . $e->getMessage() . ' ' . $e->getErrorCode();
				Log::write('^^^^^' . $info, 'ERR');
				echo $info;
			}
		} else {
			if (file_exists(ROOT_PATH . $src)) {
				unlink(ROOT_PATH . $src);
			}
		}

	}
	//上传文件到阿里云oss
	/**
	 * @param $dst string 目标地址
	 * @param $src string 源文件
	 * @param $info string 错误信息
	 * @return bool
	 */
	public function upload_alioss($dst, $src, &$info) {
		//先上传到本地  受本地限制
		vendor("Alioss.autoload");
		$config = C('ALIOSSCONF');
		try {
			$oss = new OssClient($config['KEY'], $config['SECRET'], $config['ENDPOINT']);
			$oss->uploadFile($config['BUCKET'], $dst, $src);
			$info = "https://" . $config['BUCKET'] . '.' . $config['ENDPOINT'] . '/' . $dst;
			return true;
		} catch (OssException $e) {
			$info = $e->getErrorMessage() . ' ' . $e->getMessage() . ' ' . $e->getErrorCode();
			Log::write('^^^^^' . $info, 'ERR');
			return false;
		}
	}
}