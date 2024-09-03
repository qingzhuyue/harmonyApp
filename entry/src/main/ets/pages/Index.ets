import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello 鸿蒙！';

  build() {
    RelativeContainer() {
      Row() {
        Column() {
          Text(this.message)
            .id('HelloWorld')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
          // 添加按钮，以响应用户点击
          Button() {
            Text('下一页')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
          }
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('40%')
          .height('5%')
          .onClick(()=>{
            router.pushUrl({url:"pages/Second"}).then(()=>{
              console.log("开始跳转其他页面")
            }).catch(()=>{
              console.log("跳转路由报错")
            })
          })
        }
        .width('100%')
      }
      .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}