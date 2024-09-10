import { router } from '@kit.ArkUI';
import { webview } from "@kit.ArkWeb"
import { BusinessError } from '@kit.BasicServicesKit';
import CommonConstants from "../common/constants/Contants"

class routerParams {
  src: string

  constructor(str: string) {
    this.src = str;
  }
}

@Entry
@Preview
@Component
struct Index {
  @State message: string = 'Hello 鸿蒙';
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Row({ space: 5 }) {
        Row()
          .width("30%")
          .height(50)
          .backgroundColor("red")
        Row()
          .width("30%")
          .height(50)
          .backgroundColor("blue")
      }
      .width("90%")
      .height('100%')
      .border({ width: 1 })

    }
    .height('100%')
    .width('100%')
  }
}