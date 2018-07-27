/**
 * toast提示函数
 * @param text 提示内容主题
 * @param head 提示头 如果是数字，那就是icon 0=>success 1=>error 2=>info  3=>warning
 * @param icon 图标 0=>success 1=>error 2=>info  3=>warning
 * @param postition 定位
 */
function toast(text,head,icon,postition){
    var ob = {text:text};
    if(typeof head === "string"){
        ob.heading = head;
    }else if (typeof head === "number") {
        switch (head){
            case 0:
                ob.icon = 'success';
                ob.heading = '成功';
                break;
            case 1:
                ob.icon = 'error';
                ob.heading = '错误';
                break;
            case 2:
                ob.icon = 'info';
                ob.heading = '提示';
                break;
            case 3:
                ob.icon = 'warning';
                ob.heading = '警告';
                break;
            default:
                ob.icon = 'info';
                ob.heading = '提示';
                break;
        }
    }
    if(typeof icon === 'string' || typeof icon === 'number'){
        if(typeof icon === 'number'){
            switch (icon){
                case 0:
                    ob.icon = 'success';
                    break;
                case 1:
                    ob.icon = 'error';
                    break;
                case 2:
                    ob.icon = 'info';
                    break;
                case 3:
                    ob.icon = 'warning';
                    break;
                default:
                    ob.icon = 'info';
                    break;
            }
        }else{
            ob.icon = icon;
        }
    }
    if(typeof postition === 'string'){
        ob.position = postition;
    }
    $.toast(ob);
}