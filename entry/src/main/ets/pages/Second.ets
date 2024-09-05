import { common, Want } from '@kit.AbilityKit';
import { router } from "@kit.ArkUI"

class routerParams {
  src: string = ''
}

@Entry
@Component
struct Second {
  @State message: string = '这是第二个页面哈';
  private context = getContext(this) as common.UIAbilityContext;
  @State params: routerParams = router.getParams() as routerParams;
  @State src: string = this.params.src;

  startAbilityTest(): void {
    let want: Want = {
      // Want参数信息
    };
    this.context.startAbility(want);
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('SecondHelloWorld')
        .fontSize(50)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Text(this.src)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}