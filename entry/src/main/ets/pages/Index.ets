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
  private bgColors: Color[] =
    [Color.Red, Color.Orange, Color.Black, Color.Yellow, Color.Green, Color.Pink, Color.Gray, Color.Blue, Color.Brown];

  build() {
    Column() {
      GridRow({
        columns: 5, // 设置布局列数
        gutter: { x: 5, y: 20 }, // 栅格布局的间距
        breakpoints: {
          value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize
        },
      }) {
        ForEach(this.bgColors, (color:string) => {
          GridCol({ span: { xs: 1,sm:2,md:3,lg:4 } }){
            Row().width("100%").height("80vp")
          }.backgroundColor(color).borderWidth(2)
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}