import { promptAction } from '@kit.ArkUI';
import CommonConstants from '../constants/Contants';
import Logger from './Logger';



/**
 * 公共方法
 */

export class CommonUtils{
  public showToastContent(content: Resource | string): void {
    promptAction.showToast({
      message: content,
      duration: CommonConstants.TOAST_DURATION
    });
  }
  private loginCheckArkTS(account: string, password: string): Resource | string {
    let check: string = '';
    if (account === '') {
      return $r('app.string.please_input_account');
    } else if (password === '') {
      return $r('app.string.please_input_password');
    } else if(!CommonConstants.PHONE_REG.test(account)){
      return '请输入正确的手机号码'
    }else {
      check = CommonConstants.LOGIN_TEXT;
    }
    return check;
  }

  public loginArkTS(account: string, password: string): Resource | string {
    let check: Resource | string = this.loginCheckArkTS(account, password);
    if (CommonConstants.LOGIN_TEXT !== check) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, '账号或者密码为空');
      this.showToastContent(check);
      return "";
    }
     return CommonConstants.LOGIN_TEXT
  }
}

export default new CommonUtils();