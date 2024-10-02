import { router } from '@kit.ArkUI';
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
}

export default new CommonUtils();